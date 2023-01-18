$(function() {
	$('#input-message')
			.keypress(
					function(e) { //엔터누르면 채팅전송됨

						if (e.keyCode == 13) {

							var chatTime = new Date();
							var message = $('#input-message').val()
							var chatMessage = '<p class="my-chat"><span class="chat-time">'
									+ chatTime.toLocaleTimeString()
									+ '</span><span class="chat-message">'
									+ message + '</span></p>';
							$('#my-chat-cont').append(chatMessage);
							/*채팅 내용 소켓으로 전송*/
							$('#input-message').val("");
							$("#my-chat-cont").scrollTop(
									$("#my-chat-cont")[0].scrollHeight);

						}

					})

})