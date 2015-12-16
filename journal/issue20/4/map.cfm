<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="archds-leaflet-mapping/libs/leaflet-0.7.5/leaflet.css">
  <link rel="stylesheet" href="archds-leaflet-mapping/libs/Leaflet.GraphicScale.min.css">
  <link rel="stylesheet" href="archds-leaflet-mapping/libs/leaflet.toolbar.css">
  <link rel="stylesheet" href="archds-leaflet-mapping/libs/Leaflet.Control.LayerTree.css">
  <link rel="stylesheet" href="archds-leaflet-mapping/libs/leaflet.contextmenu.css">
  <link rel="stylesheet" href="archds-leaflet-mapping/libs/Leaflet-MiniMap/dist/Control.MiniMap.min.css">
  <link rel="stylesheet" href="archds-leaflet-mapping/libs/Leaflet.print/dist/leaflet.print.css">
  <style>
  body {
    background: #fff;
    padding: 0;
    margin: 0;
  }
  .map_container {
    width: 600px;
    height: 450px;
    position: absolute;
    top: 0;
    left: 0;
  }
  #map {
    width: 100%;
    height: 100%;
    background: #fff;
  }
  #select_a_map_notice {
    background-color:#ffffff;
    font: 16px Verdana, "Trebuchet MS", sans-serif;
    color: #000;
    max-width:900px;
    margin: 160px 30px 0;
    text-align: center
  }
  .layer {
    color: #000000;
    background-color: #ffffcc;
  }
  .leaflet-toolbar-icon {
    color: #000 !important;
  }
  </style>
</head>
<body>
  <div class="map_container">
    <div id="map"></div>
  </div>
  <div id="info"></div>
  <div id="select_a_map_notice" style="display: none;">
    <p>Select the <span class="layer"><u>yellow links</u></span> in the text to display the related interactive map in this window. </p>
    <p style="font-size:smaller;">This interactive map feature is best viewed with Internet Explorer or Mozilla Firefox.</p>
  </div>

  <script src="archds-leaflet-mapping/libs/jquery-1.11.3.min.js"></script>
  <script src="archds-leaflet-mapping/libs/proj4-2.3.3.js"></script>
  <script src="archds-leaflet-mapping/libs/uri.min.js"></script>
  <script src="archds-leaflet-mapping/libs/toc.js"></script>
  <script src="archds-leaflet-mapping/libs/leaflet-0.7.5/leaflet.js"></script>
  <script src="archds-leaflet-mapping/libs/L.tileLayer.BetterWMS.js"></script>
  <script src="archds-leaflet-mapping/libs/Leaflet.GraphicScale.min.js"></script>
  <script src="archds-leaflet-mapping/libs/leaflet.toolbar.js"></script>
  <script src="archds-leaflet-mapping/libs/Leaflet.fullscreen.js"></script>
  <script src="archds-leaflet-mapping/libs/Leaflet.Control.LayerTree.js"></script>
  <script src="archds-leaflet-mapping/libs/Leaflet.Control.TocWmsLayerTree.js"></script>
  <script src="archds-leaflet-mapping/libs/leaflet.contextmenu.js"></script>
  <script src="archds-leaflet-mapping/libs/Leaflet-MiniMap/dist/Control.MiniMap.min.js"></script>
  <script src="archds-leaflet-mapping/libs/Leaflet.print/dist/leaflet.print.js"></script>

  <script>
  function pad(num, size) {
    var s = "000000000" + num;
    return s.substr(s.length-size);
  }

  // @TODO: Including a 3KB library then having to split the query string ourself is
  // mad. This may be a quick hack to get things working but this needs tidying.
  var footnote = false, ce = {}

  var location_components = URI.parse(window.location.href)
  var query_parts = location_components.query ? location_components.query.split("&") : []

  for (i in query_parts) {
    var query_part_kv = query_parts[i].split("=")
    console.log(query_part_kv)
    switch (query_part_kv[0]) {
      case "footnote":
        footnote = query_part_kv[1]
        break
      case "ceminx":
      case "ceminy":
      case "cemaxx":
      case "cemaxy":
        ce[query_part_kv[0]] = query_part_kv[1]
        break
    }
  }

  if (footnote) {
    document.getElementById("map").style.display = "block"
    document.getElementById("select_a_map_notice").style.display = "none"
    map_load(footnote, ce)
  } else {
    document.getElementById("map").style.display = "none"
    document.getElementById("select_a_map_notice").style.display = "block"
  }

  var toc_url, toc_script, toc

  function map_load(toc_footnote, ce) {
    // @TODO: Create .toc script tag
    // @TODO: Wait for it to load?
    //        - Could load with $.get then eval?
    // @TODO: Use ce if provided.
    //        Set bounding box to ceminx,ceminy,cemaxx,cemaxy
    // @TODO: Render map as below.

    toc_url = "/journal/issue20/4/archds-leaflet-mapping/tocs/" + toc_footnote + ".toc"

    $.get(toc_url, function (toc_js) {
      eval(toc_js)
      map_display(ce, toc)
    })

    /*toc_script = $("<script>").attr({
      "src": toc_url,
      "type": "text/javascript",
      "async": true
    }).on("load", function () {
      map_display(ce, toc)
    }).appendTo(document.body)*/
  }

  var geoserver_url = "http://localhost:8080/geoserver"

  proj4.defs("EPSG:4038", 'PROJCS["WGS 84 / TMzn36N", GEOGCS["WGS 84", DATUM["World Geodetic System 1984", SPHEROID["WGS 84", 6378137.0, 298.257223563, AUTHORITY["EPSG","7030"]], AUTHORITY["EPSG","6326"]], PRIMEM["Greenwich", 0.0, AUTHORITY["EPSG","8901"]], UNIT["degree", 0.017453292519943295], AXIS["Geodetic longitude", EAST], AXIS["Geodetic latitude", NORTH], AUTHORITY["EPSG","4326"]], PROJECTION["Transverse Mercator", AUTHORITY["EPSG","9807"]], PARAMETER["central_meridian", 33.0], PARAMETER["latitude_of_origin", 0.0], PARAMETER["scale_factor", 0.9996], PARAMETER["false_easting", 500000.0], PARAMETER["false_northing", 0.0], UNIT["m", 1.0], AXIS["Easting", EAST], AXIS["Northing", NORTH], AUTHORITY["EPSG","4038"]]')
  var taesp2map_transform = proj4("EPSG:4038", "EPSG:4326")

  var bounds, view, layers, group, map, layer_switcher, overview, restore, toolbar, sidebar, contents, layerTree;

  function map_display(ce, toc) {
    var ce_bounds = [
      taesp2map_transform.forward([ce["ceminx"], ce["ceminy"]]).reverse(),
      taesp2map_transform.forward([ce["ceminx"], ce["cemaxy"]]).reverse(),
      taesp2map_transform.forward([ce["cemaxx"], ce["cemaxy"]]).reverse(),
      taesp2map_transform.forward([ce["cemaxx"], ce["ceminy"]]).reverse()
    ]
    console.log(ce_bounds)

    function showCoordinates (e) {
      L.popup()
        .setLatLng(e.latlng)
        .setContent(e.latlng + "")
        .openOn(map)
    }
    function centerMap (e) {
      map.panTo(e.latlng);
    }
    function zoomIn (e) {
      map.zoomIn();
    }
    function zoomOut (e) {
      map.zoomOut();
    }

    layerTree = L.control.tocWmsLayerTree(toc, {
      tocCaptionBlacklist: {
        "Info": true,
        "Background Map DEM": true
      },
      wmsUrl: geoserver_url + "/wms",
      wmsLayerNamePrefix: "taesp_ahrc_2007:",
      wmsParams: {
        format: 'image/png',
        transparent: true,
        crs: L.CRS.EPSG3857
      }
    })

    map = L.map('map', {
      crs: L.CRS.EPSG3857,
      contextmenu: true,
      contextmenuWidth: 140,
      contextmenuItems: [{
        text: 'Show coordinates',
        callback: showCoordinates
      }, {
        text: 'What\'s here?',
        callback: function (e) {
          layerTree.showFeatureInfoAt(e.latlng)
        }
      }, "-", {
        text: 'Center map here',
        callback: centerMap
      }, {
        text: 'Zoom in',
        icon: 'archds-leaflet-mapping/libs/Leaflet.contextmenu/examples/images/zoom-in.png',
        callback: zoomIn
      }, {
        text: 'Zoom out',
        icon: 'archds-leaflet-mapping/libs/Leaflet.contextmenu/examples/images/zoom-out.png',
        callback: zoomOut
      }]
    })

    layerTree.addTo(map)

    map.fitBounds(L.latLngBounds(ce_bounds))

    var graphicScale = L.control.graphicScale({
      doubleLine: false,
      fill: 'hollow',
      showSubunits: false
    }).addTo(map);

    var home = L.ToolbarAction.extend({
      options: {
        toolbarIcon: {
          html: '<i class="fa fa-home fa-fw fa-lg"></i>',
          tooltip: "Reset to original map view"
        }
      },
      addHooks: function () {
        map.fitBounds(L.latLngBounds(ce_bounds))
      }
    })

    var printProvider = L.print.provider({
       method: 'POST',
       url: 'http://localhost:8080/geoserver/pdf',
       autoLoad: true,
       dpi: 150
    });
    var printControl = L.control.print({
       provider: printProvider
    });
    map.addControl(printControl)

    var fullscreen = L.ToolbarAction.extend({
      options: {
        toolbarIcon: {
          html: '<i class="fa fa-expand fa-fw fa-lg"></i>',
          tooltip: "Make map fullscreen"
        }
      },
      initialize: function (options) {
        L.ToolbarAction.prototype.initialize.call(this, options);
        map.on("fullscreenchange", this.handleFullscreenChange, this)
      },
      addHooks: function () {
        map.toggleFullscreen()
      },
      handleFullscreenChange: function () {
        if (map.isFullscreen()) {
          this._link.children[0].className = "fa fa-compress fa-fw fa-lg"
        } else {
          this._link.children[0].className = "fa fa-expand fa-fw fa-lg"
        }
      }
    })

    var key = L.ToolbarAction.extend({
      options: {
        toolbarIcon: {
          html: '<i class="fa fa-info fa-fw fa-lg"></i>',
          tooltip: "Map key",
        className: 'leaflet-draw-toolbar'
        }
      },
      addHooks: function () {
        L.popup()
          .setLatLng(map.getCenter())
          .setContent("<a href='/journal/issue20/4/user_guide.htm' target='_blank'>User Guide</a><br><a href='/journal/issue20/4/bldgcodes.htm' target='_blank'>Building codes</a><br><a href='/journal/issue20/4/codeslist.htm' target='_blank'>Geomorphology codes</a><br><a href='/journal/issue20/4/lithcodes.htm' target='_blank'>Lithic codes</a><br><a href='/journal/issue20/4/metalcodes.htm' target='_blank'>Archaeometallurgy codes</a><br><a href='/journal/issue20/4/potcodes.htm' target='_blank'>Pottery codes</a><br><a href='/journal/issue20/4/speccodes.htm' target='_blank'>Special Finds codes</a><br><a href='/journal/issue20/4/sucodes.htm' target='_blank'>Survey Unit codes</a><br><a href='/journal/issue20/4/help.html' target='_blank'>Interface help</a>")
          .openOn(map)
      }
    })

    var toolbar = new L.Toolbar.Control({
      position: 'topleft',
      actions: [home, key, fullscreen]
    }).addTo(map)

    var minimapWmsLayer = L.tileLayer.wms(geoserver_url + "/wms", {
      layers: "taesp_ahrc_2007:336,taesp_ahrc_2007:278,taesp_ahrc_2007:274,taesp_ahrc_2007:275",
      format: "image/png",
      transparent: true,
      crs: L.CRS.EPSG3857
    })
    var minimap = new L.Control.MiniMap(minimapWmsLayer, {
      zoomLevelOffset: -5,
      toggleDisplay: true,
      aimingRectOptions: {
        color: "#ffeedd"
      }
    }).addTo(map)
  }
  </script>
</body>
</html>
