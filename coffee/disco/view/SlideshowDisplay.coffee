do ->
  class disco.SlideshowDisplay extends Backbone.View
    initialize: =>
      @firstImg = $('<img class="slide"/>').attr('src', @model.get('images')[@model.get('index')])
      @model.set('index', (@model.get('index') + 1))

    render: =>
      @$el.html @firstImg

      @_drawNextSlide()

    _drawNextSlide: =>
      @$('img').attr('src', @model.get('images')[@model.get('index')])
      @model.set('index', (@model.get('index') + 1))

      @timeout = setTimeout(@_drawNextSlide, @model.get('transitionRate'))

    remove: =>
      super()
      window.clearTimeout(@timeout) 