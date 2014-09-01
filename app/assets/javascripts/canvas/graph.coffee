class Graph

  constructor: (@id) ->
    @el = $('#graph')
    #constants
    # FADE_TIMER = 500 #ms
    # FADING = false

    @canvasManager = new CanvasManager('#canvas')
    @plotManager = new PlotManager()
    @modeToggler = $('input:radio')
    @initBindings()
    @initHandlers()

  initBindings: ->
    @modeToggler.on 'change', =>
      value = @modeToggler.val()
      @canvasManager.trigger(value)

  initHandlers: ->
    @canvasManager.on 'event:dialog', (coordinates) =>
      @plotManager.emit 'dialog', coordinates

    @plotManager.on 'plot:dialog', (html, callback) =>
      @el.append(html)
      callback()

  # initHandlers: ->
    # @canvasManager.on 'event dialog', (coordinates) =>
    #   @eventDialog.css left: coordinates.x, top: coordinates.y
    #   @eventDialog.fadeIn()
    #   @nameInput.focus()
    #
    # @eventDialog.on 'click', =>
    #   @nameInput.focus() unless @nameInput.val().lenght > 1
    #
    # $(window).on 'keydown', (event) =>
    #   if event.which == 27
    #     @eventDialog.fadeOut()
    #   else if event.which == 13
    #     options =
    #       name: @nameInput.val()
    #       desc: @descInput.val()
    #       x: @eventDialog.offset().left
    #       y: @eventDialog.offset().top
    #     @canvasManager.addBookEvent(options)
    #     cleanInput()
    #     @eventDialog.fadeOut()
    #
    # cleanInput = ->
    #   $nameInput.val('')
    #   $descInput.val('').blur()

@Graph = Graph
