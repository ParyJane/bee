<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bee 로그인</title>
<%@ include file="/common/cdnLib.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
</head>

<body>
	
	<%
	Member m = (Member)session.getAttribute("member");
	if(m == null) {
	%>
	<div class="container pt-5">

		<div id="top-padding" class="row my-5">
			<div class="col-12 my-3"></div>
		</div>
		
		<div id="contents" class="row mt-5">
			<div class="col-1"></div>
			<div class="col-5 text-center">
				<img src="/resources/image/indexLogo.PNG" width="100%" height="100%"/>
			</div>
			<div id="loginForm" class="container col-5 py-5">
			
				<div class="row">
					<div class="col-12">
						<form class="text-center" action="/memberLogin.do" method="post">
							<input type="text" id="memberId" name="memberId" placeholder="아이디" autocomplete="off" />
							<span id="idMessage" class="message"></span>
							<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호" autocomplete="off" />
							<span id="pwMessage" class="message"></span> 
							<input type="submit" id="loginBtn" class="btn btn-outline-secondary" value="로그인" />
						</form>
					</div>
				</div>
				
				<div class="row">
					<div class="col-12 col-lg-6 text-center pl-4">
						<a class="findInfo" href="memberFindIdPage.do">아이디를 잊으셨나요?</a>
					</div>
					<div class="col-12 col-lg-6 text-center pr-4">
						<a class="findInfo" href="memberFindPwPage.do">비밀번호를 잊으셨나요?</a>
					</div>
				</div>
				<hr class="my-1">
				<div class="row">
					<div class="col-12 text-center">
						<a id="joinBtn" href="memberJoin.do">회원가입</a>
					</div>
	
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="/resources/js/index.js"></script>
	<%} else { %>
	<script>
	location.replace("/myBeesPage.do?memberNo=<%=m.getMemberNo()%>");
	</script>
	<%} %>
</body>
</html>