do ->
  class disco.Session extends Backbone.Model
    constructor: (options) ->
      @discoDisplayModel = new disco.DiscoDisplayModel()
      @slideshowDisplayModel = new disco.SlideshowDisplayModel()
      @doodleDisplayModel = new disco.DoodleDisplayModel()

      @selectedDisplay = new Backbone.Model
        selected: @discoDisplayModel.cid