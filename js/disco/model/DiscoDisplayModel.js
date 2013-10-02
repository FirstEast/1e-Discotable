(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var _ref;
    return disco.DiscoDisplayModel = (function(_super) {
      __extends(DiscoDisplayModel, _super);

      function DiscoDisplayModel() {
        _ref = DiscoDisplayModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      DiscoDisplayModel.prototype.defaults = function() {
        return {
          randomMask: '../images/1EBMP.bmp',
          randomizeRate: 500,
          randomizeColors: true,
          colorSet: ['red', 'blue', 'green', 'orange', 'purple'],
          width: 90
        };
      };

      return DiscoDisplayModel;

    })(Backbone.Model);
  })();

}).call(this);
