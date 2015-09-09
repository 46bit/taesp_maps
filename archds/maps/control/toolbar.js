goog.provide('archds.maps.control.Toolbar');

goog.require('goog.asserts');
goog.require('goog.dom');
goog.require('goog.dom.TagName');
goog.require('goog.dom.classlist');
goog.require('ol.control.Control');

archds.maps.control.Toolbar = function(opt_options) {
  var options = goog.isDef(opt_options) ? opt_options : {};

  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'adscontrols-toolbar';

  var element = goog.dom.createDom(goog.dom.TagName.DIV, {
    'class': this.cssClassName_,
  });

  goog.base(this, {
    element: element,
    target: options.target
  });
};
goog.inherits(archds.maps.control.Toolbar, ol.control.Control);
