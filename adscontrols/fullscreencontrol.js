adscontrols.FullScreen = function(opt_options) {

  var options = goog.isDef(opt_options) ? opt_options : {};

  /**
   * @private
   * @type {string}
   */
  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'ol-full-screen';

  var label = goog.isDef(options.label) ? options.label : '\u2194';

  /**
   * @private
   * @type {Node}
   */
  this.labelNode_ = /** @type {Node} */ (goog.isString(label) ?
          goog.dom.createTextNode(label) : label);

  var labelActive = goog.isDef(options.labelActive) ?
      options.labelActive : '\u00d7';

  /**
   * @private
   * @type {Node}
   */
  this.labelActiveNode_ = /** @type {Node} */ (goog.isString(labelActive) ?
          goog.dom.createTextNode(labelActive) : labelActive);

  var tipLabel = goog.isDef(options.tipLabel) ?
      options.tipLabel : 'Toggle full-screen';
  var button = goog.dom.createDom(goog.dom.TagName.BUTTON, {
    'class': this.cssClassName_ + '-' + goog.dom.fullscreen.isFullScreen(),
    'type': 'button',
    'title': tipLabel
  }, this.labelNode_);

  goog.events.listen(button, goog.events.EventType.CLICK,
      this.handleClick_, false, this);

  goog.events.listen(goog.global.document,
      goog.dom.fullscreen.EventType.CHANGE,
      this.handleFullScreenChange_, false, this);

  var cssClasses = this.cssClassName_ + ' ' + ol.css.CLASS_UNSELECTABLE +
      ' ' + ol.css.CLASS_CONTROL + ' ' +
      (!goog.dom.fullscreen.isSupported() ? ol.css.CLASS_UNSUPPORTED : '');
  var element = goog.dom.createDom(goog.dom.TagName.DIV, cssClasses, button);

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
goog.inherits(adscontrols.FullScreen, ol.control.Control);


/**
 * @param {goog.events.BrowserEvent} event The event to handle
 * @private
 */
adscontrols.FullScreen.prototype.handleClick_ = function(event) {
  event.preventDefault();
  this.handleFullScreen_();
};


/**
 * @private
 */
adscontrols.FullScreen.prototype.handleFullScreen_ = function() {
  if (!goog.dom.fullscreen.isSupported()) {
    return;
  }
  var map = this.getMap();
  if (goog.isNull(map)) {
    return;
  }
  if (goog.dom.fullscreen.isFullScreen()) {
    goog.dom.fullscreen.exitFullScreen();
  } else {
    var target = map.getTarget();
    goog.asserts.assert(goog.isDefAndNotNull(target),
        'target should be defined');
    var element = goog.dom.getElement(target);
    goog.asserts.assert(goog.isDefAndNotNull(element),
        'element should be defined');
    if (this.keys_) {
      goog.dom.fullscreen.requestFullScreenWithKeys(element);
    } else {
      goog.dom.fullscreen.requestFullScreen(element);
    }
  }
};


/**
 * @private
 */
adscontrols.FullScreen.prototype.handleFullScreenChange_ = function() {
  var opened = this.cssClassName_ + '-true';
  var closed = this.cssClassName_ + '-false';
  var button = goog.dom.getFirstElementChild(this.element);
  var map = this.getMap();
  if (goog.dom.fullscreen.isFullScreen()) {
    goog.dom.classlist.swap(button, closed, opened);
    goog.dom.replaceNode(this.labelActiveNode_, this.labelNode_);
  } else {
    goog.dom.classlist.swap(button, opened, closed);
    goog.dom.replaceNode(this.labelNode_, this.labelActiveNode_);
  }
  if (!goog.isNull(map)) {
    map.updateSize();
  }
};
