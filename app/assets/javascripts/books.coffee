$ ->

  $(@).on 'scroll', ->
    scalar = $(@).scrollTop()
    opacityVal = (scalar / 150.0)

    $('.blur').css('opacity', opacityVal)
