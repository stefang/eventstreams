/* Inspired by (and partially nicked from) the far superior #grid (http://hashgrid.com/) but simpler for a simple person - me. Look in reset.css for the styleee */

$(document).ready(function(){

	$('body').append('<div id="grid"><div class="inner"></div></div>').css({
		position: 'relative'
	});

	$('#grid').hide().css({
		margin: '0',
		padding: '0',	
		width: '100%',
		height: '100%',
		position: 'absolute',
		top: '0',
		zIndex: '1000'
	});

	$('#grid .inner').css({
		width: '740px',
		margin: '0 auto',
		padding: '0',
		background: 'url(/javascripts/minigrid/bg-grid-980.png)',
		height: '100%'
	});
	
	$(document).bind('keydown', function(e){
		var source = e.target.tagName.toLowerCase();
		if ((source == 'input') || (source == 'textarea') || (source == 'select')) return true;
		var k = getKey(e);
		switch(k) {
			case "g":
				$('#grid').show();
				break;
			case "f":
				$('#grid').css('z-index', 1000);
				break;
		};
	});
	
	$(document).bind('keyup', function(e){
		var source = e.target.tagName.toLowerCase();
		if ((source == 'input') || (source == 'textarea') || (source == 'select')) return true;
		var k = getKey(e);
		switch(k) {
			case "g":
				$('#grid').hide();
				break;
			case "f":
				$('#grid').css('z-index', 1000);
				break;
		};
	});

});

function getKey(e) {
		var k = false, c = (e.keyCode ? e.keyCode : e.which);
		// Handle keywords
		if (c == 13) k = 'enter';
		// Handle letters
		else k = String.fromCharCode(c).toLowerCase();
		return k;
}