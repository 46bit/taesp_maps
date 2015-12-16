"use strict"

var TOC = (function () {
  function TOC(title, caption, autoRefreshMap, swatch) {
    this.element_type = "TOC"
    this.title = title
    this.caption = caption
    this.autoRefreshMap = autoRefreshMap
    this.swatch = swatch
    this.layersAndGroups = []
    this.expanded = true
  }
  TOC.prototype.addLayer = function addLayer(layer) {
    this.layersAndGroups.push(layer)
    return layer
  }
  TOC.prototype.addGroup = function addGroup(group) {
    this.layersAndGroups.push(group)
    return group
  }
  return TOC
})()
if (typeof exports !== "undefined") {
  exports.TOC = TOC
}

var GROUP = (function () {
  function GROUP(caption, opened, swatch) {
    this.element_type = "GROUP"
    this.caption = caption
    this.opened = opened
    this.swatch = swatch
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
  return GROUP
})()
if (typeof exports !== "undefined") {
  exports.GROUP = GROUP
}

var LAYER = (function () {
  function LAYER(name, caption, swatch, legend, legendVis, labelField, visible) {
    this.element_type = "LAYER"
    this.name = name
    this.caption = caption
    this.swatch = swatch
    this.legend = legend
    this.legendVis = legendVis
    this.labelField = labelField
    this.visible = visible
  }
  LAYER.prototype.nameIsNumeric = function nameIsNumeric() {
    return String(parseInt(this.name, 10)) == this.name
  }
  LAYER.prototype.asWmsLayerName = function asWmsLayerName() {
    return this.name
  }
  return LAYER
})()
if (typeof exports !== "undefined") {
  exports.LAYER = LAYER
}
