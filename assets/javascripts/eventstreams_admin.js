$(document).ready(function(){
	$('#ajax_status').hide();
	
	$("#sortable").sortable({ 
		axis: 'y',
		update: function(event, ui) { 
			update_list_order(
				$("#sortable").attr('data-user_id'),
				$("#sortable").attr('data-event_id'),
				$("#sortable").attr('data-model'),
				$("#sortable").attr('data-location'),
				$("#sortable").sortable('serialize')
			); 
		} 
	});
	$("#sortable").disableSelection();
	
	// Target Source
	
	$("#sortable_source").sortable({
	  axis: 'y',
	  connectWith: '.connected',
	  start: function(){
	    $(".sortable_target").prepend("<li class='target'>Drop menu item here to activate</li>").addClass('activeTarget');
	  },
	  beforeStop: function() {
	    $(".sortable_target").removeClass('activeTarget');
	    $(".sortable_target .target").remove();
	  }
	});
	
	$(".sortable_target").sortable({
	  axis: 'y',
	  connectWith: '.connected',
	  start: function(){
	    $("#sortable_source").prepend("<li class='target'>Drop menu item here to disable</li>").addClass('activeTarget');
	  },
	  beforeStop: function() {
	    $("#sortable_source").removeClass('activeTarget');
	    $("#sortable_source .target").remove();
    },
		update: function(event, ui) { 
			update_list_order(
				$(this).attr('data-user_id'),
				$(this).attr('data-event_id'),
				$(this).attr('data-model'),
				$(this).attr('data-location'),
				$(this).sortable('serialize')
			); 
		} 
	});
	
	$("#sortable_source, #sortable_target").disableSelection();
	
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
	$("#ui-datepicker-div").hide();
	
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

var update_list_order = function(user_id, event_id, model, location, serialize) {
	$('#ajax_status').show().empty().append("Saving new order");
  $.post("/users/"+user_id+"/events/"+event_id+"/"+model+"/update_order", {menu_location: location, item_order: serialize}, function(data){
     $('#ajax_status').empty().append(data);
     
     if ($('#sortable_target li').length > 0) {
       $('p.empty_menu').hide();
     } else {
       $('p.empty_menu').show();
     }
  });
};