(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var _ref;
    return disco.DiscoTable = (function(_super) {
      __extends(DiscoTable, _super);

      function DiscoTable() {
        this.render = __bind(this.render, this);
        this._initializeViews = __bind(this._initializeViews, this);
        this.initialize = __bind(this.initialize, this);
        _ref = DiscoTable.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      DiscoTable.prototype.initialize = function(options) {
        this.session = options.session;
        this._initializeViews();
        return this.listenTo(this.session.selectedDisplay, 'change', this.render);
      };

      DiscoTable.prototype._initializeViews = function() {
        this.$el.append($('<div class="display-menu"/>'));
        return this.displayMenu = new disco.DisplayMenu({
          session: this.session,
          el: this.$('.display-menu')
        });
      };

      DiscoTable.prototype.render = function() {
        var _ref1;
        if ((_ref1 = this.rendered) != null) {
          _ref1.remove();
        }
        this.displayMenu.render();
        this.$('.display').remove();
        this.$el.append($('<div class="display"/>'));
        if (this.session.selectedDisplay.get('selected') === this.session.discoDisplayModel.cid) {
          this.rendered = new disco.DiscoDisplay({
            model: this.session.discoDisplayModel,
            el: this.$('.display')
          });
          return this.rendered.render();
        } else if (this.session.selectedDisplay.get('selected') === this.session.slideshowDisplayModel.cid) {
          this.rendered = new disco.SlideshowDisplay({
            model: this.session.slideshowDisplayModel,
            el: this.$('.display')
          });
          return this.rendered.render();
        } else if (this.session.selectedDisplay.get('selected') === this.session.doodleDisplayModel.cid) {
          this.rendered = new disco.DoodleDisplay({
            model: this.session.doodleDisplayModel,
            el: this.$('.display')
          });
          return this.rendered.render();
        }
      };

      return DiscoTable;

    })(Backbone.View);
  })();

}).call(this);
