do ->
  class disco.DiscoDisplayModel extends Backbone.Model
    defaults: ->
      randomMask: '../images/1EBMP.bmp'
      randomizeRate: 500
      randomizeColors: true
      colorSet: ['red', 'blue', 'green', 'orange', 'purple']
      width: 90