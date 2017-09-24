//#############################################################
//  @author ChaozPenguin
//#############################################################

$(document).ready(function() {
	try {
		$('body').ripples({
			resolution: 800,
			dropRadius: 15, //pixel
			perturbance: 0.01,
			interactive: true,
			isMouseMove: true,
			isMouseDown: true,
		});
		$('main').ripples({
			resolution: 800,
			dropRadius: 15, //pixel
			perturbance: 0.01,
			interactive: true,
			isMouseMove: true,
			isMouseDown: true,
		})
	}
	catch (e) {
		$('.error').show().text(e);
	}
	
	setInterval(function() {
		var $el = $('body');
		var x = Math.random() * $el.outerWidth();
		var y = Math.random() * $el.outerHeight();
		var dropRadius = 15;
		var strength = 0.01 + Math.random() * 0.03;

		$el.ripples('drop', x, y, dropRadius, strength);
	}, 3600);
});