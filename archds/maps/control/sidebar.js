goog.provide('archds.maps.control.Sidebar');

goog.require('goog.asserts');
goog.require('goog.dom');
goog.require('goog.dom.TagName');
goog.require('goog.dom.classlist');
goog.require('goog.events');
goog.require('goog.events.EventType');
goog.require('goog.fx.dom.Slide');
goog.require('goog.style');
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

  goog.events.listen(this.tab, goog.events.EventType.CLICK,
    this.handleTabClick_, false, this);

  goog.base(this, {
    element: this.container,
    target: options.target
  });
};
goog.inherits(archds.maps.control.Sidebar, ol.control.Control);

archds.maps.control.Sidebar.prototype.handleTabClick_ = function (event) {
  event.preventDefault()

  var sidebar_dimensions = goog.style.getSize(this.sidebar)

  var from = [-sidebar_dimensions.width, 0]
  var to = [0, 0]
  if (parseInt(this.container.style.left) >= 0) {
    to[0] = from[0]
    from[0] = 0
  }

  var anim = new goog.fx.dom.Slide(
    this.container,
    from,
    to,
    300,
    goog.fx.easing.easeIn
  )
  anim.play()
}
