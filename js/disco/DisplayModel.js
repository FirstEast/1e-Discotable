(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    var _ref;
    return disco.DisplayModel = (function(_super) {
      __extends(DisplayModel, _super);

      function DisplayModel() {
        _ref = DisplayModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      DisplayModel.prototype.defaults = function() {
        return {
          isSlideShow: false,
          sldieShowImages: ['../images/1EBMP.bmp'],
          randomMask: '../images/1EBMP.bmp',
          randomizeRate: 200
        };
      };

      return DisplayModel;

    })(Backbone.Model);
  })();

}).call(this);
