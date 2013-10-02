(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  (function() {
    return disco.leap.FingerRenderer = (function() {
      function FingerRenderer(options) {
        this._drawFingers = __bind(this._drawFingers, this);
        this.leapModel = options.leapModel;
        this.interactionBox = options.interactionBox;
        this.leapModel.on('drawFingers', this._drawFingers);
      }

      FingerRenderer.prototype._drawFingers = function(frame) {
        var $target, finger, position, _i, _len, _ref, _results;
        $('.finger-div').remove();
        _ref = frame.fingers;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          finger = _ref[_i];
          position = disco.leap.LeapUtils.normalizeToScreen(this.interactionBox, finger.stabilizedTipPosition);
          $target = $(document.elementFromPoint(position[0], position[2]));
          _results.push($target.trigger('fingerHover', position));
        }
        return _results;
      };

      return FingerRenderer;

    })();
  })();

}).call(this);
