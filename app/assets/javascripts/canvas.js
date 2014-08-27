// Manifest file for canvas (and snap.svg) logic.
//
//= require snap-svg
//= require event-emitter
//= require_tree ./canvas

$(document).ready(function() {
  window.graph = new Graph($('#graph').data('id'));
})
