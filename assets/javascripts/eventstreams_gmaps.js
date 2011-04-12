function initialize_google_map() {
	
	var positions = [];
	var marker_descriptions = [];
	
	$('.location').each(function(i,e){
		e = $(e);
		positions.push(new google.maps.LatLng(e.attr('data-lat'), e.attr('data-lng')));
		marker_descriptions.push(e.attr('data-venue_name'));		
	});
	
	if (positions.length > 0) {
	  var myOptions = {
	    zoom: 12,
	    center: positions[0],
			disableDefaultUI: true,
			 navigationControl: true,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  };

	  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	
		if (positions.length > 1) {
			var bounds = new google.maps.LatLngBounds();
			for (var index in positions) {
			    bounds.extend(positions[index]);
					new google.maps.Marker({
					      position: positions[index], 
					      map: map, 
					      title: marker_descriptions[index]
					});
			}
			map.fitBounds(bounds);
		} else {
			new google.maps.Marker({
			      position: positions[0], 
			      map: map, 
			      title: marker_descriptions[0]
			});			
		}
	}
}

$(document).ready(function(){
  if ($('.map_wrap').css('display') != 'none') {
  	initialize_google_map();
  }
});