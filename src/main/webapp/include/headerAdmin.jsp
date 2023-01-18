<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="resources/css/headerAdmin.css"> 
<style>
.menu-sub{     
	z-index : 9;
	background-color: #FEE6B1;
	box-shadow:0.2em 0.2em 5px lightgray;
	top:20px;    
	position:absolute;
	right:0;
	white-space:nowrap;
	transform:translate(7%, 1.3em);
	display:none;
	transition: all .8s;
	width: 170px;
	border: 1px solid lightgray;
}


.menu-sub:after{
	content:' ';
	position:absolute;
	top:-20px;
	left:85%;
	transform:translateX(-50%);
	height:0;
	width:0;
	border-width:10px;
	border-style:solid;
	border-color:transparent transparent #FEE6B1 transparent;
}

</style>
<%
Member member3=(Member)session.getAttribute("member");

%>

	<div class="container-fluid p-0">
	<div class="container">
		<div class="row header" >
	   		<div class="col-1 p-0 .d-sm-none"></div>
	   
	       	<div class="col-10 inner p-0">
	       		<div class="row h-100 w-100 p-0" >
	           		<div class="col-2 col-md-2 p-0 d-xs-none">
	           			<span class="beeLogo" style="margin-left:20px;">
	            		<a href="/memberManagement.do" >
		       			<img src="resources/image/beeLogo.png" alt="로고이미지" />	
	 	  				</a>
	            		</span>
	           
	            	</div>
	         		<div class="col-md-8 p-0">
		         		<ul class="admin_menu">
		         			<li><a href="/memberManagement.do">회원관리</a></li>
							<li><a href="/beesManagement.do">모임관리</a></li>
							<li><a href="/adminNoticeBoard.do">공지사항</a></li>
							<li><a href="/adminQuestion.do">문의사항</a></li>
		         		</ul>
	         		</div>
	            	<div class="col-2 col-md-2 p-0" >
			            <ul class="top_right-menu">
			            	<li class="menu-item">
			            		<button type="button" class="top_right_btn" id="set_btn" >
			            		
			            		
			            			<% if(member3.getProfileImg() == null){ %>
			            		<img src="/resources/image/admin/profile.png" style="border-radius:30px;">
			            			
			            			
			            			<%}else{ %>
			            			<img src="/resources/image/profile/<%=member3.getProfileImg() %>" style="border-radius:30px;">
			            			
			            			<%} %>
			            		</button>

									<ul class="menu-sub">
										<li><a href="/memberManagement.do">회원관리</a></li>
										<li><a href="/beesManagement.do">모임관리</a></li>
										<li><a href="/adminNoticeBoard.do">공지사항</a></li>
										<li><a href="/adminQuestion.do">문의사항</a></li>
										<li><a href="/memberLogout.do">로그아웃</a></li>
									</ul>
									
								</li>
			            </ul>
	            	</div>  <!-- col-2 col-md-2 p-0 -->
	             </div> <!-- row h-100 w-100 p-0 -->
	          </div>  <!-- inner -->
	          <div class="col-1 p-0 .d-sm-none"></div>
		</div> <!-- row header -->
	</div> <!-- container -->
</div> <!-- container-fluid" -->













</body>
</html>