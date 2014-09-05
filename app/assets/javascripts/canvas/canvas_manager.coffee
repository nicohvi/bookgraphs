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

    @.on 'edit', =>
      @mode = 'EDIT'

    @.on 'plot_point', (plotPoint) =>
      @addPlotPoint(plotPoint)

  addPlotPoint: (options) ->
    plotPoint = new PlotPoint(options, @canvas)
    @_addHandler(plotPoint)
    @plotPoints.push(plotPoint)

    # timeline management
    @_addEdge(@plotPoints[@plotPoints.length-2], plotPoint) if @plotPoints.length > 1

  _addHandler: (plotPoint) ->
    plotPoint.on 'dragging', =>
      for edge in @timeline
        @_removeEdge(edge, plotPoint) if edge.startPoint == plotPoint|| edge.endPoint == plotPoint

  _addEdge: (start, stop) ->
    options =
      startEvent: start
      stopEvent: stop
    edge = new Edge(options, @canvas)

    @timeline.push(edge)

  _removeEdge: (edge, plotPoint) ->
    if plotPoint == edge.startPoint
      @_addEdge(plotpoint, edge.stopPoint)
    else if plotPoint == edge.stopPoint
      @_addEdge(edge.startPoint, plotPoint)
    @timeline.splice(@timeline.indexOf(edge), 1)
    edge.delete()


@CanvasManager = CanvasManager
