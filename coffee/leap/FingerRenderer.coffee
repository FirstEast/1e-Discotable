do ->
  class disco.leap.FingerRenderer
    constructor: (options) ->
      @leapModel = options.leapModel
      @interactionBox = options.interactionBox

      @leapModel.on 'drawFingers', @_drawFingers

      # @canvas = $('<canvas class="finger-canvas"/>')
      # $('body').append(@canvas)

    _drawFingers: (frame) =>
      $('.finger-div').remove()
      for finger in frame.fingers
        position = disco.leap.LeapUtils.normalizeToScreen(@interactionBox, finger.stabilizedTipPosition)
        # $el = $('<div class="finger-div"/>').text('').css
        #   left: position[0]
        #   top: position[2]

        $target = $(document.elementFromPoint(position[0], position[2]))
        $target.trigger 'fingerHover', position

        # $('body').append $el