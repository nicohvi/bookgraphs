class PlotManager extends EventEmitter

  constructor: ->
    # jQuery objects
    # @eventDialog = $('#event-dialog')
    # @nameInput = $('input[type="text"]')
    # @descInput = $('textarea')
    # @event = $('#event')
    # @name = $('#event .name')
    # @desc = $('#event .desc')
    @initHandlers()

  initHandlers: ->
    @.on 'dialog', (coordinates) =>
      @showDialog(coordinates)

  showDialog: (coordinates) ->
    Q( $.get "" )

@PlotManager = PlotManager
