<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.MyBeesUser"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입신청 중인 비즈 | bee</title>
</head>
<body>
	
	<%@ include file="/common/cdnLib.jsp"%>
	
	<!-- 반응형 웹에 필요한 소스 -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- 폰트어썸 CDN -->	
	<!-- reference your copy Font Awesome here (from our CDN or by hosting yourself) -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="/resources/css/beesJoinQnas.css">	
	
	
	<%
		Member m = (Member)session.getAttribute("member");
		ArrayList<MyBeesUser> aList = (ArrayList<MyBeesUser>)request.getAttribute("askList");
		ArrayList<MyBeesUser> hList = (ArrayList<MyBeesUser>)request.getAttribute("askHistroyList");
		/* String sbA = (String)request.getAttribute("sbA"); */
		String sbH = (String)request.getAttribute("sbH");
	%>
	
	
	<script type="text/javascript" src="/resources/js/beesJoinQnas.js"></script>

	
		
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
					<!-- 테이블 메뉴 -->
					<table class="myhistroy_table">
						<tr>
							<th colspan="2">비즈 가입 확인</th>
						</tr>
					</table>
					
					<!-- 가입 신청중인 비즈 테이블 -->
					<div class="myhistroy_joinQnas_div">
						<div class="joinQnas_title">가입 신청중인 비즈</div>
						<table class="myhistroy_joinQnas_table">
							<tr>
								<th>모임명</th>
								<th>모임장</th>
								<th>신청일</th>
								<th>가입 신청</th>
							</tr>
							<%if(!aList.isEmpty()){ %>
								<%for(MyBeesUser mbu : aList){ %>
									<tr>
										<td><%=mbu.getBeesName() %></td>
										<td><%=mbu.getHostName() %></td>
										<td>
											<%SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy.MM.dd"); %>
											<%=sdFormat.format(mbu.getUserAskDate()) %>
										</td>
										<td>
											<input type="button" class="bees_joinQnas_btn" value="취소">
											<input type="hidden" class="userNo" value="<%=mbu.getUserNo()%>">
										</td>
									</tr>
								<%} %>
							<%}else{ %>
								<tr>
									<td colspan="4" style="text-align:center; color:gray;">가입을 신청한 비즈가 없습니다</td>
								</tr>
							<%} %>
						</table>
						
						
						<%-- <!-- 페이지 넘버 -->
						<%if(!aList.isEmpty()){ %>
							<div class="pageNavi"><%=sbA %></div>
						<%}%> --%>
					</div>
					
					<!-- 비즈 가입 신청 내역 -->
					<div class="myhistroy_joinQnas_div joinQnas_history_div">
						<div class="joinQnas_title">가입 신청 내역</div>
						<table class="myhistroy_joinQnas_table joinQnas_histroy_table">
							<tr>
								<th>모임명</th>
								<th>모임장</th>
								<th>수락일</th>
								<th>현황</th>
							</tr>
							<%if(!hList.isEmpty()){ %>
								<%for(MyBeesUser mbu : hList){ %>
									<tr>
										<td><%=mbu.getBeesName() %></td>
										<td><%=mbu.getHostName() %></td>
										<td>
											<%SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy.MM.dd"); %>
											<%if(mbu.getUserAuthDate()!=null) {%>
												<%=sdFormat.format(mbu.getUserAuthDate()) %>
											<%}else{ %>
												-
											<%} %>
										</td>
										<%if(mbu.getUserAuthYN()=='W'){ %>
											<td class="S">대기</td>
										<%}else if(mbu.getUserAuthYN()=='Y'){ %>
											<td>승인</td>
										<%}else if(mbu.getUserAuthYN()=='N'){  %>
											<td>거절</td>
										<%} %>
									</tr>
								<%} %>
							<%}else{ %>
								<tr>
									<td colspan="4" style="text-align:center; color:gray;">가입 신청 내역이 없습니다</td>
								</tr>
							<%} %>
						</table>
						
						
							 <!-- 페이지 넘버 -->
							<%if(!hList.isEmpty()){ %>
								<div id="pageNavi"><%=sbH %></div>
							<%}%> 
						</div>
						
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