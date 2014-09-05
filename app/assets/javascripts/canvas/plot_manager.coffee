class PlotManager extends EventEmitter

  constructor: ->
    @initHandlers()

  initHandlers: ->
    @.on 'dialog:show', (coordinates) =>
      @showDialog(coordinates)

    @.on 'dialog:close', (coordinates) =>
      @closeDialog(coordinates)

  showDialog: (coordinates) ->
    unless @dialog
      Q( $.get "/plot_point_form" ).then( (html) => @.emit 'dialog:fetched', html ).done( => @_initDialog(coordinates) )
    else
      @dialog.css left: coordinates.x, top: coordinates.y
      @dialog.show()
      @dialog.find('input[type=text]').focus()

  closeDialog: ->
    @dialog.find(':input').val('')
    @dialog.hide()

  _initDialog: (coordinates) ->
    @dialog = $('#plot_point_form')

    @dialog.on 'submit', (event) =>
      @.emit 'plot_point:new',
        name: @dialog.find('input').val()
        description: @dialog.find('textarea').val()
        x: @dialog.css('left')
        y: @dialog.css('top')

      @closeDialog()
      return false # stop the actual form submission

    @dialog.css left: coordinates.x, top: coordinates.y
    @dialog.find('input[type=text]').focus()

@PlotManager = PlotManager
