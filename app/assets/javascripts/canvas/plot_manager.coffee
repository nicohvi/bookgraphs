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
    unless @dialog
      Q( $.get "/plot_point_form" ).then( (html) => @.emit 'plot:dialog', html ).done( => @initDialog() )


  initDialog: ->
    @dialog = $()

@PlotManager = PlotManager
