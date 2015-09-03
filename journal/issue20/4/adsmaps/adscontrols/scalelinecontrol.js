adscontrols.ScaleLineProperty = {
  UNITS: 'units'
};

adscontrols.ScaleLineUnits = {
  DEGREES: 'degrees',
  IMPERIAL: 'imperial',
  NAUTICAL: 'nautical',
  METRIC: 'metric',
  US: 'us'
};

adscontrols.CanvasScaleLine = function(opt_options) {

  var options = goog.isDef(opt_options) ? opt_options : {};

  this.viewState_ = null;

  this.minWidth_ = goog.isDef(options.minWidth) ? options.minWidth : 64;

  this.renderedWidth_ = undefined;

  this.toEPSG4326_ = null;

  this.labelColor_ = goog.isDef(options.labelColor) ? options.labelColor : "rgba(0, 60, 136, 0.4)"

  this.outerColor_ = goog.isDef(options.outerColor) ? options.outerColor : "rgba(0, 60, 136, 0.4)"

  this.innerColor_ = goog.isDef(options.innerColor) ? options.innerColor : "#ffffff"

  var render = goog.isDef(options.render) ?
      options.render : adscontrols.CanvasScaleLine.render;

  goog.base(this, {
    render: render,
    target: null,
    element: goog.dom.createTextNode("")
  });

  goog.events.listen(
      this, ol.Object.getChangeEventType(adscontrols.ScaleLineProperty.UNITS),
      this.handleUnitsChanged_, false, this);

  this.setUnits(/** @type {adscontrols.ScaleLineUnits} */ (options.units) ||
      adscontrols.ScaleLineUnits.METRIC);

};
goog.inherits(adscontrols.CanvasScaleLine, ol.control.Control);


adscontrols.CanvasScaleLine.LEADING_DIGITS = [1, 2, 5];

adscontrols.CanvasScaleLine.prototype.getUnits = function() {
  return /** @type {adscontrols.ScaleLineUnits|undefined} */ (
      this.get(adscontrols.ScaleLineProperty.UNITS));
};

adscontrols.CanvasScaleLine.render = function(mapEvent) {
  var frameState = mapEvent.frameState;
  if (goog.isNull(frameState)) {
    this.viewState_ = null;
  } else {
    this.viewState_ = frameState.viewState;
  }
  this.updateElement_();
};

adscontrols.CanvasScaleLine.prototype.handleUnitsChanged_ = function() {
  this.updateElement_();
};

adscontrols.CanvasScaleLine.prototype.setUnits = function(units) {
  this.set(adscontrols.ScaleLineProperty.UNITS, units);
};

adscontrols.CanvasScaleLine.prototype.updateElement_ = function() {
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
    count = adscontrols.CanvasScaleLine.LEADING_DIGITS[i % 3] *
        Math.pow(10, Math.floor(i / 3));
    width = Math.round(count / pointResolution);
    if (isNaN(width)) {
      this.renderedVisible_ = false;
      break;
    } else if (width >= this.minWidth_) {
      this.renderedVisible_ = true;
      break;
    }
    ++i;
  }

  if (this.renderedVisible_) {
    this.draw(count, suffix, width);
  }
};

adscontrols.CanvasScaleLine.prototype.draw = function (count, suffix, width) {
  var map = this.getMap()
  var canvas = map.getViewport().getElementsByTagName("canvas")[0]
  var ctx = canvas.getContext("2d")

  var label = count + ' ' + suffix;

  //Scaleline thicknes
  var line1 = 6;
  //Offset from the left
  var x_offset = 20;
  //offset from the bottom
  var y_offset = 20;
  var fontsize1 = 15;
  var font1 = fontsize1 + 'px Arial';
  // how big should the scale be (original css-width multiplied)
  var multiplier = 2;

  var scalewidth = width*multiplier;
  var scale = label
  var scalenumber = count*multiplier
  var scaleunit = suffix

  //Scale Text
  ctx.beginPath();
  ctx.textAlign = "left";
  ctx.strokeStyle = "#ffffff";
  ctx.fillStyle = this.labelColor_;
  ctx.lineWidth = 5;
  ctx.font = font1;
  ctx.strokeText([scalenumber + ' ' + scaleunit], x_offset + fontsize1 / 2, canvas.height - y_offset - fontsize1 / 2);
  ctx.fillText([scalenumber + ' ' + scaleunit], x_offset + fontsize1 / 2, canvas.height - y_offset - fontsize1 / 2);

  //Scale Dimensions
  var xzero = scalewidth + x_offset;
  var yzero = canvas.height - y_offset;
  var xfirst = x_offset + scalewidth * 1 / 4;
  var xsecond = xfirst + scalewidth * 1 / 4;
  var xthird = xsecond + scalewidth * 1 / 4;
  var xfourth = xthird + scalewidth * 1 / 4;

  // Stroke
  ctx.beginPath();
  ctx.lineWidth = line1 + 2;
  ctx.strokeStyle = this.outerColor_;
  ctx.fillStyle = this.innerColor_;
  ctx.opacity = 0.6;
  ctx.moveTo(x_offset, yzero);
  ctx.lineTo(xzero + 1, yzero);
  ctx.stroke();

  //sections black/white
  ctx.beginPath();
  ctx.lineWidth = line1;
  ctx.strokeStyle = this.outerColor_;
  ctx.moveTo(x_offset, yzero);
  ctx.lineTo(xfirst, yzero);
  ctx.stroke();

  ctx.beginPath();
  ctx.lineWidth = line1;
  ctx.strokeStyle = this.innerColor_;
  ctx.moveTo(xfirst, yzero);
  ctx.lineTo(xsecond, yzero);
  ctx.stroke();

  ctx.beginPath();
  ctx.lineWidth = line1;
  ctx.strokeStyle = this.outerColor_;
  ctx.moveTo(xsecond, yzero);
  ctx.lineTo(xthird, yzero);
  ctx.stroke();

  ctx.beginPath();
  ctx.lineWidth = line1;
  ctx.strokeStyle = this.innerColor_;
  ctx.moveTo(xthird, yzero);
  ctx.lineTo(xfourth, yzero);
  ctx.stroke();
}
