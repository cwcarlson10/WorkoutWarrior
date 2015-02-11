function myselect() {
    console.log("Added routine");
    var ids = $.map($(".program_routines_exercise_id [id]"), function(n, i) {
      return n.id;
    });
    var this_id = ids[ids.length -1];
    console.log(this_id);
    this_id_with_hash = '#'+this_id;
    $(this_id_with_hash).select2({
      placeholder: "Select or Type an Exercise"
    });
};

$(document).on('touchcancel', '.js-combobox', function(e) {
  var field;
  field = $(e.target);
  field.trigger('touchstart');
  return field.trigger('touchend');
});

$(document).on('page:change', function(){
  console.log('hit page:change');
  $('#modal').on('shown.bs.modal', function() {
    myselect();
  });
  $('#modal').on('cocoon:after-insert', function(e, addedRoutine) {
    myselect();
  });
});

$(document).on('click','.remove-button', function(){
   $(this).parents(".dl-horizontal").hide();
});

$(document).on('click','#add-athlete', function(){
   $(this).parents("#ath-list").hide();
});

$(document).on('click','#delete-program', function(){
   $(this).parents(".thumbnail").hide();
});
