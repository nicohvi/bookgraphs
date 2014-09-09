class GraphForm

  constructor: (@id) ->
    @el = $('#graph_form')
    @plotPointBox = new PlotPointBox('#plot_point')
    @canvasManager = new CanvasManager('#canvas')
    @plotPointForm = new PlotPointForm('#plot_point_form')
    @initBindings()
    @initHandlers()
    @ENV = 'DEBUG'

  initBindings: ->
    $('.radio-button').on 'click', (event) =>
      @plotPointBox.hide()
      $radio = $(event.delegateTarget)
      value = $radio.data('value')
      @canvasManager.trigger(value)
      $('.active').removeClass('active')
      $radio.addClass('active')

    $('#canvas').on 'dblclick', (event) =>
      return false unless @canvasManager.mode == 'EDIT'
      $canvas = $('#canvas').offset()
      coordinates =
        x: event.pageX - $canvas.left
        y: event.pageY - $canvas.top

      @plotPointForm.trigger 'dialog:show', [coordinates]

    $(window).on 'keydown', (event) =>
      if event.which == 27 then @plotPointForm.trigger 'dialog:close'

    $('#canvas').on 'contextmenu', (event) ->
      event.preventDefault()

  initHandlers: ->
    @plotPointForm.on 'plot_point:new', (plotPoint) =>
      @canvasManager.trigger 'plot_point', [plotPoint]

    @canvasManager.on 'plot_point:show', (plotPoint) =>
      @plotPointBox.show(plotPoint)

@GraphForm = GraphForm
