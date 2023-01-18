<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./bootstrapt/css/bootstrap.css" />
	<script src="./bootstrapt/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>


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
	font-size : 1rem;
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
}

#feed{
	margin-left : 1px;
	background-color : white;
	padding : 15px;
}

#feed2{
	
	height : 100%;
	
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
	color :  #50401B;
	font-size : 12px;
	
}

#feed-top{
	padding-bottom : 10px;
	color :  #50401B;
	font-size : 26px;
}

#feed-top >b{
	color : #F7D078;
}

#search{
width : 90%;
border : none;
}

#search-outLine{
height : 32px;
border : 1px solid #707070;
border-radius : 50px;

}

#searchBtn{
margin-top : 2px;
background-color : white;
border : none;
}

#line3{

margin-top : 15px;
margin-bottom : 15px;
border-top : 1px solid #E6E6E6;
}

#search-select{
border : none;
text-align : right;
}

#search-select > select{
border : none;
font-size : 14px;
}

.memberList{
	padding-bottom : 15px;
	width : 100%;
}

.memberList >a{
color : black;
}

.memberList >span{
color : #707070;
}

.memberListImg{
width : 45px;
height : 40px;
}

#memberInvite{
color : #50401B;
padding-left : 10px;
}



#memberInviteBtn{
padding-left : 30px;
}

.chatHover{
	width : 90px;
	height : 30px;
	margin-left : 1%;
	margin-right : 50%;
	visibility : hidden;
	cursor : pointer;
}

#myModalLabel{
font-size : 19px;
color :#6D6042;
padding-left : 43%;
font-weight:normal;
}

.modal-body >span{
font-size : 17px;
color :#6D6042;
font-weight:normal;
text-align : center;
}

#url{
width : 100%;
background-color :#F9F9F9;
border : 1px solid #E8E8E8;
font-size : 14px;
color : #6D6042;
margin-top : 5%;
margin-bottom : 5%;
}

#closeBtn{
color : #F7D078;
}

#urlCopy{
background-color : #50401B;
border-radius : 50px;
border : none;
margin-right: 41%;
}



</style>
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
		<div class="col-lg-3 col-md-0" id="left-margin"></div>
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
						<div class="col-md-12" id="line1"></div>
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
						<div class="col-md-12" id="feed-top">멤버 <b>6</b></div>
						
						<div class="col-md-12" id="search-outLine" >
						<from action="" method="post">
						<input type="text" id="search" placeholder="&nbsp;&nbsp;&nbsp;멤버검색"/><button type="submit" id="searchBtn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-zoom-in" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
  <path d="M10.344 11.742c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1 6.538 6.538 0 0 1-1.398 1.4z"/>
  <path fill-rule="evenodd" d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5z"/>
</svg></button>
						</from>
						</div>
						
						<div class="col-md-12" id="line3"></div>
						<div class="col-md-12" id="search-select"><select>
							<option>이름순</option>
							<option>가입일순</option>
						</select></div>
					
						<div class="col-md-12, memberList"><img src="/resources/image/프로필.png" class="memberListImg"/>본인 <span>user1</span><img src="/resources/image/대화하기.png" class="chatHover" data-toggle="modal" data-target="#myModal"/></div>  
						<div class="col-md-12, memberList" ><img src="/resources/image/프로필.png" class="memberListImg"/>홍길동<span>user1</span><img src="/resources/image/대화하기.png" class="chatHover" data-toggle="modal" data-target="#myModal"/></div>
						<div class="col-md-12, memberList" ><img src="/resources/image/프로필.png" class="memberListImg"/>홍길동<span>user1</span><img src="/resources/image/대화하기.png" class="chatHover" data-toggle="modal" data-target="#myModal"/></div>
						<div class="col-md-12, memberList" ><img src="/resources/image/프로필.png" class="memberListImg"/>홍길동<span>user1</span><img src="/resources/image/대화하기.png" class="chatHover" data-toggle="modal" data-target="#myModal"/></div>
						<div class="col-md-12, memberList" ><img src="/resources/image/프로필.png" class="memberListImg"/>홍길동<span>user1</span><img src="/resources/image/대화하기.png" class="chatHover" data-toggle="modal" data-target="#myModal"/></div>
						<div class="col-md-12" id="line3"></div>
						<div class="col-md-12" id="memberInviteBtn"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg><a href="/inviteMember.do" id="memberInvite">멤버 초대하기</a></div>
					</div>
				</div>
			</div>



<!-- modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">  
      <h4 class="modal-title" id="myModalLabel">멤버 선택</h4><br>
        <button type="button" id="closeBtn" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
      <form>
      	<input type="text" id="nameSreach" /><button type="submit">검색</button>
      </form>
     	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="urlCopy">초대(1)</button>
      </div>
    </div>
  </div>
</div>

	
<script>


	

	$(function(){
		
		$('.memberList').hover(function(){
			$(this).children('.chatHover').css('visibility', 'visible');},
			function(){
			$(this).children('.chatHover').css('visibility', 'hidden');

			});
		
		
		$('.chatHover').click(function(){
			$("#myModal").modal();
		});
		
		
	});
	
	
</script>


		</div>
		<div class="col-lg-3 col-md-0" id="right-margin"></div>
	</div>
	<div class="row">
		<div class="col-md-12" id="footer">풋터</div>
	</div>
	</div>



</body>
</html>