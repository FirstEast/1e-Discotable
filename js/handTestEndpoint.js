(function() {
  var count, getDistBetween, handDataCallback, hands, processSkeleton;

  hands = {};

  count = 0;

  $(document).ready(function() {
    return listenToHands(handDataCallback);
  });

  handDataCallback = function(data) {
    var skeleton, _i, _len, _ref, _results;
    count++;
    _ref = data.skeletons;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      skeleton = _ref[_i];
      if (skeleton.id !== 0) {
        _results.push(processSkeleton(skeleton));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  processSkeleton = function(skeleton) {
    var $hand, currentPoint, joint, newPoint, _i, _len, _ref, _results;
    if (hands[skeleton.id] == null) {
      hands[skeleton.id] = $("<div id='" + skeleton.id + "' class='hand-div'/>").text(skeleton.id);
      $('body').append(hands[skeleton.id]);
    }
    _ref = skeleton.joints;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      joint = _ref[_i];
      if (joint.name === 'handright') {
        $hand = hands[skeleton.id];
        newPoint = {
          x: joint.x * 428.3 + joint.y * 1379.7 - joint.z * 464.7 + 1458.1,
          y: joint.x * 105.2 + joint.y * 375.3 - joint.z * 1661.5 + 3951.7
        };
        currentPoint = {
          x: $hand[0].offsetLeft,
          y: $hand[0].offsetTop
        };
        if (newPoint.x > -100 && newPoint.x < $('body').width()) {
          if (getDistBetween(currentPoint, newPoint) < 100 || (currentPoint.x === 0 && currentPoint.y === 0) || count > 30) {
            count = 0;
            _results.push($hand.css({
              left: newPoint.x,
              top: newPoint.y
            }));
          } else {
            _results.push(void 0);
          }
        } else {
          _results.push(void 0);
        }
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  getDistBetween = function(point1, point2) {
    var x, y;
    x = Math.pow(point1.x - point2.x, 2);
    y = Math.pow(point1.y - point2.y, 2);
    return Math.sqrt(x + y);
  };

}).call(this);
