(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var getRandomColor, getRandomInteger, _ref;
    disco.DoodleDisplay = (function(_super) {
      __extends(DoodleDisplay, _super);

      function DoodleDisplay() {
        this.remove = __bind(this.remove, this);
        this._pixelsToGrid = __bind(this._pixelsToGrid, this);
        this._handleCircleGesture = __bind(this._handleCircleGesture, this);
        this._handleFingerHover = __bind(this._handleFingerHover, this);
        this._canvasRender = __bind(this._canvasRender, this);
        this.render = __bind(this.render, this);
        _ref = DoodleDisplay.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      DoodleDisplay.prototype.events = {
        'fingerHover .doodle-canvas': '_handleFingerHover',
        'circle .doodle-canvas': '_handleCircleGesture'
      };

      DoodleDisplay.prototype.render = function() {
        var $canvas, canvas, context, height, width;
        this.validBits = [];
        this.$el.empty();
        $canvas = $('<canvas class="doodle-canvas"/>');
        this.$el.append($canvas);
        canvas = $canvas[0];
        canvas.width = this.$el.width();
        canvas.height = this.$el.height();
        context = canvas.getContext('2d');
        width = this.model.get('width');
        height = ((screen.height / screen.width) * width) | 0;
        this.squareWidth = ((this.$el.width() / width) | 0) - 1;
        this.squareHeight = ((this.$el.height() / height) | 0) - 1;
        return this._canvasRender(context, width, height, this.squareWidth, this.squareHeight);
      };

      DoodleDisplay.prototype._canvasRender = function(context, width, height, squareWidth, squareHeight) {
        var bit, _i, _len, _ref1,
          _this = this;
        if (this.validBits.length !== 0) {
          _ref1 = this.validBits;
          for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
            bit = _ref1[_i];
            context.fillStyle = getRandomColor();
            context.fillRect(bit[1] * (squareWidth + 1), bit[0] * (squareHeight + 1), squareWidth, squareHeight);
          }
        }
        return this.timeout = setTimeout((function() {
          return requestAnimationFrame((function() {
            return _this._canvasRender(context, width, height, squareWidth, squareHeight);
          }));
        }), this.model.get('randomizeRate'));
      };

      DoodleDisplay.prototype._handleFingerHover = function(ev, pos0, pos1, pos2) {
        var bit, canvas, context;
        bit = this._pixelsToGrid(pos0, pos2);
        this.validBits.push(bit);
        canvas = this.$('canvas')[0];
        context = canvas.getContext('2d');
        context.fillStyle = getRandomColor();
        return context.fillRect(bit[1] * (this.squareWidth + 1), bit[0] * (this.squareHeight + 1), this.squareWidth, this.squareHeight);
      };

      DoodleDisplay.prototype._handleCircleGesture = function(ev, gest) {
        var canvas;
        if (gest.progress >= 3) {
          this.validBits = [];
          canvas = this.$('canvas')[0];
          return canvas.width = canvas.width;
        }
      };

      DoodleDisplay.prototype._pixelsToGrid = function(left, top) {
        var i, j;
        i = (top / this.squareHeight) | 0;
        j = (left / this.squareWidth) | 0;
        return [i, j];
      };

      DoodleDisplay.prototype.remove = function() {
        DoodleDisplay.__super__.remove.call(this);
        return window.clearTimeout(this.timeout != null);
      };

      return DoodleDisplay;

    })(Backbone.View);
    getRandomColor = function() {
      var blue, color, green, red;
      red = getRandomInteger(255);
      green = getRandomInteger(255);
      blue = getRandomInteger(255);
      color = "rgb(" + red + "," + green + "," + blue + ")";
      return color;
    };
    return getRandomInteger = function(cap) {
      return Math.random() * cap | 0;
    };
  })();

}).call(this);
