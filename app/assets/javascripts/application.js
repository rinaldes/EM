// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require ckeditor/init
//= require ckeditor/ckeditor
//= require ckeditor/config
//= require cocoon

$(document).ready(function(){
  $('.select-admin').select2({
    allowClear: true
  });

  $(".pickadate").pickadate({
  })

  $(".pickadate").pickatime({
    interval: 5
  })
});

$(document).ready(function () {
  $('.select-answer-type').on('change', function() {
    type = this.value
    if( (type == "Multiple Answer") || (type == "Selection") ){
      $('.answer-option').show()
    }else{
      $('.answer-option').hide()
    }
  });
});

$(document).ready(function(){
    $('.numeric').maskMoney({
      precision: 0
    });
});