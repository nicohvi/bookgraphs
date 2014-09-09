class PlotPoint extends EventEmitter

  constructor: (options, canvas) ->
    @name = options.name
    @desc = options.desc
    @x = options.x
    @y = options.y
    @node = canvas.circle options.x, options.y, 10
    @nodeSetup()
    @edit()

  nodeSetup: ->
    @node.attr
      fill: 'red'

    # @node.mousedown (event) =>
      # if event.which == 3 # right click
        # @.emit 'menu' # show custom context menu on right-click

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

@PlotPoint = PlotPoint
