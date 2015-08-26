/**
 * @enum {string}
 */
adscontrols.ScaleLineProperty = {
  UNITS: 'units'
};


/**
 * Units for the scale line. Supported values are `'degrees'`, `'imperial'`,
 * `'nautical'`, `'metric'`, `'us'`.
 * @enum {string}
 * @api stable
 */
adscontrols.ScaleLineUnits = {
  DEGREES: 'degrees',
  IMPERIAL: 'imperial',
  NAUTICAL: 'nautical',
  METRIC: 'metric',
  US: 'us'
};


adscontrols.ScaleLine = function(opt_options) {

  var options = goog.isDef(opt_options) ? opt_options : {};

  var className = goog.isDef(options.className) ?
      options.className : 'ol-scale-line';

  /**
   * @private
   * @type {Element}
   */
  this.innerElement_ = goog.dom.createDom(goog.dom.TagName.DIV,
      className + '-inner');

  /**
   * @private
   * @type {Element}
   */
  this.element_ = goog.dom.createDom(goog.dom.TagName.DIV,
      className + ' ' + ol.css.CLASS_UNSELECTABLE, this.innerElement_);

  /**
   * @private
   * @type {?olx.ViewState}
   */
  this.viewState_ = null;

  /**
   * @private
   * @type {number}
   */
  this.minWidth_ = goog.isDef(options.minWidth) ? options.minWidth : 64;

  /**
   * @private
   * @type {boolean}
   */
  this.renderedVisible_ = false;

  /**
   * @private
   * @type {number|undefined}
   */
  this.renderedWidth_ = undefined;

  /**
   * @private
   * @type {string}
   */
  this.renderedHTML_ = '';

  /**
   * @private
   * @type {?ol.TransformFunction}
   */
  this.toEPSG4326_ = null;

  var render = goog.isDef(options.render) ?
      options.render : adscontrols.ScaleLine.render;

  goog.base(this, {
    element: this.element_,
    render: render,
    target: options.target
  });

  goog.events.listen(
      this, ol.Object.getChangeEventType(adscontrols.ScaleLineProperty.UNITS),
      this.handleUnitsChanged_, false, this);

  this.setUnits(/** @type {adscontrols.ScaleLineUnits} */ (options.units) ||
      adscontrols.ScaleLineUnits.METRIC);

};
goog.inherits(adscontrols.ScaleLine, ol.control.Control);


/**
 * @const
 * @type {Array.<number>}
 */
adscontrols.ScaleLine.LEADING_DIGITS = [1, 2, 5];


/**
 * Return the units to use in the scale line.
 * @return {adscontrols.ScaleLineUnits|undefined} The units to use in the scale
 *     line.
 * @observable
 * @api stable
 */
adscontrols.ScaleLine.prototype.getUnits = function() {
  return /** @type {adscontrols.ScaleLineUnits|undefined} */ (
      this.get(adscontrols.ScaleLineProperty.UNITS));
};


/**
 * Update the scale line element.
 * @param {ol.MapEvent} mapEvent Map event.
 * @this {adscontrols.ScaleLine}
 * @api
 */
adscontrols.ScaleLine.render = function(mapEvent) {
  var frameState = mapEvent.frameState;
  if (goog.isNull(frameState)) {
    this.viewState_ = null;
  } else {
    this.viewState_ = frameState.viewState;
  }
  this.updateElement_();
};


/**
 * @private
 */
adscontrols.ScaleLine.prototype.handleUnitsChanged_ = function() {
  this.updateElement_();
};


/**
 * Set the units to use in the scale line.
 * @param {adscontrols.ScaleLineUnits} units The units to use in the scale line.
 * @observable
 * @api stable
 */
adscontrols.ScaleLine.prototype.setUnits = function(units) {
  this.set(adscontrols.ScaleLineProperty.UNITS, units);
};


/**
 * @private
 */
adscontrols.ScaleLine.prototype.updateElement_ = function() {
  var viewState = this.viewState_;

  if (goog.isNull(viewState)) {
    if (this.renderedVisible_) {
      goog.style.setElementShown(this.element_, false);
      this.renderedVisible_ = false;
    }
    return;
  }

  var center = viewState.center;
  var projection = viewState.projection;
  var pointResolution =
      projection.getPointResolution(viewState.resolution, center);
  var projectionUnits = projection.getUnits();

  var cosLatitude;
  var units = this.getUnits();
  if (projectionUnits == ol.proj.Units.DEGREES &&
      (units == adscontrols.ScaleLineUnits.METRIC ||
       units == adscontrols.ScaleLineUnits.IMPERIAL ||
       units == adscontrols.ScaleLineUnits.US ||
       units == adscontrols.ScaleLineUnits.NAUTICAL)) {

    // Convert pointResolution from degrees to meters
    this.toEPSG4326_ = null;
    cosLatitude = Math.cos(goog.math.toRadians(center[1]));
    pointResolution *= Math.PI * cosLatitude * ol.sphere.NORMAL.radius / 180;
    projectionUnits = ol.proj.Units.METERS;

  } else if (projectionUnits != ol.proj.Units.DEGREES &&
      units == adscontrols.ScaleLineUnits.DEGREES) {

    // Convert pointResolution from other units to degrees
    if (goog.isNull(this.toEPSG4326_)) {
      this.toEPSG4326_ = ol.proj.getTransformFromProjections(
          projection, ol.proj.get('EPSG:4326'));
    }
    cosLatitude = Math.cos(goog.math.toRadians(this.toEPSG4326_(center)[1]));
    var radius = ol.sphere.NORMAL.radius;
    goog.asserts.assert(goog.isDef(ol.proj.METERS_PER_UNIT[projectionUnits]),
        'Meters per unit should be defined for the projection unit');
    radius /= ol.proj.METERS_PER_UNIT[projectionUnits];
    pointResolution *= 180 / (Math.PI * cosLatitude * radius);
    projectionUnits = ol.proj.Units.DEGREES;

  } else {
    this.toEPSG4326_ = null;
  }

  goog.asserts.assert(
      ((units == adscontrols.ScaleLineUnits.METRIC ||
        units == adscontrols.ScaleLineUnits.IMPERIAL ||
        units == adscontrols.ScaleLineUnits.US ||
        units == adscontrols.ScaleLineUnits.NAUTICAL) &&
       projectionUnits == ol.proj.Units.METERS) ||
      (units == adscontrols.ScaleLineUnits.DEGREES &&
       projectionUnits == ol.proj.Units.DEGREES),
      'Scale line units and projection units should match');

  var nominalCount = this.minWidth_ * pointResolution;
  var suffix = '';
  if (units == adscontrols.ScaleLineUnits.DEGREES) {
    if (nominalCount < 1 / 60) {
      suffix = '\u2033'; // seconds
      pointResolution *= 3600;
    } else if (nominalCount < 1) {
      suffix = '\u2032'; // minutes
      pointResolution *= 60;
    } else {
      suffix = '\u00b0'; // degrees
    }
  } else if (units == adscontrols.ScaleLineUnits.IMPERIAL) {
    if (nominalCount < 0.9144) {
      suffix = 'in';
      pointResolution /= 0.0254;
    } else if (nominalCount < 1609.344) {
      suffix = 'ft';
      pointResolution /= 0.3048;
    } else {
      suffix = 'mi';
      pointResolution /= 1609.344;
    }
  } else if (units == adscontrols.ScaleLineUnits.NAUTICAL) {
    pointResolution /= 1852;
    suffix = 'nm';
  } else if (units == adscontrols.ScaleLineUnits.METRIC) {
    if (nominalCount < 1) {
      suffix = 'mm';
      pointResolution *= 1000;
    } else if (nominalCount < 1000) {
      suffix = 'm';
    } else {
      suffix = 'km';
      pointResolution /= 1000;
    }
  } else if (units == adscontrols.ScaleLineUnits.US) {
    if (nominalCount < 0.9144) {
      suffix = 'in';
      pointResolution *= 39.37;
    } else if (nominalCount < 1609.344) {
      suffix = 'ft';
      pointResolution /= 0.30480061;
    } else {
      suffix = 'mi';
      pointResolution /= 1609.3472;
    }
  } else {
    goog.asserts.fail('Scale line element cannot be updated');
  }

  var i = 3 * Math.floor(
      Math.log(this.minWidth_ * pointResolution) / Math.log(10));
  var count, width;
  while (true) {
    count = adscontrols.ScaleLine.LEADING_DIGITS[i % 3] *
        Math.pow(10, Math.floor(i / 3));
    width = Math.round(count / pointResolution);
    if (isNaN(width)) {
      goog.style.setElementShown(this.element_, false);
      this.renderedVisible_ = false;
      return;
    } else if (width >= this.minWidth_) {
      break;
    }
    ++i;
  }

  var html = count + ' ' + suffix;
  if (this.renderedHTML_ != html) {
    this.innerElement_.innerHTML = html;
    this.renderedHTML_ = html;
  }

  if (this.renderedWidth_ != width) {
    this.innerElement_.style.width = width + 'px';
    this.renderedWidth_ = width;
  }

  if (!this.renderedVisible_) {
    goog.style.setElementShown(this.element_, true);
    this.renderedVisible_ = true;
  }

};
