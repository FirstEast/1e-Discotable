(function() {
  (function() {
    var utils;
    disco.leap.LeapUtils = {};
    utils = disco.leap.LeapUtils;
    return utils.normalizeToScreen = function(box, point) {
      var norm;
      norm = box.normalizePoint(point);
      norm[0] = norm[0] * screen.width;
      norm[2] = norm[2] * screen.height;
      return norm;
    };
  })();

}).call(this);
