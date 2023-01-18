<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- fullcalendar -->
	<link href='/resources/fullcalendar/main.css' rel='stylesheet'/>
	<link href='/resources/fullcalendar/main.js'/>
    <script src='/resources/fullcalendar/main.js'></script>
    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
    </script>
<script src='/resources/fullcalendar/locales/ko.js'></script>
<script src='/resources/fullcalendar/main.js'></script>
<script src='/resources/fullcalendar/locales/es.js'></script>
<script src='/resources/fullcalendar/main.js'></script>
<script src='/resources/fullcalendar/locales-all.js'></script>


<!-- 그리드시스템 부트스트랩 cdn -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<!-- font link -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">



<title>Insert title here</title>
</head>
<body>


<style>
* {
	box-sizing: border-box;
}


#nav {
	padding-left: 35%;
	padding-right: 35%;
	padding-top : 0.5%;
	padding-bottom : 0.5%;
	
}

#nav>div {
	
	text-align: center;
	font-size : 15px;
}

#nav>div>a {
	color : black;
}

#main {
	padding-top: 20px;
	padding-bottom : 200px;
}

#bees_main_massege {
	padding-top: 20px;
	font-size: 12px;
}

<%-- 
#sub-pack-cont{
	border : 1px solid red;
}--%>

#sub-pack-cont>div>span{
	color : #50401B;
}

#sub-pack-cont>div>b{
	color : #50401B;
}

#cont-message{
	font-size : 12px;
}

#line1{
margin-top : 13px;
margin-bottom : 5px;
border-top : 1px solid #E6E6E6;
}

#line2{
padding-left : 5%;
padding-right : 5%;
border-top : 2px solid #E6E6E6;
}

#all{
background-color : #F9F9F9;
}

#profile{
width : 100%;
height : 100%;
border : 1px solid #E6E6E6;
}


#sub-pack-cont{
background-color : white;
padding : 8px;
padding-bottom : 8px;
margin : 1%;

}

#sub-pack-chat{
margin : 0px;
padding : 5%;
width : 100%;
heigth : 150%;

}

.chatImg{
width : 35px;
height : 30px;


}


#sub-pack-chat{
background-color : white;

}

.chatList{
	padding-left : 0px;
	padding-top : 20px;
	color : #50401B;
	
}

#feed{
	padding-left : 15px;
}

#feed2{
	padding-bottom : 50px;
	height : 100%;
	background-color : white;
}

#profile-outline{
	height : 150px;
}

#header{
	background-color :#F7D078;
}

#beesName{
	color : #50401B;
	font-size : 20px;
	
}

#beesName-outline{
	margin-top : 5px;
}

#btn{
background-color : white;
font-size : 15px;
padding-top : 3px;
padding-bottom : 5px;
color : #F7D078;
}

#member{
margin-top : 4px;
margin-bottom : 5px;
padding-bottom : 13px;
};


#set{
font-size : 13px;

}

#set >a {
color : #50401B;
}

#footer{
background-color : #50401B;
}

#chatAdd>a{
	color : #F7D078;
}

.chatList>a {
	color : #50401B;
	font-size : 12px;
	
}

</style>

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>

document.addEventListener('DOMContentLoaded', function(){
	 var calendarEl = document.getElementById('calendar');
	
	var calendar = new FullCalendar.Calendar(calendarEl, {
	  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	  header: {
	    left: 'prev,next today',
	    center: 'title',
	    right: 'dayGridMonth,timeGridWeek,timeGridDay'
	  },
	  editable: true,
	  droppable: true, // this allows things to be dropped onto the calendar
	  drop: function(info) {
	    // is the "remove after drop" checkbox checked?
	    if (checkbox.checked) {
	      // if so, remove the element from the "Draggable Events" list
	      info.draggedEl.parentNode.removeChild(info.draggedEl);
	    }
	  },
	  locale: 'ko'
	});
	});


 </script>




	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12" id="header">헤더</div>
		</div>
		<div class="row" id="nav">
			<div class="col-md-1" id="left-nav-margin"></div>
			<div class="col-md-2 p-0"><a href="#">전체글</a></div>
			<div class="col-md-2 p-0"><a href="#">사진첩</a></div>
			<div class="col-md-2 p-0"><a href="/beesSchedule.do">일정</a></div>
			<div class="col-md-2 p-0"><a href="#">첨부</a></div>
			<div class="col-md-2 p-0"><a href="/beesMember.do">멤버</a></div>
			<div class="col-md-1" id="right-nav-margin"></div>
		</div>
	
	

	<div class="row" id="all">
		<div class="col-md-3" id="left-margin"></div>
		<div class="col-md-6" id="main">
			<div class="row" id="main-feed">
				<div class="col-md-3 p-0" id="main-sub-pack" >
					<div class="row" id="sub-pack-cont">
						<div class="col-md-12 p-0" id="profile-outline"><img src="/resources/image/image.jpg" id="profile"/></div>
						<div class="col-md-12 p-1" id="beesName-outline"><a href="#" id="beesName">비즈이름</a></div>
						
						<div class="col-md-12 p-1" id="member"><span>멤버 </span><b>6</b>&nbsp;&nbsp;
		
						<button type="button" id="btn" class="btn btn-light">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
						  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
 							 <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg>
						&nbsp;초대</button>
						</div>
						<div class="col-md-12 p-1" id="cont-message">
						<span>비즈와 게시글이 공개되지 않습니다. <br>
						초대를 통해서만 가입할 수 있습니다.</span></div>
						<div class="col-md-12 p-0" id="line1"></div>
						<div class="col-md-12 p-1" id="set"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
  						<path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
						<path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
						</svg> 비즈설정</a></div>
					</div>
					<br>
					<div class="row" id="sub-pack-chat">
						<div class="col-md-12 p-2" id="chatAdd">채팅 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">새채팅</a></div>
						<div class="col-md-12" id="line2"></div>
						<div class="col-md-12 p-1, chatList" ><img src="/resources/image/프로필.png" class="chatImg"/><a href=""> 홍길동</a></div>
						<div class="col-md-12 p-1, chatList" ><img src="/resources/image/프로필.png" class="chatImg"/><a href=""> '비즈' 전체 채팅하기</a></div>
					</div>
					
				</div>

				<div class="col-md-9">
					<div class="row"  id="feed">
						<div class="col-md-12" id="feed2">
						
						
						<div id='calendar'></div>
	
						
						</div>
					</div>
				</div>
			</div>



		</div>
		<div class="col-md-3" id="right-margin"></div>
	</div>
	<div class="row">
		<div class="col-md-12" id="footer">풋터</div>
	</div>
	</div>



</body>
</html>