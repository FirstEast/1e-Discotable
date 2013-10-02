do ->
  disco.leap.FrameHelper = $('<div/>')

  class disco.leap.LeapController
    constructor: (options) ->
      @options = options
      @leapModel = options.leapModel

      @leapModel.on 'frame', @_processFrame

      @_initializeComponents()
      @_initializeLeap()

    _initializeComponents: =>
      @interactionBox = new Leap.InteractionBox
        size: [400, 300, 300]
        center: [0, 100, -150]
      @sanitizer = new disco.leap.DataSanitizer
        interactionBox: @interactionBox
        leapModel: @leapModel
      @fingerRenderer = new disco.leap.FingerRenderer
        interactionBox: @interactionBox
        leapModel: @leapModel

    _initializeLeap: =>
      Leap.loop( {enableGestures: true}, (data) =>
        @leapModel.trigger 'frame', data
        disco.leap.FrameHelper.trigger 'frame', data  
      )

    _processFrame: (frame) =>
      # Sanitize data
      if @options.sanitizeData
        @leapModel.trigger 'sanitize', frame

      # Possibility we chose to drop this frame after sanitation
      if frame?
        if @options.drawFingers
          @leapModel.trigger 'drawFingers', frame

        # HACKITY HACK (DON'T LOOK BACK)
        if frame.gestures.length != 0
          for gesture in frame.gestures
            if gesture.type == 'keyTap'
              position = disco.leap.LeapUtils.normalizeToScreen(@interactionBox, gesture.position)
              $target = $(document.elementFromPoint(position[0], position[2]))
              $target.trigger 'keyTap', gesture
            else if gesture.type == "circle"
              position = disco.leap.LeapUtils.normalizeToScreen(@interactionBox, gesture.center)
              $target = $(document.elementFromPoint(position[0], position[2]))
              $target.trigger 'circle', gesture