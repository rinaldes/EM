function programmes(event_id) {
  if ($('#agenda_id').val() != "") {
    $.ajax({
      type: "GET",
      url: "/events/" + event_id + "/questions/programmes",
      data: {
        'search': $('#search').val(),
        'agenda_id': $('#agenda_id').val(),
        'event_id': event_id
      },
      dataType: "script",
      success: "data"
    });
  }
}

function questions(event_id) {
	$('#programme-params').val($('#programme_id').val());
  $.ajax({
    type: "GET",
    url: "/events/" + event_id + "/questions",
    data: {
      'search': $('#search').val(),
      'programme_id': $('#programme_id').val(),
      'event_id': event_id
    },
    dataType: "script",
    success: "data"
  });
}
;
