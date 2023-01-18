<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fourmeeting.bee.schedule.model.vo.ScheduleList" %>
<%@ page import="com.fourmeeting.bee.schedule.model.vo.ScheduleDetail" %>
<%@ page import="com.fourmeeting.bee.beesuser.model.vo.BeesUser" %>
<%@ page import="com.fourmeeting.bee.bees.model.vo.Bees" %>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Setting"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bees 일정</title>
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
</head>
<body>
	<%@ include file="/common/cdnLib.jsp"%>
	<!--비즈 전체페이지 + 사이드 프로필 + 메인 컨텐츠 크기-->
<link rel="stylesheet" type="text/css" href="/resources/css/beesForm.css">
<script type="text/javascript" src="/resources/js/beesForm.js"></script>
	
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>-->


<script>

$(function(){

//인풋태그 자동완성 X
$('input').attr('autocomplete','off');

$('.chat-open-btn').click(function(){    
window.open("chatting-page.html", '비즈 채팅', 'width=400px, height=600px, resizable=no');
return false;

});

});

</script>
<%

//비즈 공통 정보 (서브바 필요정보)
Member member = (Member)session.getAttribute("member");
Bees bees = (Bees)request.getAttribute("bees");

session.setAttribute("beesNo",bees.getBeesNo());//비즈 메인으로 접근할때마다 갱신

Setting setting = (Setting)request.getAttribute("setting");
int userCount = (int)request.getAttribute("userCount");
String beesName = bees.getBeesName();
if(bees.getBeesName().length()>=5){
beesName = bees.getBeesName().substring(0,5)+"..";
}
BeesUser user = (BeesUser)request.getAttribute("user");
String userAuth = null;
if(user!=null){
	if(user.getUserAuthYN()=='W'){
		user = null;
		userAuth = "W";
	}
}


	ArrayList<ScheduleList> list = (ArrayList<ScheduleList>)request.getAttribute("list");
	BeesUser beesUser = (BeesUser)request.getAttribute("Buser");
	
%>

<!-- background-event.html 파일 default 설정 -->
<script>

var calendar;

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
    	<%-- dateClick: function (info) {
            alert('Clicked on: ' + info.dateStr);
    	},--%>
    	headerToolbar: {
        left: 'prev',
        center: 'title',
        right: 'next todayday'
      },
      
      locale : "ko",
      <%-- 
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,--%>
      
      events: [
    	  
    	  <% for(int i=0; i<list.size(); i++){	
    		  ScheduleList scheList = (ScheduleList)list.get(i);
    		  //System.out.println("확인: " + sche.getScheduleTitle());
    	  %>
        {
          
          title: '<%= scheList.getScheduleNo() %> - <%= scheList.getScheduleTitle() %>',
          start: '<%= scheList.getScheduleStartDate() %>',
          end: '<%= scheList.getScheduleEndDate() %>',
          color: '#ff9f89'
       
        },
        
       
        
        <%}%>
     
      ]
    });

    calendar.render();
  });

</script>





<style>


#memberList-outLine{
height: 100%;
}

#calendar {
    max-width: 1100px;
    margin: 0 auto;
    background-color : white;
  }


<%-- fullclendar css --%>

.fc-daygrid-day-number{
color : black;
text-decoration : none;
font-size : 0.8rem;
}

.fc-col-header-cell-cushion {
color : #999999;
text-decoration : none;
}

.fc-toolbar-title{
color : #50401B;
font-size : 1.3rem !important;
font-weight: 400;
margin-right :50px;
}

.fc-todayday-button.fc-button.fc-button-primary{
display : none;

}

.fc-prev-button.fc-button.fc-button-primary{
border-radius : 50%;
background-color : #E4E4E4;
color : #50401B;
border : none;
padding : 2%;
margin-left : 80%;

}

.fc-next-button.fc-button.fc-button-primary{
border-radius : 50%;
background-color : #E4E4E4;
color : #50401B;
border : none;
padding : 1.8%;
margin-right : 20px;

}

.fc-header-toolbar.fc-toolbar.fc-toolbar-ltr{
margin-bottom : 2%;
margin-top : 2%;

}

<%-- 모달 --%>
.sche-modal-bg2 {
  display: none;
  position: absolute;
  width: 100%;
  height: 100%;
  scroll-behavior: auto;
  background-color: rgba(0, 0, 0, 0.2);
  top: 0;
  left: 0;
  z-index: 2;
}

#sche-detail-modal2 {
	display: none;
	position: absolute;
	background-color: white;
	width: 500px;
	height: 460px;
	box-shadow: 1px 1px 2px rgb(230, 230, 230);
	border-radius: 25px;
	z-index: 50;
	margin: auto;
	top: 15%;
}

#sche-detail-modal-header2 {
	width: 100%;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

#sche-detail-modal-close2 {
	height: 50px;
	float: right;
	margin-right: 15px;
	background-color: transparent;
	border: 0px solid white;
	line-height: 10px;
}

#sche-detail-modal-cont2 {
	width: 90%;
	height: 230px;
	margin: auto;
	text-align: left;
	color: #6d6042;
}

#sche-detail-modal-footer2 {
	width: 90%;
	height: 70px;
	text-align: center;
}

#sche-detail-writer-info2 a {
	font-size: 0.8rem;
	text-decoration: none;
	color: #6d6042;
}

#sche-detail-title2 {
	border-bottom : 1px solid lightgray;
	padding-bottom: 16px;
	padding-left: 16px;
	font-size: 1.2rem;
	font-weight: 200;
}

#sche-detail-date2 {
	padding-left: 16px;
	font-size: 0.8rem;
	font-weight: 500;
}

#sche-detail-writer-info2 {
	padding: 10px 0px 0px 10px;
}

#sche-detail-writer-profile2 {
	width: 30px;
	height: 30px;
	background-color: #ffd6e1;
	border-radius: 999px;
	float: left;
}

#sche-detail-writer-info2>span {
	margin-left: 5px;
	line-height: 30px;
	margin-right: 20px;
}

#sche-detail-note2 {
	margin-top: 20px;
	border-top: 1px solid lightgray;
	font-size: 1rem;
	padding: 20px;
}

#sche-detail-title-input2 {
margin-top : 5%;
border : 1px solid #E8E8E8;
background-color : #F9F9F9;
width : 100%;
padding : 1%;
}

#sche-detail-title-input2::placeholder{
color : #6D6042;
font-size : 0.9rem;
font-weight: 200;
}

#sche-detail-title-explanation2{
margin-top : 3%;
width : 100%;
border : 1px solid #E8E8E8;
background-color : #F9F9F9;
height : 50%;
}

#sche-detail-title-explanation2::placeholder{
color : #6D6042;
font-size : 0.9rem;
font-weight: 200;
}

#date-input2{
margin-top : 3%;
width : 100%;
text-align : center;
}

#sche-date-choice-title2 {

font-weight: 200;
font-size : 1.2rem;

}

#sche-date-choice2{

font-weight: 200;
font-size : 1.2rem;

}

#sche-date-choice2 > td{
border : 1px solid #E8E8E8;
}

#sche-date-choice2 > td > input {
color : #6D6042;
font-size : 0.8rem;
border : none;
width : 80%;
}

#shce-dateUpdate-submit2{
background-color : #50401B;
border-radius : 25px;
color : white;
border : none;
padding-left : 8%;
padding-bottom : 1%;
padding-top : 1%;
padding-right : 8%;
margin-top : 7%;
margin-left : 38%;
}

<%-- 일정 확인 모달 --%>
.sche-modal-bg {
  display: none;
  position: absolute;
  width: 100%;
  height: 100%;
  scroll-behavior: auto;
  background-color: rgba(0, 0, 0, 0.2);
  top: 0;
  left: 0;
  z-index: 2;
}

#sche-detail-modal {
	display: none;
	position: absolute;
	background-color: white;
	width: 500px;
	height: 380px;
	box-shadow: 1px 1px 2px rgb(230, 230, 230);
	border-radius: 25px;
	z-index: 50;
	margin: auto;
	top: 15%;
}

#sche-detail-modal-header {
	width: 100%;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

#sche-detail-modal-close {
	height: 50px;
	float: right;
	margin-right: 15px;
	background-color: transparent;
	border: 0px solid white;
	line-height: 10px;
}

#sche-detail-modal-cont {
	width: 90%;
	height: 230px;
	margin: auto;
	text-align: left;
	color: #6d6042;
}

#sche-detail-modal-footer {
	width: 90%;
	height: 70px;
	text-align: center;
}

#sche-detail-writer-info a {
	font-size: 0.8rem;
	text-decoration: none;
	color: #6d6042;
}

#sche-detail-title {
	padding-left: 16px;
	font-size: 1.2rem;
	font-weight: 200;
}

#sche-detail-start-date {
	padding-left: 16px;
	font-size: 0.8rem;
	font-weight: 500;
}

#sche-detail-end-date {
	
	font-size: 0.8rem;
	font-weight: 500;
}

#sche-detail-writer-info {
	padding: 10px 0px 0px 10px;
}

#sche-detail-writer-profile {
	width: 30px;
	height: 30px;
	background-color: #ffd6e1;
	border-radius: 999px;
	float: left;
}

#sche-detail-writer-info>span {
	margin-left: 5px;
	line-height: 30px;
	margin-right: 20px;
}

#sche-detail-note {
	margin-top: 20px;
	border-top: 1px solid lightgray;
	border-left : 1px solid white;
	border-right : 1px solid white;
	border-bottom : 1px solid white;
	outline-style: none;
	font-size: 1rem;
	padding: 20px;
	width : 100%;
	height : 60%;
}

.fc-daygrid-event.fc-daygrid-dot-event.fc-event.fc-event-start.fc-event-end.fc-event-future{
color : #50401B;
}

.fc-daygrid-event-dot{
border : 5px solid #F7D078;

}

#all {
height : 900px;
}

#bees-setting > a{
color: #50401B
}

#bees-public {
 padding-top : 10px;
}
.fc-event-time{
display: none;
}
.fc-event-title{
color: #50401B
}
#sche-detail-modal-footer{
display : none;
}

#scheduleModifyEnd{
background-color : #50401B;
border-radius : 25px;
color : white;
border : none;
padding-left : 8%;
padding-right : 8%;
padding-bottom : 1%;
padding-top : 1%;
margin-left : 35%;
margin-top : 3%;
}

#all{
padding-bottom : 12%;
height : 100%;
}
</style>

<link rel="stylesheet" type="text/css" href="resources/css/beesSchedule.css">
	
	<div>
		<%@include file="/include/headerBee.jsp" %>
	</div>	
	<div class="container pt-3" id="all">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3 p-0">
				
					<!-- 비즈 사이드 정보 -->
				<div id="bees-side" class="container m-0 p-2">
					<div id="bees-side-profile">
					<% 
   				 String coverPath = bees.getBeesCover();	
					String beesCover = null;
    			if(coverPath.endsWith("_bee")){
    			beesCover = "/resources/image/beeCreateProfile/"+coverPath;
    			}else{
    				beesCover = coverPath;
    				}
					 %>  
						<table>
							<tr>
							
								<td id="bees-cover" colspan="2" style="background-image:url('<%=beesCover %>')"></td>
							</tr>
							<tr>
								<td id="bees-name" colspan="2"><%=bees.getBeesName() %></td>
							</tr>
							<tr>
								<td id="bees-member-count">
									멤버<b> <%=userCount %> </b>
								</td>
								<td id="bees-invite"><!-- 권한별 설정 -->
								<%if(user!=null){%>
								<%if((setting.getSetUserInvite()).equals("user")){%>
									<a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>초대</a>
              <%}else if(((setting.getSetUserInvite()).equals("manager"))){
              	if(!(user.getUserClass().equals("user"))){%>
              <a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>초대</a>
              <%}//if
              }//elseif
              else if(((setting.getSetUserInvite()).equals("host"))){
              if((user.getUserClass().equals("host"))){%>
              <a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>초대</a>
              <%}
              }
								}//userIf%>
								</td>
							</tr>
							<tr>
								<td id="bees-note" colspan="2">
								<% 
								if(user!=null){
								if(!(user.getUserClass()).equals("user")){ %>
									<a href="/beeSettingSubIntro.do?beesNo=<%=bees.getBeesNo()%>">비즈 소개 설정 </a>
								<%} 
								}%>
								</td>
							</tr>
							<%if(bees.getBeesPublicYN() == 'N' && user==null ){%>
							<tr>
								<td id="bees-public" colspan="2">
								비즈와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.
								</td>
							</tr>
							<%}else{%>
							<tr>
								<td id="bees-cont" colspan="2">
								<%if(bees.getBeesCont()==null){%>
								<%}else{ %>
								<%=bees.getBeesCont() %>
								<%} %>
								</td>
							</tr>
							<%}
							if(user!=null){%>
							<%if(!(user.getUserClass()).equals("user")){ %>
							<tr>
								<td class="innerline" colspan="2">
									<hr>
								</td>
							</tr>
							<tr>
								<td id="bees-setting" colspan="2">
								<form id="beeSettingMove" action="/beeSettingMain.do" method="post">
                        <input type="hidden" id="beesNo" name="beesNo" value="<%=bees.getBeesNo()%>"/>                     
		                <a href="#" onclick="document.getElementById('beeSettingMove').submit();"> <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
		                <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
		                <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
		             	</svg>&nbsp;비즈설정
                           </a>
                            </form>
								</td>
							</tr>
							<!-- 비즈 메인페이지 외에는 삭제해주세요! -->
							<%} 
							}
							%>
						
						</table>
					</div>
					<%
					if(user!=null){ %>
					<div id="bees-side-chatting">
						<table>
							<tr>
								<td id="chatting-header">채팅</td>
								<td id="new-chat">
									
								<%if((setting.getSetUserInvite()).equals("user")){%>
								<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">새 채팅</a>	
              					<%}else if(((setting.getSetUserInvite()).equals("manager"))){
              					if(!(user.getUserClass().equals("user"))){%>
							<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">새 채팅</a>
             				<%}//if
              				}//elseif
              				else if(((setting.getSetUserInvite()).equals("host"))){
              				if((user.getUserClass().equals("host"))){%>
							<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">새 채팅</a>
             				 <%}
             				 }%>
							</td>	
							</tr>
							<tr>
								<td class="innerline" colspan="2">
									<hr>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="padding: 10px 5px 0 5px; line-height: 10px;">
									<div class="chat-profile" style="background-image:url('<%=beesCover %>')"></div>
									<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()" style="color: dimgray">
									'<%=beesName %>' 전체 채팅
									</a>
								</td>
								<script>
								$('.chat-open-btn').click(
										function() {
											window.open("/chat.do?beesNo=${requestScope.bees.beesNo }&userName=${requestScope.user.userName }", '비즈 채팅',
													'width=400px, height=600px, resizable=no');
											return false;});
								</script>
							</tr>
						</table>
					</div>
					<%}else{ 
					}%>
				</div>
				<!-- 여기까지 복사 붙여넣기 -->
				
				
				
				
				
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
			<div class="col-7 p-0">
				<div id="bees-contents" class="container m-0 p-2">
				
				<div id='calendar' style='position : relative;'>
		
		</div>
				
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<!-- 일정 확인 modal -->
    <div class="sche-modal-bg"></div>
    <div id="sche-detail-modal">
        <div id="sche-detail-modal-header">
            <button id="sche-detail-modal-close">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x"
                    viewBox="0 0 16 16">
                    <path
                        d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </button>
        </div>
        
         <form>
        <div id="sche-detail-modal-cont">
            <div id="sche-detail-title"></div>
            <span id="sche-detail-start-date"></span><span> - <span></span><span id="sche-detail-end-date"></span>
            <div id="sche-detail-writer-info">
            <%--style="background-image:url('/resources/image/profile/<%=bees.getBeesCover() %>')" 
            	 onerror="this.style.display='none'"--%>
                <img id="sche-detail-writer-profile" onError="this.src='/resources/image/user/profile_none.png'"/>
                <span id="sche-detail-userName"></span><a href="" id="scheduleModify">수정하기</a> <a href="" id="scheduleDelete">삭제하기</a>
               
          </div>
         <!--   <div id="sche-detail-note"> </div>-->
       
      	 <textarea id="sche-detail-note" style="resize: none;" readonly="readonly" >
           
       	 </textarea>
        <button tpye="submit" id="scheduleModifyEnd" style="display : none;">수정 완료</button>
        </div>
        <div id="sche-detail-modal-footer">
        </div>
        <div id="userNo" style="display : none;"></div>
        </form>
        
        
        
        
        <%--
        <form>
        <div id="sche-detail-modal-cont">
        
       
     	<% for(int i=0; i<1; i++){	
    		  ScheduleList scheList = (ScheduleList)list.get(i);
    	
            <div id="sche-detail-title"><%= scheList.getScheduleTitle() %></div>
            <div id="sche-detail-date"><%= scheList.getScheduleStartDate() %> - <%= scheList.getScheduleEndDate() %></div>
            <div id="sche-detail-writer-info">
                <div id="sche-detail-writer-profile"><%= scheList.getProfileImg() %></div>
                <span><%= scheList.getUserName() %></span><a href="">수정하기</a> <a href="">삭제하기</a>
                
              
          </div>
        <div id="sche-detail-note">
            <%= scheList.getScheduleCont() %>
        </div>
        
    <%} %>
        </div>
        <div id="sche-detail-modal-footer">
            
        </div>
        </form> --%>
        
       
    </div>
    
    

    
    
    
    
    <!-- 일정 삽입 modal -->
    <div class="sche-modal-bg2"></div>
    <div id="sche-detail-modal2">
        <div id="sche-detail-modal-header2">
            <button id="sche-detail-modal-close2">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x"
                    viewBox="0 0 16 16">
                    <path
                        d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </button>
        </div>
        <form>
        <div id="sche-detail-modal-cont2">
            <div id="sche-detail-title2">일정 등록하기</div>
           
            <input type="text" placeholder="일정 제목" id="sche-detail-title-input2"/>
            <textarea placeholder="일정 설명" id="sche-detail-title-explanation2"></textarea>
          
         <table id="date-input2">
         	<tr id="sche-date-choice-title2">
         		<td id="sche-date-start2">시작</td>
         		<td id="sche-date-end2">종료</td>
         	</tr>
         	<tr id="sche-date-choice2">
         		<td><input type="text"  id="sche-start-datepicker"/><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16">
  <path d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
</svg></td>
         		<td><input type="text"  id="sche-end-datepicker"/><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16">
  <path d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
</svg></td>
         	</tr>
         </table>
            <button id="shce-dateUpdate-submit2">완료</button>
        
        </div>
       		
        <div id="sche-detail-modal-footer2">
            
        </div>
        </form>
    </div>

		<script>
			$(function(){
				
				
				
				<%-- 수정하기 눌렀을 때 --%>
				$('#scheduleModify').click(function(){
					var userNo = $('#userNo').text();
					var contUserNo = <%= beesUser.getUserNo() %>
					if(userNo==contUserNo){
					$('#sche-detail-note').removeAttr("readonly");
					$('#scheduleModifyEnd').show();
					}else{
						alert("수정은 작성자만 가능합니다.");
					}
					return false
				})
				
				<%-- 수정 완료 눌렀을 때 --%>
				$('#scheduleModifyEnd').click(function(){
					var scheduleCont = $('#sche-detail-note').val();
					var scheduleNo = $('#sche-detail-modal-footer').text();
					
					
					$.ajax({
						url : "/scheduleModify.do",
						type : "post",
						data : {"scheduleCont":scheduleCont, "scheduleNo":scheduleNo},
						success : function(result){
							if (result > 0) {
								
							} else {
								alert("다시 시도해주세요");
							}
						},
						error : function(){
							alert("ajax 통신 오류");
						}
					})

				})
				
				
				
				<%-- 일정 삭제하기 눌렀을 때 --%>
				$('#scheduleDelete').click(function(){
					
					var userNo = $('#userNo').text();
					var LoginUserNo = <%= beesUser.getUserNo() %>
					var scheduleNo = $('#sche-detail-modal-footer').text();
					
					
					if(userNo!=LoginUserNo){
						alert("호스트와 작성자만 삭제할 수 있습니다.");
					}else{

					
					$.ajax({
						url: "/scheDel.do",
						type: "post",
						data:{"scheduleNo":scheduleNo},
						success: function(result){
							if(result=="true"){
								location.reload();
							}
						},
						error : function(){
							alert("ajax 통신 실패");
						}
					})
					
					}
					
					
				})
				
				
					<%-- 등록되어있는 일정 눌렀을 때 --%>
					$('.fc-daygrid-day-events').click(function(){
						var title = $(this).text();	
						var scheduleNo = title.substring(6,10);
						
					
						$.ajax({
							url : "/scheContList.do",
							dataType:"json",
							data : {"scheduleNo":scheduleNo},
							success : function(schedule){
								console.log(schedule.userName );
								
								$('#sche-detail-title').text(schedule.scheduleTitle);
								$('#sche-detail-start-date').text(schedule.transStartDate);
								$('#sche-detail-end-date').text(schedule.transEndDate);
								//var img = "background-image:url('/resources/image/profile/"+schedule.profileImg+"')";
								var img = "/resources/image/profile/"+schedule.profileImg;
								//alert(img);
								
								$('#sche-detail-writer-profile').attr("src",img);
								
								$('#sche-detail-note').text(schedule.scheduleCont);
								$('#sche-detail-userName').text(schedule.userName);
								$('#sche-detail-modal-footer').text(schedule.scheduleNo);
								$('#userNo').text(schedule.userNo);
							},
							error : function(){
								alert("ajax통신 실패애..");
							}
							
						});
						
			
						
						$('#sche-detail-modal').css(
								'top',
								Math.max(0, (($(window).height() - $(
										'#sche-detail-modal').outerHeight()) / 2)
										+ $(window).scrollTop())
										+ 'px');
						$('#sche-detail-modal').css(
								'left',
								Math.max(0, (($(window).width() - $(
										'#sche-detail-modal').outerWidth()) / 2)
										+ $(window).scrollLeft())
										+ 'px');
						$('.sche-modal-bg').css('height',
								($(window).height() + $(window).scrollTop()) + 'px');
					    
					    $('.sche-modal-bg').css('display','block');
					    $('#sche-detail-modal').css('display', 'block');
					    
					    });
					    
					
					
					
					
					    $('#sche-detail-modal-close').click(function () {
					    
					    $('#sche-detail-modal').css('display', 'none');
					    $('.sche-modal-bg').css('display','none');
					    
					    
					    });
						
					
			
				
				


					$('.fc-daygrid-day-number').click(function () {

						
					    //비즈 페이지에서 주석제거. -  자동으로 배경 높이 산정하여 Modal background 까는 설정//
					    $('#sche-detail-modal2').css(
								'top',
								Math.max(0, (($(window).height() - $(
										'#sche-detail-modal2').outerHeight())/ 2)
										+ $(window).scrollTop())
										+ 'px');
						$('#sche-detail-modal2').css(
								'left',
								Math.max(0, (($(window).width() - $(
										'#sche-detail-modal2').outerWidth()) / 2)
										+ $(window).scrollLeft())
										+ 'px');
						$('.sche-modal-bg2').css('height',
								($(window).height() + $(window).scrollTop()) + 'px');
					    
					    $('.sche-modal-bg2').css('display','block');
					    $('#sche-detail-modal2').css('display', 'block');
					    
					    });
					    
					    $('#sche-detail-modal-close2').click(function () {
					    
					    $('#sche-detail-modal2').css('display', 'none');
					    $('.sche-modal-bg2').css('display','none');
					    
					    
					    });
					
					
					
					$(function(){

  					$("#sche-start-datepicker").datepicker({
  						dateFormat : "yy.mm.dd"
  					});
  					$("#sche-end-datepicker").datepicker({
  						
  						dateFormat : "yy.mm.dd"
  						
  					});
  					
					});
					
					
					<%-- 일정 등록 기본설정 --%>
					
					<%-- 일정 등록 StartDate --%>
					$("#sche-start-datepicker").datepicker({
		                dateFormat: 'yy-mm-dd' //Input Display Format 변경
		                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		                ,changeYear: true //콤보박스에서 년 선택 가능
		                ,changeMonth: true //콤보박스에서 월 선택 가능                        
		                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
		            });                    
		            
		            //초기값을 오늘 날짜로 설정
		            var selectDate = $('.fc-daygrid-day-number').val();
		            
		            $('#sche-start-datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)   
					
		            
		            <%-- 일정 등록 StartEnd --%>
		            
		            $("#sche-end-datepicker").datepicker({
		                dateFormat: 'yy-mm-dd' //Input Display Format 변경
		                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		                ,changeYear: true //콤보박스에서 년 선택 가능
		                ,changeMonth: true //콤보박스에서 월 선택 가능                        
		                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
		            });                    
		            
		            //초기값을 오늘 날짜로 설정
		            $('#sche-end-datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)   
					
		            
		            
		            <%-- 일정 등록 ajax --%>
					
					$('#shce-dateUpdate-submit2').click(function(){
						
						var scheduleTitle = $('#sche-detail-title-input2').val();
						var scheduleCont = $('#sche-detail-title-explanation2').val();
						var scheduleStartDate = $('#sche-start-datepicker').datepicker().val()+" 00:00:00";
						var scheduleEndDate = $('#sche-end-datepicker').datepicker().val()+" 01:00:00";
						<%--var beesNo = <%= beesNo %>--%>
						
						
						$.ajax({
							url : "/scheDateInput.do",
							type : "post",
							data: {"scheduleTitle":scheduleTitle, "scheduleCont":scheduleCont, "scheduleStartDate":scheduleStartDate, "scheduleEndDate":scheduleEndDate},
							success : function(result){
								
								if(result=="true"){
									location.reload();
							}
								
							},
							error : function(){
								alert("입력정보가 올바르지 않습니다. 다시 한번 확인해주세요.");
								
							}
							
						});
						
						

					});
					
					
					
			});
			
	
	</script>
<script>
			$(function(){
				//footer위치조절
				var higth = $("body").height();
				if(higth<754){
				   $("#footer").css('position','absolute').css('bottom','0');
				}
			})
		</script>
	
	<div id="footer">
	<%@include file="/common/footer.jsp"%>
	</div>
</body>
</html>