(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  (function() {
    disco.leap.FrameHelper = $('<div/>');
    return disco.leap.LeapController = (function() {
      function LeapController(options) {
        this._processFrame = __bind(this._processFrame, this);
        this._initializeLeap = __bind(this._initializeLeap, this);
        this._initializeComponents = __bind(this._initializeComponents, this);
        this.options = options;
        this.leapModel = options.leapModel;
        this.leapModel.on('frame', this._processFrame);
        this._initializeComponents();
        this._initializeLeap();
      }

      LeapController.prototype._initializeComponents = function() {
        this.interactionBox = new Leap.InteractionBox({
          size: [400, 300, 300],
          center: [0, 100, -150]
        });
        this.sanitizer = new disco.leap.DataSanitizer({
          interactionBox: this.interactionBox,
          leapModel: this.leapModel
        });
        return this.fingerRenderer = new disco.leap.FingerRenderer({
          interactionBox: this.interactionBox,
          leapModel: this.leapModel
        });
      };

      LeapController.prototype._initializeLeap = function() {
        var _this = this;
        return Leap.loop({
          enableGestures: true
        }, function(data) {
          _this.leapModel.trigger('frame', data);
          return disco.leap.FrameHelper.trigger('frame', data);
        });
      };

      LeapController.prototype._processFrame = function(frame) {
        var $target, gesture, position, _i, _len, _ref, _results;
        if (this.options.sanitizeData) {
          this.leapModel.trigger('sanitize', frame);
        }
        if (frame != null) {
          if (this.options.drawFingers) {
            this.leapModel.trigger('drawFingers', frame);
          }
          if (frame.gestures.length !== 0) {
            _ref = frame.gestures;
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              gesture = _ref[_i];
              if (gesture.type === 'keyTap') {
                position = disco.leap.LeapUtils.normalizeToScreen(this.interactionBox, gesture.position);
                $target = $(document.elementFromPoint(position[0], position[2]));
                _results.push($target.trigger('keyTap', gesture));
              } else if (gesture.type === "circle") {
                position = disco.leap.LeapUtils.normalizeToScreen(this.interactionBox, gesture.center);
                $target = $(document.elementFromPoint(position[0], position[2]));
                _results.push($target.trigger('circle', gesture));
              } else {
                _results.push(void 0);
              }
            }
            return _results;
          }
        }
      };

      return LeapController;

    })();
  })();

}).call(this);
