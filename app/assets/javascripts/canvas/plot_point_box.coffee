class PlotPointBox extends EventEmitter

  constructor: (el) ->
    @el = $(el)
    @initBindings()

  initBindings: ->
    @el.on 'mouseout', =>
      @timer()

    @el.on 'mouseover', =>
      clearTimeout(@timeoutID)

  show: (plotPoint) ->
    @el.find('.name').text(plotPoint.name)
    if plotPoint.description.length != 0
      @el.find('.desc').show()
      @el.find('.desc').text(plotPoint.description)
    else
      @el.find('.desc').hide()
    @el.css
      left: plotPoint.x
      top: plotPoint.y
    @el.show()

  timer: ->
    clearTimeout(@timeoutID)
    @timeoutID = setTimeout( => @hide(),
    2000)

  hide: ->
    @el.hide()
    @el.find('.name').text('')
    @el.find('.desc').text('')

@PlotPointBox = PlotPointBox
