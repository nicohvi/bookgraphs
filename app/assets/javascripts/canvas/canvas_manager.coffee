class CanvasManager extends EventEmitter

  constructor: (el) ->
    @plotPoints = []
    @timeline = []
    @mode = 'EDIT'
    @canvas = Snap(el)
    @initHandlers()

  initHandlers: ->
    @.on 'preview', =>
      @mode = 'PREVIEW'
      @_previewNodes()

    @.on 'edit', =>
      @mode = 'EDIT'
      @_editNodes()

    @.on 'plot_point', (plotPoint) =>
      @addPlotPoint(plotPoint)

  addPlotPoint: (options) ->
    plotPoint = new PlotPoint(options, @canvas)
    @_addHandler(plotPoint)
    @plotPoints.push(plotPoint)

    # timeline management
    @_addEdge(@plotPoints[@plotPoints.length-2], plotPoint) if @plotPoints.length > 1

  getPlotPoints: ->
    @plotPoints

  _addHandler: (plotPoint) ->
    plotPoint.on 'dragging', =>
      return false if @mode == 'PREVIEW'
      for edge in @timeline
        if edge.startPoint == plotPoint
          @_removeEdge(edge, plotPoint, true)
        else if edge.stopPoint == plotPoint
          @_removeEdge(edge, plotPoint, false)

    plotPoint.on 'hover', =>
      return false unless @mode == 'PREVIEW'
      @.emit 'plot_point:show', plotPoint

    plotPoint.on 'hover_out', =>
      @.emit 'plot_point:hide', event

    plotPoint.on 'delete', =>
      console.log 'yeah yeah'

  _addEdge: (start, stop) ->
    options =
      startPoint: start
      stopPoint: stop
    edge = new Edge(options, @canvas)

    @timeline.push(edge)

  _removeEdge: (edge, plotPoint, start) ->
    if start then @_addEdge(plotPoint, edge.stopPoint) else @_addEdge(edge.startPoint, plotPoint)
    @timeline.splice(@timeline.indexOf(edge), 1)
    edge.delete()

  _previewNodes: ->
    for plotPoint in @plotPoints
      plotPoint.preview()

  _editNodes: ->
    for plotPoint in @plotPoints
      plotPoint.edit()


@CanvasManager = CanvasManager
