# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#categories-div').on('change', function () {
  $('#exercises-div').

});

$(function() {
    var categories = Exercise.categories
    $( "#categories-div" ).autocomplete({
      source: categories
    });
  });