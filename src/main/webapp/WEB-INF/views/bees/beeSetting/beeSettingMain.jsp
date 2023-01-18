<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 설정</title>
</head>
<body>
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	Member sessionMember = (Member)session.getAttribute("member");
%>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingMain.css">
<main id="content" role="main" class="midContent" data-uiselector="contentRegion">
<section data-viewname="DGroupBandSettingHomeView" class="sSettingBand gContentCardShadow"><div class="uHeaderWrap -h50">
    <header class="header beeHeaderColor">
        <h1 class="title">비즈 설정</h1>
    </header>
</div>
<ul class="sSettingList">
        <li class="sSettingItem">
            <div class="itemContent">
                <span class="label">비즈 이름 및 커버</span>
            </div>
            <div class="itemSide">
            <form id="beeSettingSubCoverUpdate" action="/beeSettingSubCoverUpdate.do" method="post">
            <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
                <a href="#" onclick="document.getElementById('beeSettingSubCoverUpdate').submit();" class="uButton -sizeS -confirm2">변경</a>
            </form>
            </div>
        </li>      
        <li class="sSettingItem">
            <div class="itemContent">
                <span class="label">비즈 공개</span>
                 <%if(beeResult.getBeesPublicYN()=='Y') {%> 
                <span class="subTxt">공개</span>
                <%}else{ %>
                <span class="subTxt">비공개</span>
                <%} %>
            </div>
            <div class="itemSide">
            <form id="beeSettingSubType" action="/beeSettingSubType.do" method="post">
            <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
                <a href="#" onclick="document.getElementById('beeSettingSubType').submit();" class="uButton -sizeS -confirm2">변경</a>
            </form>
            </div>
        </li>
    <li class="sSettingItem" style="">
        <div class="itemContent">
            <span class="label">비즈 소개</span>
            <span class="subTxt">비즈 소개글을 관리하세요.</span>
        </div>
        <div class="itemSide"> 
        <form id="beeSettingSubIntro" action="/beeSettingSubIntro.do" method="post">
        <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>  
            <a href="#" onclick="document.getElementById('beeSettingSubIntro').submit();" class="uButton -sizeS -confirm2">설정</a>
        </form>
        </div>
    </li>
      <li class="sSettingItem">
            <div class="itemContent">
                <span class="label">최대 멤버수</span>
                <%if(beeResult.getBeesUserLimit()==0) {%> 
                 <span class="subTxt">무제한</span>
                <%}else{ %>
                 <span class="subTxt">10명</span>
                <%} %>
               
            </div>
            <div class="itemSide">
            <form id="beeSettingSubMaxMember" action="/beeSettingSubMaxMember.do" method="post">
            <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
                <a href="#" onclick="document.getElementById('beeSettingSubMaxMember').submit();" class="uButton -sizeS -confirm2">변경</a>
            </form>
            </div>
        </li>
    
</ul>



<h2 class="sSettingTitle"></h2>

<ul class="sSettingList">

        <li class="sSettingItem">
            <div class="itemContent">
                <span class="label">가입 조건 설정</span>
                <% char memberGenderNo ='N';
                if(beeResult.getBeesGender()==memberGenderNo&&beeResult.getBeesMinBirth()==0) {%> 
                 <span class="subTxt">성별 제한없음, 나이 제한없음</span>
                <%}else if(beeResult.getBeesGender()==memberGenderNo&&beeResult.getBeesMinBirth()!=0){ %>
                 <span class="subTxt">성별 제한없음, 나이 제한있음</span>
                <%}else if(beeResult.getBeesGender()!=memberGenderNo&&beeResult.getBeesMinBirth()==0){ %>
                 <span class="subTxt">성별 제한있음, 나이 제한없음</span>
                <%}else{ %>
                 <span class="subTxt">성별 제한있음, 나이 제한있음</span>
                <%} %>            
            </div>
            <div class="itemSide">
            <form id="beeSettingSubJoinStandard" action="/beeSettingSubJoinStandard.do" method="post">
            <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
                <a href="#" onclick="document.getElementById('beeSettingSubJoinStandard').submit();" class="uButton -sizeS -confirm2">변경</a>
            </form>
            </div>
        </li> 
 		<li class="sSettingItem">
            <div class="itemContent">
                <span class="label">매니저 관리</span>
            </div>
            <div class="itemSide">
            <form id="beeSettingSubJoinManager" action="/beeSettingSubJoinManager.do" method="post">
            <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
                <a href="#" onclick="document.getElementById('beeSettingSubJoinManager').submit();" class="uButton -sizeS -confirm2">변경</a>
            </form>
            </div>
        </li>
     	<li class="sSettingItem">
            <div class="itemContent">
                <span class="label">멤버들의 권한 설정</span>
            </div>
            <div class="itemSide">
            <form id="beeSettingSubMemberPermission" action="/beeSettingSubMemberPermission.do" method="post">
            <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
                <a href="#" onclick="document.getElementById('beeSettingSubMemberPermission').submit();" class="uButton -sizeS -confirm2">변경</a>
            </form>
            </div>
        </li>
    	 <li class="sSettingItem">
	        <div class="itemContent">
	            <span class="label">멤버 탈퇴, 차단 설정</span>
	        </div>
	        <div class="itemSide">
	        <form id="beeSettingSubMemberWithdraw" action="/beeSettingSubMemberWithdraw.do" method="post">
            <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
	            <a href="#" onclick="document.getElementById('beeSettingSubMemberWithdraw').submit();" class="uButton -sizeS -confirm2">변경</a>	          
	        </form>
	        </div>
    	</li>
</ul>

<h2 class="sSettingTitle -hideTxt"><span class="gSrOnly"></span></h2>

<ul class="sSettingList">
    
        <li class="sSettingItem">
            <div class="itemContent">
                <span class="label">비즈 탈퇴</span>
            </div>
            <div class="itemSide" id="boxWithdraw" data-toggle="modal" data-target="#myModalWithdraw">
			  <path d="M4.715 6.542L3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.001 1.001 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
			  <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 0 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 0 0-4.243-4.243L6.586 4.672z"/>
			
			<button type="button" class="uButton -sizeS -confirm2 -colorError _btnLeaveBand">탈퇴</button> 
			
            </div>
            <jsp:include page="modalWithdraw.jsp"/> 
        </li>  
        <li class="sSettingItem">
            <div class="itemContent">
                <span class="label">비즈 삭제</span>
            </div>
            <div class="itemSide" id="boxBeesDelete" data-toggle="modal" data-target="#myModalBeesDelete">
			  <path d="M4.715 6.542L3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.001 1.001 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
			  <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 0 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 0 0-4.243-4.243L6.586 4.672z"/>
			<button type="button" class="uButton -sizeS -confirm2 _btnDeleteBand">삭제</button> 
            </div>
            <jsp:include page="modalBeesDelete.jsp"/>           
</ul></section></main>

<script>
	$(function(){
		$("#boxWithdraw").click(function(){
			$("#myModalWithdraw").modal();
		});
	}); 

	$(function(){
		$("#boxBeesDelete").click(function(){
			$("#myModalBeesDelete").modal();
		});
	});
	
</script> 
</body>
</html>