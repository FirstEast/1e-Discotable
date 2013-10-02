(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var _ref;
    return disco.leap.LeapModel = (function(_super) {
      __extends(LeapModel, _super);

      function LeapModel() {
        _ref = LeapModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      LeapModel.prototype.defaults = function() {
        return {
          lastFrame: null,
          currentGestures: []
        };
      };

      return LeapModel;

    })(Backbone.Model);
  })();

}).call(this);
