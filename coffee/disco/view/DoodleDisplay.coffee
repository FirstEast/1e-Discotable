do ->
  class disco.DoodleDisplay extends Backbone.View
    events:
      'fingerHover .doodle-canvas': '_handleFingerHover'

      'circle .doodle-canvas': '_handleCircleGesture'

    render: =>
      @validBits = []
      @$el.empty()

      $canvas = $('<canvas class="doodle-canvas"/>')
      @$el.append $canvas
      canvas = $canvas[0]
      canvas.width = @$el.width()
      canvas.height = @$el.height()
      context = canvas.getContext('2d')

      width = @model.get('width')
      height = ((screen.height / screen.width) * width) | 0

      @squareWidth = ((@$el.width() / width) | 0) - 1
      @squareHeight = ((@$el.height() / height) | 0) - 1

      @_canvasRender(context, width, height, @squareWidth, @squareHeight)

    _canvasRender: (context, width, height, squareWidth, squareHeight) =>
      if @validBits.length != 0
        for bit in @validBits
          context.fillStyle = getRandomColor()
          context.fillRect(bit[1]*(squareWidth + 1), bit[0]*(squareHeight + 1), squareWidth, squareHeight)
      @timeout = setTimeout((=> requestAnimationFrame((=> @_canvasRender(context, width, height, squareWidth, squareHeight)))), 
        @model.get('randomizeRate')
      )

    _handleFingerHover: (ev, pos0, pos1, pos2) =>
      bit = @_pixelsToGrid(pos0, pos2)
      @validBits.push bit
      canvas = @$('canvas')[0]
      context = canvas.getContext('2d')

      context.fillStyle = getRandomColor()
      context.fillRect(bit[1]*(@squareWidth + 1), bit[0]*(@squareHeight + 1), @squareWidth, @squareHeight)

    _handleCircleGesture: (ev, gest) =>
      if gest.progress >= 3
        @validBits = []
        canvas = @$('canvas')[0]
        canvas.width = canvas.width

    _pixelsToGrid: (left, top) =>
      i = (top / @squareHeight) | 0
      j = (left / @squareWidth) | 0
      return [i, j]

    remove: =>
      super()
      window.clearTimeout(@timeout?)

  getRandomColor = ->
    red = getRandomInteger 255
    green = getRandomInteger 255
    blue = getRandomInteger 255
    color = "rgb(#{red},#{green},#{blue})"
    return color

  getRandomInteger = (cap) ->
    return Math.random()*cap | 0