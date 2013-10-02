(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function() {
    return disco.Session = (function(_super) {
      __extends(Session, _super);

      function Session(options) {
        this.discoDisplayModel = new disco.DiscoDisplayModel();
        this.slideshowDisplayModel = new disco.SlideshowDisplayModel();
        this.doodleDisplayModel = new disco.DoodleDisplayModel();
        this.selectedDisplay = new Backbone.Model({
          selected: this.discoDisplayModel.cid
        });
      }

      return Session;

    })(Backbone.Model);
  })();

}).call(this);
