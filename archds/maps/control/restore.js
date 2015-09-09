goog.provide('archds.maps.control.Restore');

goog.require('goog.asserts');
goog.require('goog.dom');
goog.require('goog.dom.TagName');
goog.require('goog.dom.classlist');
goog.require('goog.events');
goog.require('goog.events.EventType');
goog.require('ol.control.Control');

archds.maps.control.Restore = function(opt_options) {

  var options = goog.isDef(opt_options) ? opt_options : {};

  /**
   * @private
   * @type {string}
   */
  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'adscontrols-restore';

  var label = goog.isDef(options.label) ? options.label : '\uf015';

  /**
   * @private
   * @type {Node}
   */
  this.labelNode_ = /** @type {Node} */ (goog.isString(label) ?
          goog.dom.createTextNode(label) : label);

  var tipLabel = goog.isDef(options.tipLabel) ?
      options.tipLabel : 'Restore';

  this.button = goog.dom.createDom(goog.dom.TagName.BUTTON, {
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
goog.inherits(archds.maps.control.Restore, ol.control.Control);

archds.maps.control.Restore.prototype.setRestoreBoundingBox = function(restoreBoundingBox, options) {
  // Set a bounding box the map view should fit upon restoring.
  this.restoreBoundingBox_ = restoreBoundingBox
  this.restoreBoundingBoxOptions_ = goog.isDef(options) ? options : {}
}

/**
 * @param {goog.events.BrowserEvent} event The event to handle
 * @private
 */
archds.maps.control.Restore.prototype.handleClick_ = function(event) {
  event.preventDefault();

  this.restore()
};

archds.maps.control.Restore.prototype.restore = function() {
  var map = this.getMap()
  var view = map.getView()

  if (this.restoreBoundingBox_) {
    view.fit(this.restoreBoundingBox_, map.getSize(), this.restoreBoundingBoxOptions_)
  } else {
    console.log("@DEBUG: archds.maps.control.Restore: No bounding box set to restore.")
  }
}
