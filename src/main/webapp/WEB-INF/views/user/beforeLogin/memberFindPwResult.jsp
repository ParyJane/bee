<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bee 비밀번호 찾기</title>
<%@ include file="/common/cdnLib.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/memberFindPw.css">
</head>

<body>
	<% 
		Member m = (Member) request.getAttribute("m");
		
		if(m != null) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6 text-center">
				<img src="/resources/image/logo.PNG"/>
			</div>
				<div class="col-3"></div>
			</div>
			
			<div class="row">
			<div id="loginForm" class="container col-6">
				<div class="row">
					<div class="col-12 px-5"><span id="title"><%=m.getMemberName() %>님 비밀번호를 수정해주세요</span></div>
				</div>
				<div class="row">
					<div class="col-12 p-0">
						<form action="memberFindPwUpdate.do" method="post">
							<div class="container">	
								
								<div class="row border-0 my-3">
									<div class="col-12 border-0 px-5">
										<span class="formTitle d-block">&nbsp;새로운 비밀번호</span> 
										<input type="hidden"  name="memberId" value="<%=m.getMemberId()%>" />
										<input type="password" id="memberPw" name="memberPw" onblur="pwCheck();" placeholder="비밀번호 입력(숫자,영문,특수문자 조합 최소 8자 최대 16자)" autocomplete="off" />
										<span id="pwMessage" class="checkMessage"></span>
									</div>
								</div>
									
								<div class="row border-0 my-3">
									<div class="col-12 border-0 px-5">
										<span class="formTitle d-block">&nbsp;비밀번호 확인</span> 
										<input type="password" id="memberPwRe" name="memberPwRe" onblur="pwReCheck();" placeholder="비밀번호 재입력" autocomplete="off" />
										<span id="pwReMessage" class="checkMessage"></span>
									</div>
								</div>
													
									
								<div class="row border-0 my-5">
									<div class="col-1"></div>
									<div class="col-5">																			
										<a class="btn w-100" href="/index.jsp">돌아가기</a>
									</div>
									<div class="col-5">																			
										<input type="submit" id="joinBtn" class="btn w-100" onclick="return check();" value="비밀번호 수정" />
									</div>
									<div class="col-1"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="py-3"></div>
	<%@ include file="/common/footer.jsp"%>
	<% } else { %>
		<script>
			alert("찾으시는 정보의 회원이 없거나 잘못된 정보입니다.");
			location.replace("/index.jsp");
		</script>
	<% } %>
	
	<script type="text/javascript" src="/resources/js/memberFindPwResult.js"></script>
</body>
</html>