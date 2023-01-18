<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bee 아이디 찾기</title>
<%@ include file="/common/cdnLib.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/memberFindId.css">
</head>

<body>
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
					<div class="col-12 px-5"><span id="title">아이디 찾기</span></div>
				</div>
				<div class="row">
					<div class="col-12 p-0">
						<form action="/memberFindId.do" method="post">
							<div class="container">
								<div class="row border-0 my-3">
									<div class="col-12 border-0 px-5">
										<span class="formTitle d-block">&nbsp;이름</span> 
										<input type="text" id="memberName" name="memberName" onblur="nameCheck();" placeholder="이름 입력" autocomplete="off" />
										<span id="nameMessage" class="checkMessage"></span>
									</div>
								</div>

								<div class="row border-0 my-3">
									<div class="col-12 border-0 px-5">
										<span class="formTitle d-block">&nbsp;생년월일</span>
										<select name="birthYear"
										class="birth form-control form-check-inline m-0 px-3"
										style="width: 30%;">
											<c:forEach var="i" begin="1960" end="2021">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>년 &nbsp;
										<select name="birthMonth"
										class="birth form-control form-check-inline m-0 px-3"
										style="width: 20%;">
											<c:forEach var="i" begin="01" end="12">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>월 &nbsp;
										<select name="birthDay"
										class="birth form-control form-check-inline m-0 px-3"
										style="width: 20%;">
											<c:forEach var="i" begin="01" end="31">
												<option value="${i}" >${i}</option>
											</c:forEach>
										</select>일&nbsp;
									</div>
								</div>

								<div class="row border-0 my-3">
									<div class="col-12 border-0 px-5">
										<span class="formTitle d-block">&nbsp;핸드폰 번호</span>
										<div class="container p-0 m-0 border-none">
											<div class="row p-0 m-0">
												<div class="col-12 col-lg-9 p-0 m-0">
													<input type="text" id="memberPhone" name="memberPhone" onblur="phoneCheck();" maxlength="11" placeholder="-제외하고 입력" autocomplete="off" />
												</div>
												<div class="col-12 col-lg-3 p-0 m-0 text-center">
													<button type="button" id="sendSms" class="btn checkBtn m-0" style="display:inline-block">인증하기</button>
													<button type="button" id="changePhone" class="btn checkBtn m-0" style="display:none">번호변경</button>
												</div>
											</div>
												
											<div id="authBox" class="row p-0 mx-0 mt-3 mb-0" style="display:none;">
												<div id="authInputBox" class="col-12 col-lg-9 p-0 m-0">
													<input type="text" id="inputAuthNum" name="authNum" onblur="authNumCheck();" maxlength="11" placeholder="인증번호 입력" autocomplete="off" />
												</div>
												<div id="authBtnBox" class="col-12 col-lg-3 p-0 m-0 text-center">
													<button type="button" id="smsCheck" class="btn checkBtn m-0">인증완료</button>
												</div>
											</div>
										</div>
										<span id="phoneMessage" class="checkMessage"></span>
									</div>
								</div>
									
									
								<div class="row border-0 my-5">
									<div class="col-1"></div>
									<div class="col-5">																			
										<a class="btn w-100" href="/index.jsp">돌아가기</a>
									</div>
									<div class="col-5">																			
										<input type="submit" id="joinBtn" class="btn w-100" onclick="return check();" value="아이디 찾기" />
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
	
	<%@ include file="/common/footer.jsp"%>
	<script type="text/javascript" src="/resources/js/memberFindId.js"></script>
</body>
</html>