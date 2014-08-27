class CanvasManager extends EventEmitter

  constructor: (el) ->
    @bookEvents = []
    @timeline = []
    @mode = 'EDIT'
    @canvas = Snap(el)
    @initEvents()
    @initHandlers()

  initEvents: ->
    @canvas.dblclick (event) =>
      return if @mode == 'PREVIEW'
      @.emit 'event:dialog', { x: event.x, y: event.y }

  initHandlers: ->
    @.on 'preview', =>
      @mode = 'PREVIEW'

    @.on 'edit', =>
      @mode = 'EDIT'

  addBookEvent: (options) ->
    event = new BookEvent(options, @canvas)
    @_addHandler(event)
    @bookEvents.push(event)

    # timeline management
    @_addEdge(@bookEvents[@bookEvents.length-2], event) if @bookEvents.length > 1

  _addHandler: (bookEvent) ->
    bookEvent.on 'dragging', =>
      for edge in @timeline
        @_removeEdge(edge, bookEvent) if edge.startEvent == bookEvent|| edge.stopEvent == bookEvent

  _addEdge: (start, stop) ->
    options =
      startEvent: start
      stopEvent: stop
    edge = new Edge(options, @canvas)

    @timeline.push(edge)

  _removeEdge: (edge, bookEvent) ->
    if bookEvent == edge.startEvent
      @_addEdge(bookEvent, edge.stopEvent)
    else if bookEvent == edge.stopEvent
      @_addEdge(edge.startEvent, bookEvent)
    @timeline.splice(@timeline.indexOf(edge), 1)
    edge.delete()


@CanvasManager = CanvasManager
