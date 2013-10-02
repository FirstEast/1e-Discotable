do ->
  class disco.DisplayMenu extends Backbone.View
    events:
      'click .1e-pattern': '_set1ePattern'
      'click .slideshow': '_setSlideshow'
      'click .doodle': '_setDoodle'

      'fingerHover': '_handleFingerHover'

      'keyTap .1e-pattern': '_set1ePattern'
      'keyTap .slideshow': '_setSlideshow'
      'keyTap .doodle': '_setDoodle'

    initialize: (options) =>
      @session = options.session
      @selectedDisplay = @session.selectedDisplay

    render: =>
      source = $('#menu-view-template').html()
      template = Handlebars.compile(source)
      @$el.html template()

    _set1ePattern: =>
      @selectedDisplay.set 'selected', @session.discoDisplayModel.cid

    _setSlideshow: =>
      @selectedDisplay.set 'selected', @session.slideshowDisplayModel.cid

    _setDoodle: =>
      @selectedDisplay.set 'selected', @session.doodleDisplayModel.cid

    _handleFingerHover: (ev, pos0, pos1, pos2) =>
      window.clearTimeout(@hideTimeout)
      @$el.addClass('hover')
      $finger = $('<div class="finger-div"/>').html('&times;').css
          left: pos0
          top: pos2
      @$el.append $finger
      @hideTimeout = setTimeout((=> @$el.removeClass('hover')), 1000)