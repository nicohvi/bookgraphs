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
        if edge.startPoint == plotPoint
          @_removeEdge(edge, plotPoint, true)
        else if edge.stopPoint == plotPoint
          @_removeEdge(edge, plotPoint, false)

    plotPoint.on 'hover', =>
      return false unless @mode == 'PREVIEW'
      console.log "name: #{plotPoint.name}"
      console.log "desc: #{plotPoint.desc}"

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


@CanvasManager = CanvasManager
