(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  (function() {
    var FRAME_DROP_RATE;
    FRAME_DROP_RATE = 4;
    return disco.leap.DataSanitizer = (function() {
      function DataSanitizer(options) {
        this._sanitizeFrame = __bind(this._sanitizeFrame, this);
        this.interactionBox = options.interactionBox;
        this.leapModel = options.leapModel;
        this.leapModel.on('sanitize', this._sanitizeFrame);
      }

      DataSanitizer.prototype._sanitizeFrame = function(frame) {
        if (frame.id % FRAME_DROP_RATE === 0 || frame.gestures.length !== 0) {
          return frame;
        } else {
          return null;
        }
      };

      return DataSanitizer;

    })();
  })();

}).call(this);
