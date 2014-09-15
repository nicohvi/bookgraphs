$ ->
  $.fn.center = ->
    @css('position', 'absolute')
    @css('top', (($(window).height() - this.outerHeight()) / 2) + $(window).scrollTop() + "px")
    @
