adscontrols.Contents = function(opt_options) {
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
goog.inherits(adscontrols.Contents, ol.control.Control);
