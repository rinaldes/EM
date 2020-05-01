$(".ajax-modal").on('hidden.bs.modal', function () {
  $(this).data('bs.modal', null);
  $(this).remove();
});

array = new Array;
$(".CheckBox").each(function() {
  if ($(this).prop('checked')) {
    array.push($(this).val());
  }
  if (array.length == 0) {
    $('.broadcastAction').attr('disabled','disabled');
  } else {
    $('.broadcastAction').removeAttr('disabled');
  }
});

$(".selectAll").change(
  function() {
    $(this).parents('fieldset:eq(0)').find('.CheckBox').prop('checked', this.checked);
    if (count_all_checked() > 0){
      $('.broadcastAction').removeAttr('disabled');
    } else {
      $('.broadcastAction').attr('disabled','disabled');
    }
  }
);

$(".CheckBox").change(
  function() {
    if (count_all_checked() > 0){
      $('.broadcastAction').removeAttr('disabled');
    } else {
      $('.broadcastAction').attr('disabled','disabled');
    }
  }
);

function count_all_checked() {
  var count_checked = 0;
  $(".CheckBox").each(function () {
    if(this.checked ? $(this).val() : "") {
      count_checked ++;
    }
  });
  return count_checked;
}
;
