class PlotPoint extends EventEmitter

  constructor: (options, canvas) ->
    @name = options.name
    @description = options.description
    @x = options.x
    @y = options.y
    @node = canvas.circle options.x, options.y, 10
    @nodeSetup()
    @edit()

  nodeSetup: ->
    @node.attr
      fill: '#3984a7'
      'fill-opacity': 0.8

  update: ->
    boundingBox = @node.getBBox()
    # offset the coordinates by the radius
    @x = boundingBox.x + 10
    @y = boundingBox.y + 10

  preview: ->
    @node.undrag()
    @node.hover(
      => @.emit 'hover',
      => @.emit 'hover_out', event
    )

  edit: ->
    @node.unhover()
    @node.drag()

    eve.on "snap.drag.move.#{@node.id}", =>
      @.emit 'dragging'
      @update()

  serialize: ->
    plotPoint =
      name: @name
      description: @description
      x: @x
      y: @y

@PlotPoint = PlotPoint
