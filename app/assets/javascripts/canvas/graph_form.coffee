class GraphForm

  constructor: (@id) ->
    @el = $('#graph_form')
    @canvasManager = new CanvasManager('#canvas')
    @plotPointForm = new PlotPointForm('#plot_point_form')
    @modeToggler = $('.radio-button')
    @initBindings()
    @initHandlers()
    @ENV = 'DEBUG'

  initBindings: ->
    @modeToggler.on 'change', =>
      value = @modeToggler.data('value')
      @canvasManager.trigger(value)

    $('#canvas').on 'dblclick', (event) =>
      $canvas = $(event.target).offset()
      coordinates =
        x: event.pageX - $canvas.left
        y: event.pageY - $canvas.top

      @plotPointForm.trigger 'dialog:show', [coordinates]

    $(window).on 'keydown', (event) =>
      if event.which == 27 then @plotPointForm.trigger 'dialog:close'

    $('#canvas').on 'contextmenu', (event) ->
      event.preventDefault()


  initHandlers: ->
    @plotPointForm.on 'dialog:fetched', (html) =>
      @el.append(html)

    @plotPointForm.on 'plot_point:new', (plot_point) =>
      @canvasManager.trigger 'plot_point', [plot_point]

@GraphForm = GraphForm
