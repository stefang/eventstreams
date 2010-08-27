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
});

var toggle_form = function(){
	$('form').toggle();
	$('#session_email').focus();
};