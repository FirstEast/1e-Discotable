do ->
  class disco.leap.LeapModel extends Backbone.Model
    defaults: ->
      lastFrame: null
      currentGestures: []