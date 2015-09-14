"use strict"

function pad(num, size) {
  var s = "000000000" + num;
  return s.substr(s.length-size);
}

var TOC = (function () {
  function TOC(a, name, b, gif) {
    this.element_type = "TOC"
    this.a = a
    this.name = name
    this.b = b
    this.gif = gif
    this.layersAndGroups = []
  }
  TOC.prototype.addLayer = function addLayer(layer) {
    this.layersAndGroups.push(layer)
    return layer
  }
  TOC.prototype.addGroup = function addGroup(group) {
    this.layersAndGroups.push(group)
    return group
  }
  TOC.prototype.asOpenLayers = function asOpenLayers(source_constructor) {
    var mapped = []
    for (var i in this.layersAndGroups) {
      var layerOrGroup = this.layersAndGroups[i]
      if (!(layerOrGroup instanceof LAYER) || layerOrGroup.codeIsNumeric()) {
        var olLayerOrGroup = layerOrGroup.asOpenLayers(source_constructor)
        mapped.push(olLayerOrGroup)
      }
    }
    mapped.reverse()
    return mapped
  }
  TOC.prototype.asWmsLayerList = function asWmsLayerList(prefix) {
    var layer_names = []
    for (var i in this.layersAndGroups) {
      var layerOrGroup = this.layersAndGroups[i]
      if (!(layerOrGroup instanceof LAYER) || layerOrGroup.codeIsNumeric()) {
        layer_names = layer_names.concat(layerOrGroup.asWmsLayerList(prefix))
      }
    }
    return layer_names
  }
  TOC.prototype.asLeafletLayers = function asLeafletLayers(layer_constructor) {
    var mapped = []
    for (var i in this.layersAndGroups) {
      var layerOrGroup = this.layersAndGroups[i]
      if (!(layerOrGroup instanceof LAYER) || layerOrGroup.codeIsNumeric()) {
        var olLayerOrGroup = layerOrGroup.asLeafletLayers(layer_constructor)
        mapped = mapped.concat(olLayerOrGroup)
      }
    }
    mapped.reverse()
    return mapped
  }
  return TOC
})()

var GROUP = (function () {
  function GROUP(name, b) {
    this.element_type = "GROUP"
    this.name = name
    this.b = b
    this.layersAndGroups = []
  }
  GROUP.prototype.addLayer = function addLayer(layer) {
    this.layersAndGroups.push(layer)
    return layer
  }
  GROUP.prototype.addGroup = function addGroup(group) {
    this.layersAndGroups.push(group)
    return group
  }
  GROUP.prototype.asOpenLayers = function asOpenLayers(source_constructor) {
    var mapped = []
    for (var i in this.layersAndGroups) {
      var layerOrGroup = this.layersAndGroups[i]
      if (!(layerOrGroup instanceof LAYER) || layerOrGroup.codeIsNumeric()) {
        var olLayerOrGroup = layerOrGroup.asOpenLayers(source_constructor)
        mapped.push(olLayerOrGroup)
      }
    }
    var olGroup = new ol.layer.Group({
      title: this.name,
      layers: mapped
    })
    return olGroup
  }
  GROUP.prototype.asWmsLayerList = function asWmsLayerList(prefix) {
    var layer_names = []
    for (var i in this.layersAndGroups) {
      var layerOrGroup = this.layersAndGroups[i]
      if (!(layerOrGroup instanceof LAYER) || layerOrGroup.codeIsNumeric()) {
        layer_names = layer_names.concat(layerOrGroup.asWmsLayerList(prefix))
      }
    }
    return layer_names
  }
  GROUP.prototype.asLeafletLayers = function asLeafletLayers(layer_constructor) {
    var mapped = []
    for (var i in this.layersAndGroups) {
      var layerOrGroup = this.layersAndGroups[i]
      if (!(layerOrGroup instanceof LAYER) || layerOrGroup.codeIsNumeric()) {
        var olLayerOrGroup = layerOrGroup.asLeafletLayers(layer_constructor)
        mapped = mapped.concat(olLayerOrGroup)
      }
    }
    mapped.reverse()
    return mapped
  }
  return GROUP
})()

var LAYER = (function () {
  function LAYER(code, name, gif, a, b, c, visible) {
    this.element_type = "LAYER"
    this.code = code
    this.name = name
    this.gif = gif
    this.a = a
    this.b = b
    this.c = c
    this.visible = visible
  }
  LAYER.prototype.codeIsNumeric = function codeIsNumeric() {
    return String(parseInt(this.code, 10)) == this.code
  }
  LAYER.prototype.asOpenLayers = function asOpenLayers(source_constructor) {
    var olSource = source_constructor(this.code)
    var olLayer = new ol.layer.Image({
      title: this.name,
      visible: !!this.visible,
      source: olSource
    })
    return olLayer
  }
  LAYER.prototype.asWmsLayerList = function asWmsLayerList(prefix) {
    return [prefix + pad(parseInt(this.code, 10), 3)]
  }
  LAYER.prototype.asLeafletLayers = function asLeafletLayers(source_constructor) {
    return [source_constructor(this)]
  }
  return LAYER
})()
