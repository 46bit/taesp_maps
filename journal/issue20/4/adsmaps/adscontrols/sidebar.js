adscontrols.Sidebar = function(opt_options) {
  var options = goog.isDef(opt_options) ? opt_options : {};

  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'adscontrols-sidebar';

  var tab = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_ + "-tab"
  }, "\uf18e")
  var sidebar = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_
  }, tab)
  var container = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_ + "-container"
  }, sidebar)

  this.sidebar = sidebar
  goog.base(this, {
    element: container,
    target: options.target
  });
};
goog.inherits(adscontrols.Sidebar, ol.control.Control);
