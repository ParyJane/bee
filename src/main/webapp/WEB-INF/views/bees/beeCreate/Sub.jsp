<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bee 비즈 만들기</title></title>
</head>
<body>
	<%@ include file="/common/cdnLib.jsp"%>
	<!--비즈 전체페이지 + 사이드 프로필 + 메인 컨텐츠 크기-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesForm.css">
	<script type="text/javascript" src="/resources/js/beesForm.js"></script>
	<div id="header">
	<%@include file="/include/headerUser.jsp" %>
	</div>
	<div class="container pt-3" style="min-height: 800px;">
	<jsp:include page="beeCreateSub.jsp"/>				
	</div>
	<div id="footer">
	<%@include file="/common/footer.jsp"%>
	</div>
</body>
</html>