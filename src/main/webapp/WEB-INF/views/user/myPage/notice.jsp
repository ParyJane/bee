<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fourmeeting.bee.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좋아요 누른 목록 | bee</title>
</head>
<body>


	<%@ include file="/common/cdnLib.jsp"%>
	
	<!-- 반응형 웹에 필요한 소스 -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- 폰트어썸 CDN -->	
	<!-- reference your copy Font Awesome here (from our CDN or by hosting yourself) -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	
	<style>
		
		
		body{
			font-family: 'Noto Sans KR', sans-serif;
			background-color: #f9f9f9;
		}
		
		.container{
			width: 100%;
			height: 100%;
		}
		
		/* 내 정보 네비바 */
		.mypage_navi_div{
			padding: 0;
		}
		
		#mypage_navi_ul{
			width: 75%;
			height: 300px;
			list-style-type: none;
			margin: 20px auto;
			padding: 0px;
		}
		
		#mypage_navi_ul a{
 			text-decoration: none;
			color : #50401B;
			display: block; /*a태그를 li영역 전체로 잡기 위함*/
			position: relative;
		}
		
		#mypage_navi_ul li{
		 	border: 1px solid #ededed;
		 	padding: 10px;
		 	background-color: white;
		}
		
		#mypage_navi_ul li i{
			color : #50401B;
			position: absolute;
			left: 95%;
			top: 20%;
		}
		
		
		/* 내가 쓴 글 피드 */
		.myhistroy_div{
			width: 100%;
			height: auto;
			margin: 20px auto;
		}
		
		.myhistroy_table {
			width: 100%;
			color : #50401B;
			border: 1px solid #ededed;
			background-color: white;
		}
		
		.myhistroy_board_table {
			margin: 10px auto;
		}
		
		.myhistroy_table tr th{
			padding: 10px 20px;
			background-color: #dedede;
		}
		
		input[id*="notice"]{
			display: none;
			/*클릭박스 숨기기*/
		}
		
		input[id*="notice"] + label{
			display: block;
			padding: 12px 20px;
			border: 1px solid #ededed;
			color : #50401B;
			background-color: white;
			/* font-weight: 600; */
			cursor: pointer;
			position: relative;
			margin: 0;
		}
		
		input[id*="notice"] + label i{
			position: absolute;
			top: 35%;
			right: 5%;
			transform: rotate(180deg);
			transition: all .35s;
		}
		
		input[id*="notice"] + label + div{
			max-height: 0;
			transition: all .35s;
			overflow: hidden;
			background-color: white;
		}
		
		input[id*="notice"] + label + div p{
			display: inline-block;
			padding: 30px 20px;
			font-size: 0.9rem; 
		}
		
		input[id*="notice"]:checked + label {
			background-color: #fff3d8;
		}
		
		input[id*="notice"]:checked + label + div{
			max-height: 500px;		
		}
		
		input[id*="notice"]:checked + label i{
			transform: rotate(0deg);
			transition: all .35s;
		}

		

		
	</style>
	
	
	<%
		ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	%>
	
	
	
	<script>
	
		$(function(){
			
			//사이드 네비 초기값
			$(".navi_li").eq(5).css('background','#F7D078').css('font-weight','700');
			
			//footer위치조절
			var higth = $("body").height();
			if(higth<754){
				$("#footer").css('position','absolute').css('bottom','0');
			}
			
		});
	
	</script>
	
	
	<%@include file="/include/headerUser.jsp" %>
		
		<div class="container pt-3">
			<div class="row">
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
				<!-- mypage 사이드 네비 -->				
				<div class="col-3 p-0 mypage_navi_div">
					<ul id="mypage_navi_ul">
						<li class="navi_li"><a href="/myPageInfo.do" id="myInfo">내 정보<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href="/myPageBoard.do" id="myHistory">내가 쓴 글<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageHeart.do' id="myHeart">좋아요 누른 목록<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageBeesJoinQnas.do' id="myApprove">비즈 가입 확인<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageQnaHistory.do' id="myQuestion">문의사항<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageNotice.do' id="myNotice">공지사항<i class="fas fa-angle-right"></i></a></li>
					</ul>
				</div>
				<!-- mypage 사이드 네비 -->
				
				<!-- mypage 피드(내가 쓴 글_게시글) -->
				<div class="col-7 p-0 myhistroy_div">
					<table class="myhistroy_table">
						<tr>
							<th>공지사항</th>
						</tr>
					</table>
						
					<div class="notice_div">
						
						<%if(!list.isEmpty()){ %>
						    <%int i=1;%>
						 	<% for(Notice n : list){%>
							<input type="checkbox" id="notice<%=i%>">
							<label for="notice<%=i%>">
								<b><%=n.getNoticeTitle() %></b><i class="fas fa-angle-up"></i><br>
								<%
									String pattern = "yyyy년 MM월 dd일 a KK:mm";
									SimpleDateFormat sdFormat = new SimpleDateFormat(pattern);
								%>
								<%=sdFormat.format(n.getNoticeDate())%>
								<!-- 2021년 1월 25일 오전 2:00 -->
							</label>
							<div>
								<p><%=n.getNoticeCont() %></p>
							</div>
							<% i++; }%>
						<%} %>
						
					</div>
					
					
				</div>
				<!-- mypage 피드(내가 쓴 글) -->
				
				<!-- 여백 -->
				<div class="col-1"></div>
			</div>
		</div>

	<div><%@include file="/common/footer.jsp" %><div>

</body>
</html>