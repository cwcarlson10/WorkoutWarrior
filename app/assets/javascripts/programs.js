$(document).ready(function() {
  $('#new_program').on('cocoon:after-insert', function(e, addedRoutine) {
    console.log("Added routine");
    var ids = $.map($(".program_routines_exercise_id [id]"), function(n, i) {
      return n.id;
    });
    var this_id = ids[ids.length -1];
    console.log(this_id);
    $('#'+this_id).select2();
  });
});
