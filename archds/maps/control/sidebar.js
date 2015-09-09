goog.provide('archds.maps.control.Sidebar');

goog.require('goog.asserts');
goog.require('goog.dom');
goog.require('goog.dom.TagName');
goog.require('goog.dom.classlist');
goog.require('goog.events');
goog.require('goog.events.EventType');
goog.require('goog.fx.dom.Slide');
goog.require('ol.control.Control');

archds.maps.control.Sidebar = function(opt_options) {
  var options = goog.isDef(opt_options) ? opt_options : {};

  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'adscontrols-sidebar';

  this.tab = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_ + "-tab"
  }, "\uf18e")
  this.sidebar = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_
  }, this.tab)
  this.container = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_ + "-container"
  }, this.sidebar)

  goog.base(this, {
    element: this.container,
    target: options.target
  });
};
goog.inherits(archds.maps.control.Sidebar, ol.control.Control);

// @TODO: Once Google Closure Library in, make this work.
archds.maps.control.Sidebar.prototype.tabClicked_ = function (event) {
  event.preventDefault()

  var anim = new goog.fx.dom.Slide(
    this.container,
    [-300, 0],
    [0, 0],
    2,
    goog.fx.easing.easeOut
  )
  anim.play()
}
