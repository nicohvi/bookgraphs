class Edge

  constructor: (options, canvas) ->
    @path = canvas.path @getPath(options.startPoint, options.stopPoint)
    @setupPath()
    @startPoint = options.startPoint
    @stopPoint = options.stopPoint

  getPath: (startPoint, stopPoint) ->
    fromNodeBBox = startPoint.node.getBBox()
    toNodeBBox = stopPoint.node.getBBox()
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
