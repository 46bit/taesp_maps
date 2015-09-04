<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/journal/issue20/4/adsmaps/deps/ol-3.6.0.css" type="text/css">
  <link rel="stylesheet" href="/journal/issue20/4/adsmaps/deps/ol3-layerswitcher.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
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

  <script src="/journal/issue20/4/adsmaps/deps/polyfills.js"></script>
  <script src="/journal/issue20/4/adsmaps/deps/jquery-1.11.3.min.js"></script>
  <script src="/journal/issue20/4/adsmaps/deps/proj4-2.3.3.js"></script>
  <script src="/journal/issue20/4/adsmaps/deps/ol-3.8.2-debug.js"></script>
  <script src="/journal/issue20/4/adsmaps/deps/ol3-layerswitcher.js"></script>
  <script src="/journal/issue20/4/adsmaps/deps/uri.min.js"></script>
  <script src="/journal/issue20/4/adsmaps/deps/toc2json/api_openlayers.js"></script>
  <script>
    window.adscontrols = {}
  </script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/toolbar.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/print.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/fullscreencontrol.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/overviewmapcontrol.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/scalelinecontrol.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/zoomcontrol.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/restore.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/sidebar.js"></script>
  <script src="/journal/issue20/4/adsmaps/adscontrols/contents.js"></script>

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
    $("#map").show()
    $("#select_a_map_notice").hide()
    map_load(footnote, ce)
  } else {
    $("#map").hide()
    $("#select_a_map_notice").show()
  }

  function map_load(toc_footnote, ce) {
    // @TODO: Create .toc script tag
    // @TODO: Wait for it to load?
    //        - Could load with $.get then eval?
    // @TODO: Use ce if provided.
    //        Set bounding box to ceminx,ceminy,cemaxx,cemaxy
    // @TODO: Render map as below.

    $.get("/journal/issue20/4/adsmaps/toc/" + toc_footnote + ".toc", function (toc_js) {
      // @TODO: Check file existed, etc. Also protect against malicious toc_footnote
      //        (for sake of thoroughness). Directory traversal main issue.
      eval(toc_js)
      map_display(ce, toc)
    })
  }

  var geoserver_url = "http://localhost:8080/geoserver"
  var toc_source_constructor = function toc_source_constructor(layer_code) {
    return new ol.source.ImageWMS({
      url: geoserver_url + "/wms",
      serverType: "geoserver",
      crossOrigin: "",
      params: {
        LAYERS: "taesp_ahrc_2007:level" + pad(parseInt(layer_code, 10), 3),
        CRS: "EPSG:900913",
        FORMAT: "image/png"
      }
    })
  }

  proj4.defs("EPSG:4038", 'PROJCS["WGS 84 / TMzn36N", GEOGCS["WGS 84", DATUM["World Geodetic System 1984", SPHEROID["WGS 84", 6378137.0, 298.257223563, AUTHORITY["EPSG","7030"]], AUTHORITY["EPSG","6326"]], PRIMEM["Greenwich", 0.0, AUTHORITY["EPSG","8901"]], UNIT["degree", 0.017453292519943295], AXIS["Geodetic longitude", EAST], AXIS["Geodetic latitude", NORTH], AUTHORITY["EPSG","4326"]], PROJECTION["Transverse Mercator", AUTHORITY["EPSG","9807"]], PARAMETER["central_meridian", 33.0], PARAMETER["latitude_of_origin", 0.0], PARAMETER["scale_factor", 0.9996], PARAMETER["false_easting", 500000.0], PARAMETER["false_northing", 0.0], UNIT["m", 1.0], AXIS["Easting", EAST], AXIS["Northing", NORTH], AUTHORITY["EPSG","4038"]]')
  var taesp2map_transform = proj4("EPSG:4038", "EPSG:900913")

  var bounds, view, layers, group, map, layer_switcher, overview, restore, toolbar, sidebar;

  function map_display(ce, toc) {
    // tl, bl, br, tr
    bounds = new ol.geom.Polygon([[
      taesp2map_transform.forward([ce["ceminx"], ce["ceminy"]]),
      taesp2map_transform.forward([ce["ceminx"], ce["cemaxy"]]),
      taesp2map_transform.forward([ce["cemaxx"], ce["cemaxy"]]),
      taesp2map_transform.forward([ce["cemaxx"], ce["ceminy"]])
    ]])

    toolbar = new adscontrols.Toolbar()
    sidebar = new adscontrols.Sidebar()

    var restore = new adscontrols.Restore({target: toolbar.element})
    restore.setRestoreBoundingBox(bounds, {constrainResolution: false})

    view = new ol.View({
      center: bounds.getInteriorPoint().flatCoordinates,
      zoom: 13
    })
    layers = toc.asOpenLayers(toc_source_constructor)
    group = new ol.layer.Group({
      title: "Map",
      layers: layers
    })
    map = new ol.Map({
      target: 'map',
      layers: [group],
      view: view,
      controls: new ol.Collection([
        toolbar,
        new adscontrols.Zoom({target: toolbar.element, zoomInLabel: "\uf067", zoomOutLabel: "\uf068"}),
        new adscontrols.FullScreen({target: toolbar.element, label: "\uf065"}),
        new ol.control.LayerSwitcher(),
        new adscontrols.Print({target: toolbar.element, label: "\uf02f"}),
        restore,
        new adscontrols.OverviewMap(),
        new adscontrols.CanvasScaleLine({labelColor: "#000000", outerColor: "#000000", innerColor: "#ffffff"}),
        sidebar,
        new adscontrols.Contents({target: sidebar.sidebar})
      ])
    })
    restore.restore()
    //view.fit(bounds, map.getSize(), {})

    /*map.on("singleclick", function (evt) {
      document.getElementById("info").innerHTML = "";
      var viewResolution = view.getResolution()
      var url = wms_source.getGetFeatureInfoUrl(
        evt.coordinate,
        viewResolution,
        "EPSG:900913",
        {"INFO_FORMAT": "text/html"}
      )
      if (url) {
        document.getElementById("info").innerHTML =
          "<iframe seamless src='" + url + "'></iframe>"
      }
    })*/
  }
  </script>
</body>
</html>
