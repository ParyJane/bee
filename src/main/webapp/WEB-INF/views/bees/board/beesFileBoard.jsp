<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/include/headerBee.jsp"  %>
    <%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@page import="com.fourmeeting.bee.notice.model.vo.Notice"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.BeesUser"%>
<%@page import="com.fourmeeting.bee.admin.model.vo.Search" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Setting"%>
<%@page import="com.fourmeeting.bee.schedule.model.vo.Schedule"%>
<%@page import="com.fourmeeting.bee.image.model.vo.Image"%>
<%@page import="com.fourmeeting.bee.file.model.vo.BeesFile"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.fourmeeting.bee.vote.model.vo.FeedVote"%>
<%@page import="com.fourmeeting.bee.comment.model.vo.FeedComment"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fourmeeting.bee.vote.model.vo.Vote"%>
<%@page import="com.fourmeeting.bee.board.model.vo.Feed"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

* { 
	color: #50401B; 
	text-decoration: none; 
	list-style: none; 
	box-sizing: border-box; 
	} 
	.head{
	font-size:1.3rem;
	padding-top:15px;
	padding-bottom:15px;
	display:block;
	padding-left:30px;
	height:60px;
	}

	.main_head{ 
	width:90%;
	position: absolute;
	font-size: 1.0rem; 

	cursor: pointer; 
	
	margin-left:30px;
	margin-right:30px;
	display:inline-block;
	} 
.contain {
  width: 500px;
  height: 1000px;
  margin: 20px auto;
  display:inline-block;
}
.tab_title{
height:50px;
width:100%;
}
.tab_title div {
 
  float: left;
  width: 100px;
  padding: 10px 15px;
  cursor: pointer;
  text-align: center;
  border-bottom: 1px solid #bebebe;
  height:100%;
 
}

.tab_title div.on {
text-decoration:underline;
  color:#F7D078;
  font-weight: bold;
  
}

.tab_cont {
  clear: both;
 
  height: 600px;

  margin-bottom:15px; 
  margin-top: 150px;
}

.tab_cont div {
  display: none;
  padding-left: 20px;
  padding-top: 30px;
}

.tab_cont div.on {
  display: block;
  
}
.tab_foot{
height:50px;

 border-top: 1px solid #bebebe;
 margin:0 30px;
}
.cont_searchBox{
position:absolute;

width:100%;
height:40px;
padding: 0 13px 0 13px;
bottom:15px;

margin-right:30px;
border:1px solid gray;
border-radius:30px;

}
.cont_searchBox form{
height:100%;
}
#search{
border:none;
width:90%;
height:100%;

padding:3px;
padding-left:20px;
}
#search:focus{
outline:none;
}
#search_btn{
width:5%;
height:20px;
border:none;
background-color:white;

}
.cont{
width:100%;
height:100%;

}
#fileCont li{
display:inline-block;
width:100%;
padding-left:5px;
}
#fileCont img{
width:30px;
height:30px;
}

#voteCont li{
display:inline-block;
width:100%;
padding-left:5px;

}

#voteCont img{
width:30px;
height:30px;
}



</style>

</head>
<body>



<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
		
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
	<!-- 폰트어썸 CDN -->	
	<!-- reference your copy Font Awesome here (from our CDN or by hosting yourself) -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/resources/css/adminNoticeBoard.css">


<%@ include file="/common/cdnLib.jsp"%> 
	<!--비즈 전체페이지 + 사이드 프로필 + 메인 컨텐츠 크기-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesForm.css">
	<script type="text/javascript" src="/resources/js/beesForm.js"></script>
   <!--  <link rel="stylesheet" type="text/css" href="/resources/css/beesFileBoard.css"> -->
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

ArrayList<Search> list=(ArrayList<Search>)request.getAttribute("search");
Vote v = (Vote)request.getAttribute("vote");
%>
  
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

<div id="main_content" style="background-color: white; width:100%; min-height:600px;">

<!-- 내 코드 -->

 	<%if(member !=null){ %>
		<div class="head" >첨부 모아보기</div>
	
		<div class="main_head" style="height:135px"> 
			  <div class="tab_title">
			    <div class="on" style="width:50%;" id="fileClick">파일</div>
			    <div style="width:50%;" id="voteClick">투표</div>
			  </div>
			   <div class="cont_searchBox">
			            <form action="/searchInfo.do" method="get">  
			            <input type="hidden" name="beesNo" value="${param.beesNo }">
			                      <input type="text" id="search" name="keyword" autocomplete="off">
			                      <button type="submit" id="search_btn" style="margin-top:0px;">
			                      <img src="/resources/image/search.png" style="width:20px; height:20px"/>
			                      </button>
			            </form>
			   </div>
        </div>
		<div class="tab_cont" >
		    <div class="on" >
		      <ul id="fileCont">

			  </ul>
		    </div>
		    <div >
		      <ul id="voteCont">
		
			  </ul>
		    </div>
  		</div>
		<div class="tab_foot" >
		</div>


</div><!-- main_content" -->
</div><!-- bees-contents -->
</div><!-- <div class="col-7 p-0"> -->
</div><!-- row"> -->

</div><!-- container pt-3 -->

<%}else{ %>     div 밑에 자식이 0번쨰1번째?인거용
<script>location.href ="/index.jsp";</script>
<%} %>
      <script>
      $(document).ready(function() {
    	  
    	  
        	  $(".tab_title div").click(function() {
        	    var idx = $(this).index();
        	    $(".tab_title div").removeClass("on");
        	   
        	    console.log(idx);
        	    
        	  
        	    if(idx ==0){
		        	    $(".tab_title div").eq(0).addClass("on");
		        	    $(".tab_cont > div").hide();
		        	    $(".tab_cont > div").eq(0).show();
		        	    
		        	   // $('#fileClick').click(function(){
		        	 
		          		  var beesNo = ${param.beesNo };
		                	
		                
		      			
		      					$.ajax({
		            				url:"/fileList.do",
		            				type:"post",
		            				data : {"beesNo":beesNo},
		            				async : false,
		            				dataType: "json",
		            				success:function(data){
		            					console.log("성공");
		            					
		            					 var str="";
		            					 $("#fileCont").html(str);
		            					 console.log(data);
		            					$.each(data, function(index, n) {
		            						$("#fileCont").append("<li><img src='/resources/image/bees/icon/file-icon.jpg'>"+n.originalFileName+"</li>");
		            						
		            						/*console.log(n.originalFileName);
		            						console.log(index);
		            						str += "<li>";
		            						str += "<img src='/resources/image/bees/icon/file-icon.jpg'>" +n.originalFileName+
		            						str + "</li>"
		            						console.log(str);
		            						*/
		            					});
		            					
		            					//$("#fileCont").html(str);
		            				},
		            				error:function(data){
		            					console.log("error");
		            				}
		              			}); 	
		        	
		        	  //});
            	 
          	  
        	    }else if(idx == 1){
        	    	$(".tab_title div").eq(1).addClass("on");
            	    $(".tab_cont > div").hide();
            	    $(".tab_cont > div").eq(1).show();
            	    
        	    	  //$("#voteClick").click(function(){
        	      		  var beesNo = ${param.beesNo };
        	      		 
        	      		  $.ajax({
        	    				url:"/voteList.do",
        	    				type:"POST",
        	    				data : {"beesNo":beesNo},
        	      				dataType: "json",
        	    				success:function(data){
        	    					console.log(data);
        	    					 var str="";
        	    					 var obj="";
        	       					$.each(data, function(idx, n) {
        	       						console.log(n);
        	       						console.log(n.voteEndYN);
        	       						if(n.voteEndYN == 'Y'){
        	       							n.voteEndYN = "종료";
        	       						}else if(n.voteEndYN == 'N'){
        	       							n.voteEndYN = "진행중";
        	       						}
        	       						
        	       						str += "<li>";
        	       						str += "<img src='/resources/image/bees/icon/vote-icon.jpg'>" + n.voteTitle + "<br><small>" +   n.voteEndYN +"</small>"
        	       						
        	       						str + "</li>"
        	       					});
        	       					$("#voteCont").html(str);
        	       				},
        	       				error:function(data){
        	       					console.log("error");
        	       				}
        	         			}); 	//ajax
        	    	 // });  //voteClick
        	    	  
        	    }  //idx=1
        	    
        	  });
        	
     
    	
    	  
    	  
    	  
    	  
  	  });
      
    	
     </script>
     <jsp:include page="/common/footer.jsp" flush="true"/>
</body>
</html>

