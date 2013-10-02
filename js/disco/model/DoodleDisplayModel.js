(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var _ref;
    return disco.DoodleDisplayModel = (function(_super) {
      __extends(DoodleDisplayModel, _super);

      function DoodleDisplayModel() {
        _ref = DoodleDisplayModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      DoodleDisplayModel.prototype.defaults = function() {
        return {
          randomizeRate: 500,
          width: 90
        };
      };

      return DoodleDisplayModel;

    })(Backbone.Model);
  })();

}).call(this);
