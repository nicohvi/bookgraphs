class GraphForm

  constructor: (el) ->
    @el = $(el)
    @canvas = $('#canvas')
    @plotPointBox = new PlotPointBox('#plot_point')
    @canvasManager = new CanvasManager('#canvas')
    @plotPointForm = new PlotPointForm('#plot_point_form')
    @switch = $('.switch')
    @save = $('.save button')
    @initBindings()
    @initHandlers()
    @ENV = 'DEBUG'

  initBindings: ->
    @switch.on 'click', =>
      $('.active').removeClass('active')
      @plotPointBox.hide()
      @switch.toggleClass('on')
      if @switch.hasClass('on') then value = 'preview' else value = 'edit'
      $(".#{value}").addClass('active')
      @canvasManager.trigger(value)

    @canvas.on 'dblclick', (event) =>
      return false unless @canvasManager.mode == 'EDIT'
      $canvas = @canvas.offset()
      coordinates =
        x: event.pageX - $canvas.left
        y: event.pageY - $canvas.top

      @plotPointForm.trigger 'dialog:show', [coordinates]

    $(window).on 'keydown', (event) =>
      if event.which == 27 # escape
        @plotPointForm.trigger 'dialog:close'
        @plotPointBox.hide()

    @canvas.on 'contextmenu', (event) ->
      event.preventDefault()

  initHandlers: ->
    @plotPointForm.on 'plot_point:new', (plotPoint) =>
      @canvasManager.trigger 'plot_point', [plotPoint]

    @canvasManager.on 'plot_point:added', (plotPoint, index) =>
      for attribute, value of plotPoint
        @_addPlotPointField(attribute, value, index) # adding the DOM element

    @canvasManager.on 'plot_point:show', (plotPoint) =>
      @plotPointBox.show(plotPoint)

    @canvasManager.on 'plot_point:hide', (event) =>
      @plotPointBox.timer() if event.toElement.tagName == 'svg'

  _addPlotPointField: (attribute, value, index) ->
    $('<input>')
      .attr('type', 'hidden')
      .attr('name', "graph[plot_points_attributes][#{index}][#{attribute}]")
      .val(value)
      .appendTo(@el)

@GraphForm = GraphForm
