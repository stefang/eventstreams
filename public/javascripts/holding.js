$(document).ready(function(){
	$('form').hide();
	$('#signin').click(function(){
		toggle_form();
		return false;
	});
  $("html").unbind().keydown(function (e) {
    if (e.which === 27) {
			toggle_form();
			return false;
    }
  });

  $('#flash').hide();
  if ($('#flash').length > 0) {
    flashType = $('#flash div').attr('id');
    if (flashType == 'error') {
      stayType = true;
    } else {
      stayType = false;
    }
    $.noticeAdd({
     text: $('#flash div.inner div').text(),
     stay:stayType,
     type: flashType
    });
  }

});

var toggle_form = function(){
	$('form').toggle();
	$('#session_email').focus();
};