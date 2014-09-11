// Manifest file for canvas (and snap.svg) logic.
//
//= require snap-svg
//= require event-emitter
//= require_tree ./canvas

$(document).ready(function() {
  window.graphForm = new GraphForm('#new_graph')
})
