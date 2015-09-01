adscontrols.Print = function(opt_options) {

  var options = goog.isDef(opt_options) ? opt_options : {};

  /**
   * @private
   * @type {string}
   */
  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'adscontrols-print';

  var label = goog.isDef(options.label) ? options.label : '\u00BB';

  /**
   * @private
   * @type {Node}
   */
  this.labelNode_ = /** @type {Node} */ (goog.isString(label) ?
          goog.dom.createTextNode(label) : label);

  var tipLabel = goog.isDef(options.tipLabel) ?
      options.tipLabel : 'Print';

  this.button = goog.dom.createDom(goog.dom.TagName.A, {
    'title': tipLabel,
    'class': 'button'
  }, this.labelNode_);

  goog.events.listen(this.button, goog.events.EventType.CLICK,
      this.handleClick_, false, this);

  var element = goog.dom.createDom(goog.dom.TagName.DIV, "control", this.button);

  goog.base(this, {
    element: element,
    target: options.target
  });

  /**
   * @private
   * @type {boolean}
   */
  this.keys_ = goog.isDef(options.keys) ? options.keys : false;
};
goog.inherits(adscontrols.Print, ol.control.Control);

/**
 * @param {goog.events.BrowserEvent} event The event to handle
 * @private
 */
adscontrols.Print.prototype.handleClick_ = function(event) {
  //event.preventDefault();
  var map = this.getMap();
  var button = this.button
  map.once('postcompose', function (e) {
    var canvas = e.context.canvas
    button.setAttribute("download", "taesp_map.png")
    button.setAttribute("href", canvas.toDataURL('image/png'))
  })
  map.renderSync()
  console.log("@TODO: Implement printing.")
};
