class PlotPoint extends EventEmitter

  constructor: (options, canvas) ->
    @name = options.name
    @desc = options.desc
    @node = canvas.circle options.x, options.y, 10
    @nodeSetup()

  nodeSetup: ->
    @node.attr
      fill: 'red'
    @node.drag()

    eve.on "snap.drag.move.#{@node.id}", =>
      @.emit 'dragging'

@PlotPoint = PlotPoint
