$(function() {
	$('.bees-function-icon').mouseover(function() {

		$(this).prev().css('visibility', 'visible');

	})

	$('.bees-function-icon').mouseout(function() {

		$(this).prev().css('visibility', 'hidden');
	})

})