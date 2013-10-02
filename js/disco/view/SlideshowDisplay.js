(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var _ref;
    return disco.SlideshowDisplay = (function(_super) {
      __extends(SlideshowDisplay, _super);

      function SlideshowDisplay() {
        this.remove = __bind(this.remove, this);
        this._drawNextSlide = __bind(this._drawNextSlide, this);
        this.render = __bind(this.render, this);
        this.initialize = __bind(this.initialize, this);
        _ref = SlideshowDisplay.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      SlideshowDisplay.prototype.initialize = function() {
        this.firstImg = $('<img class="slide"/>').attr('src', this.model.get('images')[this.model.get('index')]);
        return this.model.set('index', this.model.get('index') + 1);
      };

      SlideshowDisplay.prototype.render = function() {
        this.$el.html(this.firstImg);
        return this._drawNextSlide();
      };

      SlideshowDisplay.prototype._drawNextSlide = function() {
        this.$('img').attr('src', this.model.get('images')[this.model.get('index')]);
        this.model.set('index', this.model.get('index') + 1);
        return this.timeout = setTimeout(this._drawNextSlide, this.model.get('transitionRate'));
      };

      SlideshowDisplay.prototype.remove = function() {
        SlideshowDisplay.__super__.remove.call(this);
        return window.clearTimeout(this.timeout);
      };

      return SlideshowDisplay;

    })(Backbone.View);
  })();

}).call(this);
