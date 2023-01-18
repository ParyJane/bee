<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
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
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubJoinManager.css">
<body>

<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	ArrayList<BeesUserList> list = (ArrayList<BeesUserList>)request.getAttribute("list");
	ArrayList<BeesUserList> listUser = (ArrayList<BeesUserList>)request.getAttribute("listUser");
	/* Bees beeResult = (Bees)request.getAttribute("beeResult"); */
	Member sessionMember = (Member)session.getAttribute("member");
%>
<main id="content" role="main" class="midContent" data-uiselector="contentRegion">
<div data-viewname="DGroupBandManageCoLeaderView" class="sSettingBand gContentCardShadow">

<div class="uHeaderWrap">
    <header class="header beeHeaderColor">
        <h1 class="title">매니저 추가</h1>
        <div class="btnsWrap" id="boxJoinManager" data-toggle="modal" data-target="#myModalJoinManager">
			  <path d="M4.715 6.542L3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.001 1.001 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
			  <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 0 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 0 0-4.243-4.243L6.586 4.672z"/>
		
		<button type="button" class="btn uButton sf_tBorderOpacity sf_color _btnAddCoLeader">매니저 추가</button> 
        
        </div>
        <jsp:include page="modalJoinManager.jsp"/>    
        <!-- <div class="btnsWrap">
            <button type="button" class="btn uButton sf_tBorderOpacity sf_color _btnAddCoLeader">매니저 추가</button>
        </div> -->
    </header>
</div>
<%if(list.isEmpty()) {%>
<ul class="cMemberList gMal22 gMar22">
<li data-viewname="DBandCoLeaderItemView" class="uFlexItem">

<span class="body">     
    <span class="text -ellipsis gMat6">매니저가 없습니다.</span>
</span>

<span class="etc">

</span>
</li>
</ul>
<%}else{ %> 
<%for(BeesUserList bu : list){%>
<ul class="cMemberList gMal22 gMar22">
<li data-viewname="DBandCoLeaderItemView" class="uFlexItem"><a href="#" role="button" class="uProfile -size50 _btnProfileImage">
    <span class="profileInner ">
        <img src="<%=bu.getProfileImg() %>" width="50" height="50" 
         onError="javascript:this.src='/resources/image/user/profile_none.png'">
    </span>
</a>

<span class="body">   
    <span class="text -flex"><em class="leader gMal0">매니저</em></span>
    <span class="text -ellipsis gMat6"><%=bu.getUserName() %></span>
</span>

<span class="etc">
<form action="subJoinManagerToUserSet.do" method="post">
	<input type="hidden" id="beesNo" name="beesNo" value="<%=bu.getBeesNo() %>"/>
	<input type="hidden" id="memberNo" name="memberNo" value="<%=bu.getMemberNo() %>"/>
    <button type="submit" class="uButton -sizeS -confirm2 _btnRemoveCoLeader">취소</button> 
</form>
</span>
</li>
</ul>
<%} %> 
<%} %>

<div class="sSettingBand">
    <div class="linkMemeberPrower">
        <p class="text">매니저는 무엇을 할 수 있나요?<br>설정 메뉴에서 매니저의 권한을 설정할 수 있습니다.</p>
        <a href="/beeSettingSubMemberPermission.do?beesNo=<%=beeResult.getBeesNo()%>" class="moreLink">멤버들의 권한 설정 바로가기</a>
    </div>
</div>
<div class="introOption">
      <div class="introOptionBox gTaC gPat15 gPab17">
          <button type="button" onclick="location.href='/beeSettingMain.do?beesNo=<%=beeResult.getBeesNo()%>'" class="uButton -confirm _btnSaveIntroDescription">완료</button>
      </div>
</div>
</div>
</main>

<script>
	$(function(){
		$("#boxJoinManager").click(function(){
			$("#myModalJoinManager").modal();
		});
	});
</script>
</body>
</html>