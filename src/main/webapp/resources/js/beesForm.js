$(function() {

	$('#join-btn').click(function(){
		$('#join-modal').css('top', Math.max(0,(($(window).height()-$('#join-modal').outerHeight())/2) + $(window).scrollTop())+'px'); 
		$('#join-modal').css('left', Math.max(0,(($(window).width()-$('#join-modal').outerWidth())/2) + $(window).scrollLeft())+'px');
		$('#join-modal-bg').css('height', ($(window).height() + $(window).scrollTop())+'px'); 
		$('#join-modal-bg').css('display', 'block');
		$('#join-modal').css('display', 'block');
		$('body').css('overflow','hidden');
		
	});
	

	$('#join-modal-close').click(function () {

	$('#join-modal-bg').css('display', 'none');
	$('#join-modal').css('display', 'none');
	$('body').css('overflow','auto');


	})

});