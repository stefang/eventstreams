$(document).ready(function(){
	$('#ajax_status').hide();
	$("#sortable").sortable({ 
		axis: 'y',
		stop: function(event, ui) { 
			update_list_order(
				$("#sortable").attr('data-user_id'),
				$("#sortable").attr('data-event_id'),
				$("#sortable").attr('data-model'),
				$("#sortable").sortable('serialize')
			); 
		} 
	});
	$("#sortable").disableSelection();
	
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
	$("input.datepicker").datepicker({dateFormat: "yy-mm-dd"});
	
});

var update_list_order = function(user_id, event_id, model, serialize) {
	$('#ajax_status').show().empty().append("Saving new order");
	$.post("/users/"+user_id+"/events/"+event_id+"/"+model+"/update_order", {item_order: serialize}, function(data){
	   $('#ajax_status').empty().append(data);
	 });
};