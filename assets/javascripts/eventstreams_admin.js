$(document).ready(function(){
	$('#ajax_status').hide();
	
	$("#sortable").sortable({ 
		axis: 'y',
		update: function(event, ui) { 
			update_list_order(
				$("#sortable").attr('data-user_id'),
				$("#sortable").attr('data-event_id'),
				$("#sortable").attr('data-model'),
				$("#sortable").sortable('serialize')
			); 
		} 
	});
	$("#sortable").disableSelection();
	
	// Target Source
	
	$("#sortable_source").sortable({
	  axis: 'y',
	  connectWith: '.connected'
	});
	
	$("#sortable_target").sortable({
	  axis: 'y',
	  connectWith: '.connected',
		update: function(event, ui) { 
			update_list_order(
				$("#sortable_target").attr('data-user_id'),
				$("#sortable_target").attr('data-event_id'),
				$("#sortable_target").attr('data-model'),
				$("#sortable_target").sortable('serialize')
			); 
		} 
	});
	
	$("#sortable_source, #sortable_target").disableSelection();
	
	$('textarea').markedit({'toolbar': { 'layout': 'bold italic quote | link numberlist bulletlist heading'}});
	
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
     stay: stayType,
     type: flashType
    });
  }
	$("input.datepicker").datepicker({dateFormat: "dd-mm-yy"});
	$("#ui-datepicker-div").hide()
	
	if ($('#picker').length > 0) {
    var f = $.farbtastic('#picker');
    var p = $('#picker').css('opacity', 0);
    var selected;
    $('.colorwell')
      .each(function () { f.linkTo(this); $(this).css('opacity', 0.75); })
      .focus(function() {
        if (selected) {
          $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
        }
        f.linkTo(this);
        p.css('opacity', 1);
        $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      })
  		.blur(function(){
        p.css('opacity', 0);
  		});    
	  
	}

});

var update_list_order = function(user_id, event_id, model, serialize) {
  console.log(serialize);
	$('#ajax_status').show().empty().append("Saving new order");
  $.post("/users/"+user_id+"/events/"+event_id+"/"+model+"/update_order", {item_order: serialize}, function(data){
     $('#ajax_status').empty().append(data);
  });
};