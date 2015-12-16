L.Control.TocWmsLayerTree = L.Control.LayerTree.extend({
  options: {
    wmsUrl: "",
    wmsLayerNamePrefix: "",
    wmsParams: {},
    tocNameBlacklist: {}
  },

  initialize: function (toc, options) {
    L.setOptions(this, options)

    // Build layerTree from TOC
    this._wmsLayerNameIndex = {}
    this._wmsLayerFullNameIndex = {}
    this._layerTree = this.tocNodeToLayerTree(toc, true)
    if (!this._layerTree) {
      console.log("TOC could not be converted to a LayerTree.")
      console.log(toc)
      return
    }

    this._lastZIndex = 0
    this._handlingClick = false
  },

  tocNodeToLayerTree: function (tocNode, indexWmsLayerNames) {
    switch (tocNode.element_type) {
      case "TOC": // break intentionally omitted, TOC and GROUP handled identically
      case "GROUP":
        return this._tocGroupToLayerTreeGroup(tocNode, indexWmsLayerNames)
      case "LAYER":
        return this._tocLayerToLayerTreeLayer(tocNode, indexWmsLayerNames)
      default:
        console.log("Unknown TOC element_type", toc.element_type, toc)
        return false
    }
  },

  _tocGroupToLayerTreeGroup: function (tocGroup, indexWmsLayerNames) {
    var layerTreeGroup = new L.Control.LayerTree.GroupNode(tocGroup.name, {
      collapsed: !tocGroup.expanded
    })

    for (var i in tocGroup.layersAndGroups) {
      var layerOrGroup = tocGroup.layersAndGroups[i]
      if (this.options.tocNameBlacklist[layerOrGroup.name]) {
        continue
      }

      var layerTreeChildNode = this.tocNodeToLayerTree(layerOrGroup, indexWmsLayerNames)
      if (layerTreeChildNode) {
        layerTreeGroup.pushChild(layerTreeChildNode)
      }
    }

    return layerTreeGroup
  },

  _tocLayerToLayerTreeLayer: function (tocLayer, indexWmsLayerNames) {
    var wmsLayerName = tocLayer.asWmsLayerName(),
        wmsLayerFullName = this.options.wmsLayerNamePrefix + wmsLayerName,
        layerWmsParams = L.extend({layers: wmsLayerFullName}, this.options.wmsParams)

    var leafletLayer = L.tileLayer.wms(this.options.wmsUrl, layerWmsParams)

    var layerTreeLayer = new L.Control.LayerTree.LayerNode(leafletLayer, tocLayer.name, {
      controllable: tocLayer.visible,
      wmsLayerName: wmsLayerName,
      wmsLayerFullName: wmsLayerFullName
    })

    if (indexWmsLayerNames) {
      this._wmsLayerNameIndex[wmsLayerName] = layerTreeLayer
      this._wmsLayerFullNameIndex[wmsLayerFullName] = layerTreeLayer
    }

    return layerTreeLayer
  },

  showFeatureInfoAt: function (latlng) {
    var self = this
    $.ajax({
      url: this.getFeatureInfoUrl(latlng),
      success: function (data, status, xhr) {
        if (!data["type"] || data["type"] != "FeatureCollection") {
          console.log("ERROR, " + status, data)
          return
        }

        featuresBinnedByLayer = {}

        for (var i in data["features"]) {
          var featureInfoLayer = data["features"][i]
          // "level003.fid--31a21ba6_14ffeac6262_-15b9" --> "level003"
          // namespace is missing, hence wmsLayerName instead of wmsLayerFullName
          var featureInfoLayerWmsName = featureInfoLayer["id"].split(".")[0]

          if (featureInfoLayerWmsName in featuresBinnedByLayer) {
            featuresBinnedByLayer[featureInfoLayerWmsName].push(featureInfoLayer)
          } else {
            featuresBinnedByLayer[featureInfoLayerWmsName] = [featureInfoLayer]
          }
        }

        var popupContent = $("<div>")
        $("<h2>").text("Features near " + latlng).appendTo(popupContent)
        var layersContainer = $("<div>").appendTo(popupContent)

        for (var featureInfoLayerWmsName in featuresBinnedByLayer) {
          var layerTreeLayer = self._wmsLayerNameIndex[featureInfoLayerWmsName]
          var layerFeatures = featuresBinnedByLayer[featureInfoLayerWmsName]

          // Prepend to make the uppermost layers appear on top.
          var layerContainer = $("<div>").prependTo(layersContainer)

          $("<h3>").css({margin: "10px 0 0 0"}).html(layerTreeLayer.name + " (layer " + featureInfoLayerWmsName + ")").appendTo(layerContainer)

          var headings = []
          for (var i in layerFeatures) {
            for (var heading in layerFeatures[i]["properties"]) {
              if (!(heading in headings)) {
                headings.push(heading)
              }
            }
          }

          var layerTable = $("<table>").appendTo(layerContainer),
              layerThead = $("<thead>").appendTo(layerTable),
              layerTbody = $("<tbody>").appendTo(layerTable)

          for (var h in headings) {
            $("<th>").text(headings[h]).appendTo(layerThead)
          }

          for (var i in layerFeatures) {
            var featureTr = $("<tr>").appendTo(layerTbody)
            for (var h in headings) {
              $("<td>").text(layerFeatures[i]["properties"][headings[h]]).appendTo(featureTr)
            }
          }
        }

        L.popup({maxWidth: 400, maxHeight: 350})
          .setLatLng(latlng)
          .setContent(popupContent.get(0))
          .openOn(self._map)
      },
      error: function (xhr, status, error) {
        console.log("ERROR, " + status + ", " + error + "")
      }
    })
  },

  findLayerNodeByWmsLayerName: function (wmsLayerName) {
    return this._layerTree.find(function (node) {
      return !node.canHaveChildren && (node.options.wmsLayerName == wmsLayerName)
    })
  },

  getFeatureInfoUrl: function (latlng) {
    var point = this._map.latLngToContainerPoint(latlng, this._map.getZoom()),
        size = this._map.getSize(),
        visibleLayerFullNames = this.mapVisibleLayersInTree(function (node) {
          return node.options.wmsLayerFullName
        }).join(","),
        params = {
          request: 'GetFeatureInfo',
          service: 'WMS',
          srs: 'EPSG:4326', //this._map.options.crs.code,
          bbox: this._map.getBounds().toBBoxString(),
          height: size.y,
          width: size.x,
          layers: visibleLayerFullNames,
          query_layers: visibleLayerFullNames,
          info_format: 'application/json',
          x: point.x,
          y: point.y,
          i: point.x,
          j: point.y,
          buffer: 5,
          feature_count: 50
        }

    return this.options.wmsUrl + L.Util.getParamString(params, this.options.wmsUrl, true)
  },

  getVisibleLayersInTree: function () {
    return this.mapVisibleLayersInTree(function (node) {
      return node
    })
  },

  mapVisibleLayersInTree: function (mapFunction) {
    return this._layerTree.accumulate(function (node) {
      return node.visible() ? mapFunction(node) : undefined
    })
  }
})

L.control.tocWmsLayerTree = function (toc, options) {
  return new L.Control.TocWmsLayerTree(toc, options)
}
