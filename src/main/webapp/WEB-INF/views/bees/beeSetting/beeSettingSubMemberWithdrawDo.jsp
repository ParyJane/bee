<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.BeesUserList"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 설정</title>
</head>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubMemberWithdrawDo.css">
<body>
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	ArrayList<BeesUserList> list = (ArrayList<BeesUserList>)request.getAttribute("list");
	/* Bees beeResult = (Bees)request.getAttribute("beeResult"); */
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
<main id="content" role="main" class="midContent" data-uiselector="contentRegion"><div data-viewname="DBandMemberWithdrawalListView" class="sSettingBand gContentCardShadow">
<div class="uHeaderWrap -h50">
    <header class="header beeHeaderColor">
        <h1 class="title">멤버 탈퇴, 차단 설정</h1>
    </header>
</div>
<div class="uTabNav">
    <button type="button" onclick="location.href='/beeSettingSubMemberWithdraw.do?beesNo=<%=beeResult.getBeesNo()%>'" class="btn _moveToWithdrawalMemberPage sf_color">멤버 목록</button>
    <button type="button" class="btn _moveToBlockMemberPage sf_color -on">차단 목록</button>
</div>
<div class="leaveMemberList">   
<div class="listWrap">
<%  if(!list.isEmpty()) {
for(BeesUserList bu : list){%>
<ul class="cMemberList">
<li data-viewname="DBandBlockMemberItemView" class="uFlexItem">
		<span class="body">
		<span class="text -ellipsis"><%=bu.getUserName() %></span>
		</span>
		<span class="etc">
		<form action="subMemberBlockDeleteSet.do" method="post">
		<input type="hidden" id="beesNo" name="beesNo" value="<%=bu.getBeesNo() %>"/>
		<input type="hidden" id="memberNo" name="memberNo" value="<%=bu.getMemberNo() %>"/>
		<button type="submit" class="_btnReleaseBlockMember uButton -sizeS -cancel">차단해제</button>
		</form>
		</span>
</li>
</ul>
<%}
}%> 
        <p class="uEmpty _collectionEmptyMsgEl" style="height: 545px; display: none;">
            <span class="gColorGr3 _collectionEmptyMsg"></span>
        </p>
</div>
    
</div></div></main>
</body>
</html>