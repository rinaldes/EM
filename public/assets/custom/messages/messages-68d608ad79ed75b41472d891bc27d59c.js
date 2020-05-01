$('body').on('click','a[data-toggle="modal"]',function(e){
  var action = $(this).attr('data-href');
  $.ajax({
    type: "GET",
    url : action,
    success: function(response) {
      $('<div class="modal ajax-modal fade"></div>').html(response).modal();
    }
  });
  e.preventDefault();
});
