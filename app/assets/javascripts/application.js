// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require_tree .

var readURL = function(input, preview) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $(preview).parent().removeClass('hide');
      $(preview).attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
};


$(document).ready(function(){

     // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered


    $('.carousel').carousel();
    $('select').material_select();
    $('.materialboxed').materialbox();
    $('.parallax').parallax();
    $('.modal').modal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .5, // Opacity of modal background
      inDuration: 300, // Transition in duration
      outDuration: 200, // Transition out duration
      startingTop: '4%', // Starting top style attribute
      endingTop: '10%', // Ending top style attribute
    }
  );

     var preview = "#img-preview > img";

      $("#post-attachment").click(function(){
        $("#post_attachment").click();
      });

      $('#post_attachment').change(function(){
        readURL(this, preview);
      });
     // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
      if ($(".pagination").size() > 0) {
      $(".pagination").hide();
      $("#endless-scroll").removeClass("hide");
      $(window).bindWithDelay("scroll", function () {
        var url = $("a.next_page").attr("href");
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
          $.getScript(url);
        }
      }, 150);
    }

    $('#post-content').html($('#post_content').val());

    $('.input-mentionable').atwho({at: '@', data: $('#mentionable-data').data('content'), insertTpl: '<a href="/users/${id}">${name}</a>', displayTpl: '<li data-id="${id}"><span>${name}</span></li>', limit: 15});

    $('.post_form').submit(function () {
      $('#post_content').val($('#post-content').html());
      $('#post-content').html('');
    });

  });

