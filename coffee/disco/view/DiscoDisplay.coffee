do ->
  class disco.DiscoDisplay extends Backbone.View
    events:
      'fingerHover .disco-canvas': '_renderFingerHover'

    render: =>
      @$el.empty()

      $canvas = $('<canvas class="disco-canvas"/>')
      @$el.append $canvas
      canvas = $canvas[0]
      canvas.width = @$el.width()
      canvas.height = @$el.height()
      context = canvas.getContext('2d')

      width = @model.get('width')
      height = ((screen.height / screen.width) * width) | 0

      @squareWidth = ((@$el.width() / width) | 0) - 1
      @squareHeight = ((@$el.height() / height) | 0) - 1

      @_getValidBits(@model.get('randomMask'), width, height)
      @_canvasRender(context, width, height, @squareWidth, @squareHeight)

    _canvasRender: (context, width, height, squareWidth, squareHeight) =>
      if @validBits.length != 0
        for bit in @validBits
          context.fillStyle = getRandomColor()
          context.fillRect(bit[1]*(squareWidth + 1), bit[0]*(squareHeight + 1), squareWidth, squareHeight)
      @timeout = setTimeout((=> requestAnimationFrame((=> @_canvasRender(context, width, height, squareWidth, squareHeight)))), 
        @model.get('randomizeRate')
      )

    _renderFingerHover: (ev, pos0, pos1, pos2) =>
      bit = @_pixelsToGrid(pos0, pos2)

      canvas = @$('canvas')[0]
      context = canvas.getContext('2d')

      context.fillStyle = getRandomColor()
      context.fillRect(bit[1]*(@squareWidth + 1), bit[0]*(@squareHeight + 1), @squareWidth, @squareHeight)
      
      setTimeout( (=>
        if _.where(@validBits, {0: bit[0], 1:bit[1]}).length == 0
          context.fillStyle = 'black'
          context.fillRect(bit[1]*(@squareWidth + 1), bit[0]*(@squareHeight + 1), @squareWidth, @squareHeight)
      ), 200)

    _getValidBits: (mask, width, height) =>
      @validBits = []
      canvas = $('<canvas/>').hide()[0]
      @$el.append canvas

      img = new Image()
      img.src = mask

      # H4XX0R5
      img.onload = =>
        canvas.width = width
        canvas.height = height
        ctx = canvas.getContext('2d')
        ctx.drawImage(img, 0, 0, width, height)

        imgData = ctx.getImageData(0, 0, width, height)
        for i in [0..height - 1]
          for j in [0..width - 1]
            red = imgData.data[(i * canvas.width + j) * 4]
            green = imgData.data[(i * canvas.width + j) * 4 + 1]
            blue = imgData.data[(i * canvas.width + j) * 4 + 2]
            
            if red + green + blue < 200 * 3
              @validBits.push([i, j])

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