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

  var button = goog.dom.createDom(goog.dom.TagName.BUTTON, {
    'type': 'button',
    'title': tipLabel
  }, this.labelNode_);

  goog.events.listen(button, goog.events.EventType.CLICK,
      this.handleClick_, false, this);

  var element = goog.dom.createDom(goog.dom.TagName.DIV, "control", button);

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
  event.preventDefault();
  console.log("@TODO: Implement printing.")
};
