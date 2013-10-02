(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var _ref;
    return disco.DisplayMenu = (function(_super) {
      __extends(DisplayMenu, _super);

      function DisplayMenu() {
        this._handleFingerHover = __bind(this._handleFingerHover, this);
        this._setDoodle = __bind(this._setDoodle, this);
        this._setSlideshow = __bind(this._setSlideshow, this);
        this._set1ePattern = __bind(this._set1ePattern, this);
        this.render = __bind(this.render, this);
        this.initialize = __bind(this.initialize, this);
        _ref = DisplayMenu.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      DisplayMenu.prototype.events = {
        'click .1e-pattern': '_set1ePattern',
        'click .slideshow': '_setSlideshow',
        'click .doodle': '_setDoodle',
        'fingerHover': '_handleFingerHover',
        'keyTap .1e-pattern': '_set1ePattern',
        'keyTap .slideshow': '_setSlideshow',
        'keyTap .doodle': '_setDoodle'
      };

      DisplayMenu.prototype.initialize = function(options) {
        this.session = options.session;
        return this.selectedDisplay = this.session.selectedDisplay;
      };

      DisplayMenu.prototype.render = function() {
        var source, template;
        source = $('#menu-view-template').html();
        template = Handlebars.compile(source);
        return this.$el.html(template());
      };

      DisplayMenu.prototype._set1ePattern = function() {
        return this.selectedDisplay.set('selected', this.session.discoDisplayModel.cid);
      };

      DisplayMenu.prototype._setSlideshow = function() {
        return this.selectedDisplay.set('selected', this.session.slideshowDisplayModel.cid);
      };

      DisplayMenu.prototype._setDoodle = function() {
        return this.selectedDisplay.set('selected', this.session.doodleDisplayModel.cid);
      };

      DisplayMenu.prototype._handleFingerHover = function(ev, pos0, pos1, pos2) {
        var $finger,
          _this = this;
        window.clearTimeout(this.hideTimeout);
        this.$el.addClass('hover');
        $finger = $('<div class="finger-div"/>').html('&times;').css({
          left: pos0,
          top: pos2
        });
        this.$el.append($finger);
        return this.hideTimeout = setTimeout((function() {
          return _this.$el.removeClass('hover');
        }), 1000);
      };

      return DisplayMenu;

    })(Backbone.View);
  })();

}).call(this);
