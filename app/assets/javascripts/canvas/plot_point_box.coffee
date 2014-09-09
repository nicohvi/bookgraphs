class PlotPointBox extends EventEmitter

  constructor: (el) ->
    @el = $(el)
    @transition = false
    @initBindings()

  initBindings: ->
    @el.on 'mouseout', (event) =>
      @hide() if event.toElement.tagName == 'svg'

  show: (plotPoint) ->
    return if @transition
    @transition = true

    @el.find('.name').text(plotPoint.name)
    if plotPoint.desc.length != 0
      @el.find('.desc').show()
      @el.find('.desc').text(plotPoint.desc)
    else
      @el.find('.desc').hide()
    @el.css
      left: plotPoint.x
      top: plotPoint.y + $('.mode').height()
    @el.show()
    @transition = false

  hide: ->
    @el.find('.name').text('')
    @el.find('.desc').text('')
    @el.hide()
    @transition = false

@PlotPointBox = PlotPointBox
