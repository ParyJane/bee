<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 설정</title>
</head>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubIntro.css">
<body>
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
<main id="content" role="main" class="midContent" data-uiselector="contentRegion"><div data-viewname="DGroupBandEditIntroView" class="sSettingBand gContentCardShadow">
<form action="subIntroSet.do" method="post">
	<div class="uHeaderWrap -h50">
	    <header class="header beeHeaderColor">
	        <h1 class="title">비즈 소개</h1>
	    </header>
	</div>
	
	<div class="cBandIntro cIntroEditor">
	
	    <div class="textareaBox _introDescriptionWrapper">
	        <div class="uTextarea">
	        <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo() %>"/>
	        <%if(beeResult.getBeesCont()==null){ %>
	            <textarea class="_introDescription" id="beeCont" name="beeCont" cols="30" rows="10" placeholder="비즈 소개말과 대표 사이트 등을 입력하세요." style="height:100%" maxlength="500"></textarea>
	        <%}else{ %>
	            <textarea class="_introDescription" id="beeCont" name="beeCont" cols="30" rows="10" style="height:100%" maxlength="500"><%=beeResult.getBeesCont() %></textarea>   
	        <%} %>
	            <span class="border"></span>
	        </div>
	    </div>
	   
	    <div class="introOption">
	        <div class="introOptionBox gTaC gPat15 gPab17">
	            <button type="submit" class="uButton -confirm _btnSaveIntroDescription">완료</button>
	        </div>
	    </div>
	</div>
</form>
</div>
</main>
</body>
</html>