$(document).on('click','#newly-assigned-athlete', function(){
   $(this).parents(".sidebar-add-athlete-list").hide();
   console.log("tada");
});

$(document).on('page:change', function() {
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });
});
