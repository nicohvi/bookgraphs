class Edge

  constructor: (options, canvas) ->
    @path = canvas.path @getPath(options.startEvent, options.stopEvent)
    @setupPath()
    @startEvent = options.startEvent
    @stopEvent = options.stopEvent

  getPath: (startEvent, stopEvent) ->
    fromNodeBBox = startEvent.node.getBBox()
    toNodeBBox = stopEvent.node.getBBox()
    "M#{fromNodeBBox.x + fromNodeBBox.width/2},#{fromNodeBBox.y + fromNodeBBox.height/2}
      L#{toNodeBBox.x + toNodeBBox.width/2}, #{toNodeBBox.y + toNodeBBox.height/2}"

  setupPath: ->
    @path.attr
      fill: 'transparent'
      stroke: 'black'
      strokeWidth: 3
    @path.toBack()

  delete: ->
    @path.remove()


@Edge = Edge
