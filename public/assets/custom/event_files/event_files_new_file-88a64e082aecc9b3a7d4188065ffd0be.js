function removeError(){
  $("div.form-group p").remove();
  if ($(".form-group").hasClass('has-error')) $(".form-group").removeClass('has-error');
}
;
