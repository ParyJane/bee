<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<style>
          #input-message{
                width:100%; 
                height:20%; 
                outline: none; 
                border-top: 1px solig lightgray; 
                border:0px solid white; 
                padding:0px 20px 0px 20px;
            }
    
            #my-chat-info{
                margin: 15px 0px 15px 0px; 
                text-align: center; 
                font-size: 0.8rem; 
                color:dimgray
            }
    
            #my-chat-cont{
                width:100%; 
                height:72%; 
                overflow:scroll;
            }
    
    
            #my-chat-window{
                height:100%; 
                width:100%;
            }
    
            #my-chat-header{
                width:100%; 
                height:50px; 
                background-color:#6D6042; 
                text-align: center; 
                line-height: 50px;
    
            }
    
            #my-chat-header>span{
                color:white; 
                font-size: 1rem;
            }
    
    
            .chat-time{
    
                font-size: 0.7rem;
                padding:15px 10px 10px 10px;
                vertical-align: bottom;
            }
    
            .my-chat{
                text-align: right;
                padding: 10px 30px 10px 30px;
                height: auto;
            }
    
            .chat-message{
                padding:10px 10px 10px 10px;
                border-radius: 999px;
            }
    
            .my-chat>.chat-message{ /*내가 보낸 채팅메세지*/
                background-color: rgb(162, 218, 255);
                vertical-align: bottom;
            }
    
            .other-chat{ /*다른 사람이 보낸 채팅*/
                text-align: left;
                padding: 10px 30px 10px 30px;
            }
    
            .other-chat>.chat-message{ /*다른 사람이 보낸 채팅메세지 css*/
                background-color: rgb(255, 249, 162);
                vertical-align: bottom;
            }
    
</style>

<script> 

    $(function(){
    $('#input-message').keypress(function(e){ //엔터누르면 채팅전송됨

            
        if(e.keyCode==13){

            var chatTime = new Date();
            var message = $('#input-message').val()
            /*채팅 내용 div에 보여주기*/
            var chatMessage = '<p class="my-chat"><span class="chat-time">'+chatTime.toLocaleTimeString()+'</span><span class="chat-message">'+message+'</span></p>';
            $('#my-chat-cont').append(chatMessage);
                /*채팅 내용 소켓으로 전송*/
            $('#input-message').val("");
            $("#my-chat-cont").scrollTop($("#my-chat-cont")[0].scrollHeight);
         }    
    })

})
</script>

<div id="my-chat-wrapper" style="width:400px; height:550px">
    <div id="my-chat-window">
        <div id="my-chat-header">
            <span>비즈이름</span><span>(6)</span></div>
        <div id="my-chat-cont">
        <p id="my-chat-info">2021년 1월 12일 화요일</p>
        <p class="other-chat">
            <span class="chat-message">다른 사람이 보낸 채팅</span>
            <span class="chat-time">오전 1:42:56</span>
        </p>
        </div>
        <hr>
        <input id="input-message" placeholder="보낼 메시지를 입력하세요.">
    </div>
</body>
</html>