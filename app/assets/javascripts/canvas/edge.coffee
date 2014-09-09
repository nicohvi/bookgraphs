class Edge

  constructor: (options, canvas) ->
    @path = canvas.path @getPath(options.startPoint.node, options.stopPoint.node)
    @setupPath()
    @startPoint = options.startPoint
    @stopPoint = options.stopPoint

  getPath: (startNode, stopNode) ->
    startTuple = startNode.getBBox()
    stopTuple = stopNode.getBBox()
    [x0, y0] = [startTuple.x + startTuple.width/2, startTuple.y + startTuple.height/2]
    [x1, y1] = [stopTuple.x + stopTuple.width/2 , stopTuple.y + stopTuple.height/2 ]
    # MATH BITCH
    alpha = Math.atan(Math.abs(y1-y0)/Math.abs(x1-x0))
    deltaY = 15 * Math.sin(alpha)
    deltaX = 15 * Math.cos(alpha)
    deltaX = -1*deltaX if x0 > x1 # the stop node is behind the start node
    deltaY = -1*deltaY if y0 < y1 # the stop node is lower than the start node
    "M#{x0+deltaX},#{y0-deltaY} L#{x1-deltaX},#{y1+deltaY}"

  setupPath: ->
    @path.attr
      fill: 'transparent'
      stroke: 'black'
      strokeWidth: 2
      'stroke-opacity': 0.8
    @path.toBack()

  delete: ->
    @path.remove()


@Edge = Edge
