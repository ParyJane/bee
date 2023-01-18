<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.BeesUserList"%>
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
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubMemberWithdraw.css">
<body>
<%
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
    <button type="button" class="btn _moveToWithdrawalMemberPage sf_color -on">멤버 목록</button>
    <button type="button" onclick="location.href='/beeSettingSubMemberWithdrawDo.do?beesNo=<%=list.get(0).getBeesNo()%>'" class="btn _moveToBlockMemberPage sf_color">차단 목록</button>
</div>
<div class="leaveMemberList">   
    <div class="summaryWrap _summaryWrap">
        <div class="subTitle gMat18 _memberCount">
            <h2 class="title gFw6">멤버 <span class="sf_color _memberCountText"><%=list.size()%></span></h2>           
        </div>
    </div>
    <div class="listWrap">
<%for(BeesUserList bu : list){%>
<ul class="cMemberList"><li data-viewname="DBandMemberWithdrawalItemView" class="uFlexItem">
<span class="body">
    <span class="text -ellipsis"><%=bu.getUserName() %></span>  
</span>

<span class="etc">
<form action="subMemberWithdrawSet.do" method="post" style="display: inline-block;">
	<input type="hidden" id="beesNo" name="beesNo" value="<%=bu.getBeesNo() %>"/>
	<input type="hidden" id="memberNo" name="memberNo" value="<%=bu.getMemberNo() %>"/>
    <button type="submit" class="_btnManageMemberWithdrawal uButton -sizeS -alert " >탈퇴</button>
</form> 
<form action="subMemberWithdrawBlockSet.do" method="post" style="display: inline-block;margin-left: 5px;">
	<input type="hidden" id="beesNo" name="beesNo" value="<%=bu.getBeesNo() %>"/>
	<input type="hidden" id="memberNo" name="memberNo" value="<%=bu.getMemberNo() %>"/>  
	<button type="submit" class="_btnManageMemberWithdrawal uButton -sizeS -reverse" >차단</button>
</form>
    <label for="uCheck67080144" class="uCheck -checkbox _toggleMemberWithdrawal" style="display: none;">
        <input type="checkbox" id="uCheck67080144" class="checkInput">
        <span class="checkLabel">
            <span class="shape sf_tAfterBg"></span>
            <span class="text"></span>
        </span>
    </label>
</span></li></ul>
<%} %> 
        <p class="uEmpty _collectionEmptyMsgEl" style="height:545px;display: none;">
            <span class="gColorGr3 _collectionEmptyMsg"></span>
        </p>
    </div>
</div></div></main>
</body>
</html>