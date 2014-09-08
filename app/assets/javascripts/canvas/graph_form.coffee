class GraphForm

  constructor: (@id) ->
    @el = $('#graph_form')
    @canvasManager = new CanvasManager('#canvas')
    @plotManager = new PlotManager()
    @modeToggler = $('input:radio')
    @initBindings()
    @initHandlers()

  initBindings: ->
    @modeToggler.on 'change', =>
      value = @modeToggler.val()
      @canvasManager.trigger(value)

    $('#canvas').on 'dblclick', (event) =>
      $canvas = $(event.target).offset()
      coordinates =
        x: event.pageX - $canvas.left
        y: event.pageY - $canvas.top

      @plotManager.trigger 'dialog:show', [coordinates]

    $(window).on 'keydown', (event) =>
      if event.which == 27 then @plotManager.trigger 'dialog:close'

    $('#graph_form').on 'contextmenu', (event) ->
      event.preventDefault()


  initHandlers: ->
    @plotManager.on 'dialog:fetched', (html) =>
      @el.append(html)

    @plotManager.on 'plot_point:new', (plot_point) =>
      @canvasManager.trigger 'plot_point', [plot_point]

@GraphForm = GraphForm
