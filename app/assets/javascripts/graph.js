// Manifest file for displaying graphs
//= require snap-svg
//= require_tree ./graph

$(document).ready(function() {
  window.graph = new GraphForm($('#graph_form').data('id'));
})
