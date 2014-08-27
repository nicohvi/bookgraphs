$ ->

  $('#new_graph').on 'ajax:success', (event, html) ->
    $('body').append(html)
