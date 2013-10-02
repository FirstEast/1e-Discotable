do ->
  class disco.DiscoTable extends Backbone.View
    initialize: (options) =>
      @session = options.session

      @_initializeViews()

      @listenTo @session.selectedDisplay, 'change', @render

    _initializeViews: =>
      @$el.append $('<div class="display-menu"/>')
      @displayMenu = new disco.DisplayMenu
        session: @session
        el: @$('.display-menu')

    render: =>
      @rendered?.remove()
      @displayMenu.render()

      @$('.display').remove()
      @$el.append $('<div class="display"/>')

      if @session.selectedDisplay.get('selected') == @session.discoDisplayModel.cid
        @rendered = new disco.DiscoDisplay
          model: @session.discoDisplayModel
          el: @$('.display')
        @rendered.render()

      else if @session.selectedDisplay.get('selected') == @session.slideshowDisplayModel.cid
        @rendered = new disco.SlideshowDisplay
          model: @session.slideshowDisplayModel
          el: @$('.display')
        @rendered.render()

      else if @session.selectedDisplay.get('selected') == @session.doodleDisplayModel.cid
        @rendered = new disco.DoodleDisplay
          model: @session.doodleDisplayModel
          el: @$('.display')
        @rendered.render()