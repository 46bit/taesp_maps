goog.provide('archds.maps.control.Contents');

goog.require('goog.asserts');
goog.require('goog.dom');
goog.require('goog.dom.TagName');
goog.require('goog.dom.classlist');
goog.require('goog.events');
goog.require('goog.events.EventType');
goog.require('ol.control.Control');

archds.maps.control.Contents = function(opt_options) {
  var options = goog.isDef(opt_options) ? opt_options : {};

  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'adscontrols-contents';

  var element = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_
  }, "Contents")

  goog.base(this, {
    element: element,
    target: options.target
  });
};
goog.inherits(archds.maps.control.Contents, ol.control.Control);
