# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

section = ->
  $(".modal-body").html "<%= escape_javascript(render 'sections/form') %>"
  $("#myModalLabel").html "Add New Section"
  return
project = ->
  $(".modal-body").html "<%= escape_javascript(render 'projects/form') %>"
  $("#myModalLabel").html "Edit Project"
  return
sub = ->
  $(".modal-body").html "<%= escape_javascript(render 'subsections/form') %>"
  $("#myModalLabel").html "Add New Subsection"
  return
pro = ->
  $(".modal-body").html "<%= escape_javascript(render 'products/form') %>"
  $("#left").html "Add New Product"
  return