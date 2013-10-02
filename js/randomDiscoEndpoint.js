(function() {
  var BITMAP, NUM_SQUARE_SIDE, NUM_SQUARE_TOP, REFRESH_RATE, getRandomInteger, randomizeAllColors;

  NUM_SQUARE_SIDE = 48;

  NUM_SQUARE_TOP = NUM_SQUARE_SIDE * 1.5;

  REFRESH_RATE = 200;

  BITMAP = '../images/1EBMP.bmp';

  $(document).ready(function() {
    var $square, canvas, i, img, j, sidePercentage, topPercentage, _i, _j, _ref, _ref1;
    sidePercentage = 100 / NUM_SQUARE_SIDE;
    topPercentage = 100 / NUM_SQUARE_TOP;
    for (i = _i = 0, _ref = NUM_SQUARE_SIDE - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
      for (j = _j = 0, _ref1 = NUM_SQUARE_TOP - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
        $square = $("<div class='disco-square square-" + j + "-" + i + "'/>");
        $square.css({
          width: "" + topPercentage + "%",
          height: "" + sidePercentage + "%"
        });
        $('body').append($square);
      }
    }
    if (BITMAP != null) {
      canvas = $('<canvas/>').hide()[0];
      $('body').append(canvas);
      img = $('<img>').attr('src', BITMAP)[0];
      setTimeout((function() {
        var blue, ctx, green, imgData, red, _k, _ref2, _results;
        canvas.width = NUM_SQUARE_TOP;
        canvas.height = NUM_SQUARE_SIDE;
        ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, NUM_SQUARE_TOP, NUM_SQUARE_SIDE);
        imgData = ctx.getImageData(0, 0, NUM_SQUARE_TOP, NUM_SQUARE_SIDE);
        _results = [];
        for (i = _k = 0, _ref2 = NUM_SQUARE_SIDE - 1; 0 <= _ref2 ? _k <= _ref2 : _k >= _ref2; i = 0 <= _ref2 ? ++_k : --_k) {
          _results.push((function() {
            var _l, _ref3, _results1;
            _results1 = [];
            for (j = _l = 0, _ref3 = NUM_SQUARE_TOP - 1; 0 <= _ref3 ? _l <= _ref3 : _l >= _ref3; j = 0 <= _ref3 ? ++_l : --_l) {
              red = imgData.data[(i * canvas.width + j) * 4];
              green = imgData.data[(i * canvas.width + j) * 4 + 1];
              blue = imgData.data[(i * canvas.width + j) * 4 + 2];
              if (red + green + blue < 200 * 3) {
                _results1.push($(".square-" + j + "-" + i).addClass('on'));
              } else {
                _results1.push(void 0);
              }
            }
            return _results1;
          })());
        }
        return _results;
      }), 1000);
    } else {
      $('.disco-square').addClass('on');
    }
    randomizeAllColors();
    return setInterval(randomizeAllColors, REFRESH_RATE);
  });

  randomizeAllColors = function() {
    var $squares, blue, color, green, red, square, _i, _len, _results;
    $squares = $('body').find('.disco-square.on');
    _results = [];
    for (_i = 0, _len = $squares.length; _i < _len; _i++) {
      square = $squares[_i];
      red = getRandomInteger(255);
      green = getRandomInteger(255);
      blue = getRandomInteger(255);
      color = "rgb(" + red + "," + green + "," + blue + ")";
      _results.push($(square).css({
        background: color
      }));
    }
    return _results;
  };

  getRandomInteger = function(cap) {
    return Math.floor(Math.random() * cap);
  };

}).call(this);
