class PlotPointForm extends EventEmitter

  constructor: (el) ->
    @el = $(el)
    @initHandlers()
    @initBindings()

  initHandlers: ->
    @.on 'dialog:show', (coordinates) =>
      @showDialog(coordinates)

    @.on 'dialog:close', (coordinates) =>
      @closeDialog(coordinates)

  initBindings: ->
    @el.on 'submit', (event) =>
      $('.notice').remove()
      plot_point =
        name: @el.find('input[type=text]').val()
        desc: @el.find('textarea').val()
        x: @el.css 'left'
        y: @el.css 'top'

      if @_validate(plot_point)
        @.emit 'plot_point:new', plot_point
        @closeDialog()

      return false # prevent actual form submit

  showDialog: (coordinates) ->
    @el.css left: coordinates.x, top: coordinates.y
    @el.show()
    @el.find('input[type=text]').focus()

  closeDialog: ->
    @el.find(':input').val('').removeClass('error')
    @el.hide()

  _validate: (plot_point)->
    return true if graphForm.ENV = 'debug'
    if plot_point.name.length < 5
      @_error('name')
      return false
    else if plot_point.description.length < 5
      @_error('description')
      return false
    true

  _error: (field) ->
    $el = $("#plot_point_#{field}")
    $el.addClass('error')
    $('<span>')
      .addClass('notice notice-danger')
      .text("can't be blank")
      .appendTo($el.siblings('label'))

@PlotPointForm = PlotPointForm
