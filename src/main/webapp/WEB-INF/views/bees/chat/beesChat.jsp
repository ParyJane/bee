<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/cdnLib.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
var webSocket = {
		init: function(param){
			this._url = param.url;
			this._initSocket();
		},
		sendChat: function(){
			var chatTime = new Date();
			var message = $('#input-message').val();
			this._sendMessage('${param.beesNo}', '${param.userName}', 'CMD_MSG_SEND',message);
			$('#input-message').val('');
			var chatMessage = '<p class="my-chat"><span class="chat-time">'
				+ chatTime.toLocaleTimeString()
				+ '</span><span class="chat-message">'
				+ message + '</span></p>';
			$('#my-chat-cont').append(chatMessage);
			$("#my-chat-cont").scrollTop($("#my-chat-cont")[0].scrollHeight);
			
			
		},
		sendEnter: function(){
			var message = $('#input-message').val();
			this._sendMessage('${param.beesNo}', '${param.userName}', 'CMD_ENTER', message );
			$('#input-message').val('');
		},
		receiveMessage: function(msgData){
			if(msgData.cmd=='CMD_MSG_SEND'){
				var chatTime = new Date();
				var chatMessage = '<p class="other-chat">'+'<span class="chat-message">'
				+msgData.msg+'</span> <span class="chat-time">'+chatTime.toLocaleTimeString()+'</span></p>';
				$('#my-chat-cont').append(chatMessage);
				$("#my-chat-cont").scrollTop($("#my-chat-cont")[0].scrollHeight);
			}
			else if(msgData.cmd=='CMD_ENTER'){
				$('#my-chat-cont').append('<p id="my-chat-info">'+msgData.msg+'</p>');
			}
			else if(msgData.cmd=='CMD_EXIT'){
				$('#my-chat-cont').append('<p id="my-chat-info">'+msgData.msg+'</p>');
			}
			
		},
		closeMessage: function(str){
				$('#my-chat-cont').append('<p id="my-chat-info">'+str+'</p>');
		},
		disconnect: function(){
			this._socket.close();
		},
		_initSocket: function(){
			this._socket=new SockJS(this._url);
			this._socket.onopen = function(evt){
				webSocket.sendEnter();
			};
			this._socket.onmessage = function(evt){
				webSocket.receiveMessage(JSON.parse(evt.data));
			};
			this._socket.onclose = function(evt){
				webSocket.closeMessage(JSON.parse(evt.data));
			};
		},
		_sendMessage:function(beesNo, userName, cmd, msg){
			var msgData ={
					beesNo : beesNo,
					userName: userName,
					cmd: cmd,
					msg: msg
			};
			var jsonData = JSON.stringify(msgData);
			this._socket.send(jsonData);
		}
		
};
</script>
<script type="text/javascript">
		$(document).ready(function(){
			webSocket.init({ url: '<c:url value="/echo" />' });	
		});
</script>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="/resources/css/beesChat.css">
	<div id="my-chat-wrapper" style="width: 400px; height: 550px">
		<div id="my-chat-window">
			<div id="my-chat-header">
				<span>'${requestScope.beesName}'의 전체 채팅방</span>
			</div>
			<div id="my-chat-cont">
			</div>
			<hr>
			<input id="input-message" placeholder="보낼 메시지를 입력하세요." onkeypress="if(event.keyCode==13){webSocket.sendChat();}">
		</div>
	</div>
</body>
</html>