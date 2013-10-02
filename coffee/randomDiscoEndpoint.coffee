NUM_SQUARE_SIDE = 48
NUM_SQUARE_TOP = NUM_SQUARE_SIDE * 1.5

REFRESH_RATE = 200

BITMAP = '../images/1EBMP.bmp'

$(document).ready( ->
  # Calculate the square side lengths in %
  sidePercentage = 100 / NUM_SQUARE_SIDE
  topPercentage = 100 / NUM_SQUARE_TOP

  # Fill the body with divs that fit the screen well
  for i in [0..NUM_SQUARE_SIDE - 1]
    for j in [0..NUM_SQUARE_TOP - 1]
      $square = $("<div class='disco-square square-#{j}-#{i}'/>")
      $square.css
        width: "#{topPercentage}%"
        height: "#{sidePercentage}%"
      $('body').append $square

  if BITMAP?
    canvas = $('<canvas/>').hide()[0]
    $('body').append canvas

    img = $('<img>').attr('src', BITMAP)[0]

    setTimeout( (->
      canvas.width = NUM_SQUARE_TOP
      canvas.height = NUM_SQUARE_SIDE
      ctx = canvas.getContext("2d")
      ctx.drawImage(img, 0, 0, NUM_SQUARE_TOP, NUM_SQUARE_SIDE)

      imgData = ctx.getImageData(0, 0, NUM_SQUARE_TOP, NUM_SQUARE_SIDE)
      for i in [0..NUM_SQUARE_SIDE - 1]
        for j in [0..NUM_SQUARE_TOP - 1]
          red = imgData.data[(i * canvas.width + j) * 4]
          green = imgData.data[(i * canvas.width + j) * 4 + 1]
          blue = imgData.data[(i * canvas.width + j) * 4 + 2]
          
          if red + green + blue < 200 * 3
            $(".square-#{j}-#{i}").addClass('on')
    ), 1000)

  else
    $('.disco-square').addClass('on')

  randomizeAllColors()
  setInterval(randomizeAllColors, REFRESH_RATE)
)

randomizeAllColors = () ->
  $squares = $('body').find('.disco-square.on')
  for square in $squares
    red = getRandomInteger 255
    green = getRandomInteger 255
    blue = getRandomInteger 255
    color = "rgb(#{red},#{green},#{blue})"
    $(square).css
      background: color

getRandomInteger = (cap) ->
  return Math.floor(Math.random()*cap)