$(document).ready(function(){
	$('#ajax_status').hide();
	$("#sortable").sortable({ 
		axis: 'y',
		stop: function(event, ui) { 
			update_event_page_list(
				$("#sortable").attr('data-user_id'),
				$("#sortable").attr('data-event_id'),
				$("#sortable").sortable('serialize')
			); 
		} 
	});
	$("#sortable").disableSelection();
});

var update_event_page_list = function(user_id, event_id, serialize) {
	$('#ajax_status').show().empty().append("Saving page order");
	$.post("/users/"+user_id+"/events/"+event_id+"/event_pages/update_order", {page_order: serialize}, function(data){
	   $('#ajax_status').empty().append(data);
	 });
};