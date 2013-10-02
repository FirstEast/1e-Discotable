do ->
  FRAME_DROP_RATE = 4

  class disco.leap.DataSanitizer
    constructor: (options) ->
      @interactionBox = options.interactionBox
      @leapModel = options.leapModel

      @leapModel.on 'sanitize', @_sanitizeFrame

    _sanitizeFrame: (frame) =>
      if frame.id%FRAME_DROP_RATE == 0 or frame.gestures.length != 0
        return frame
      else
        return null