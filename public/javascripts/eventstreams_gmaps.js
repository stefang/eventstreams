function initialize() {
	
	var positions = [];
	var marker_descriptions = [];
	
	
	$('.location').each(function(i,e){
		e = $(e);
		positions.push(new google.maps.LatLng(e.attr('data-lat'), e.attr('data-lng')));
		marker_descriptions.push(e.attr('data-venue_name'));		
	})
	
  var myOptions = {
    zoom: 8,
    center: positions[0],
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

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
}

$(document).ready(function(){
	initialize();
});