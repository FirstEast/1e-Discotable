(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var getRandomColor, getRandomInteger, _ref;
    disco.DiscoDisplay = (function(_super) {
      __extends(DiscoDisplay, _super);

      function DiscoDisplay() {
        this.remove = __bind(this.remove, this);
        this._pixelsToGrid = __bind(this._pixelsToGrid, this);
        this._getValidBits = __bind(this._getValidBits, this);
        this._renderFingerHover = __bind(this._renderFingerHover, this);
        this._canvasRender = __bind(this._canvasRender, this);
        this.render = __bind(this.render, this);
        _ref = DiscoDisplay.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      DiscoDisplay.prototype.events = {
        'fingerHover .disco-canvas': '_renderFingerHover'
      };

      DiscoDisplay.prototype.render = function() {
        var $canvas, canvas, context, height, width;
        this.$el.empty();
        $canvas = $('<canvas class="disco-canvas"/>');
        this.$el.append($canvas);
        canvas = $canvas[0];
        canvas.width = this.$el.width();
        canvas.height = this.$el.height();
        context = canvas.getContext('2d');
        width = this.model.get('width');
        height = ((screen.height / screen.width) * width) | 0;
        this.squareWidth = ((this.$el.width() / width) | 0) - 1;
        this.squareHeight = ((this.$el.height() / height) | 0) - 1;
        this._getValidBits(this.model.get('randomMask'), width, height);
        return this._canvasRender(context, width, height, this.squareWidth, this.squareHeight);
      };

      DiscoDisplay.prototype._canvasRender = function(context, width, height, squareWidth, squareHeight) {
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

      DiscoDisplay.prototype._renderFingerHover = function(ev, pos0, pos1, pos2) {
        var bit, canvas, context,
          _this = this;
        bit = this._pixelsToGrid(pos0, pos2);
        canvas = this.$('canvas')[0];
        context = canvas.getContext('2d');
        context.fillStyle = getRandomColor();
        context.fillRect(bit[1] * (this.squareWidth + 1), bit[0] * (this.squareHeight + 1), this.squareWidth, this.squareHeight);
        return setTimeout((function() {
          if (_.where(_this.validBits, {
            0: bit[0],
            1: bit[1]
          }).length === 0) {
            context.fillStyle = 'black';
            return context.fillRect(bit[1] * (_this.squareWidth + 1), bit[0] * (_this.squareHeight + 1), _this.squareWidth, _this.squareHeight);
          }
        }), 200);
      };

      DiscoDisplay.prototype._getValidBits = function(mask, width, height) {
        var canvas, img,
          _this = this;
        this.validBits = [];
        canvas = $('<canvas/>').hide()[0];
        this.$el.append(canvas);
        img = new Image();
        img.src = mask;
        return img.onload = function() {
          var blue, ctx, green, i, imgData, j, red, _i, _ref1, _results;
          canvas.width = width;
          canvas.height = height;
          ctx = canvas.getContext('2d');
          ctx.drawImage(img, 0, 0, width, height);
          imgData = ctx.getImageData(0, 0, width, height);
          _results = [];
          for (i = _i = 0, _ref1 = height - 1; 0 <= _ref1 ? _i <= _ref1 : _i >= _ref1; i = 0 <= _ref1 ? ++_i : --_i) {
            _results.push((function() {
              var _j, _ref2, _results1;
              _results1 = [];
              for (j = _j = 0, _ref2 = width - 1; 0 <= _ref2 ? _j <= _ref2 : _j >= _ref2; j = 0 <= _ref2 ? ++_j : --_j) {
                red = imgData.data[(i * canvas.width + j) * 4];
                green = imgData.data[(i * canvas.width + j) * 4 + 1];
                blue = imgData.data[(i * canvas.width + j) * 4 + 2];
                if (red + green + blue < 200 * 3) {
                  _results1.push(this.validBits.push([i, j]));
                } else {
                  _results1.push(void 0);
                }
              }
              return _results1;
            }).call(_this));
          }
          return _results;
        };
      };

      DiscoDisplay.prototype._pixelsToGrid = function(left, top) {
        var i, j;
        i = (top / this.squareHeight) | 0;
        j = (left / this.squareWidth) | 0;
        return [i, j];
      };

      DiscoDisplay.prototype.remove = function() {
        DiscoDisplay.__super__.remove.call(this);
        return window.clearTimeout(this.timeout != null);
      };

      return DiscoDisplay;

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
