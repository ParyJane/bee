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
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubMaxMember.css">
<body>
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
<main id="content" role="main" class="midContent" data-uiselector="contentRegion"><div data-viewname="DBandQuotaUnfixedSetView">
<section class="sSettingBand gContentCardShadow">
<form action="subMaxMemberSet.do" method="post">
    <div class="uHeaderWrap -h50">
        <header class="header beeHeaderColor">
            <h1 class="title">최대 멤버수</h1>
        </header>
    </div>
    <div>     
        <ul class="sSettingList">
            <li class="sSettingItem">
                <div class="itemContent">
                    <label for="bandMemberType" class="label">최대 멤버수</label>
                </div>
                <div class="itemSide -wAuto">
                    <div class="uSelect -bg">
                    <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo() %>"/>
		                <%if(beeResult.getBeesUserLimit()==0) {%> 
		                <select id="MaxMember" name="MaxMember" class="gColorBk4 _selectUnlimited">
		                            <option value="10" >10명까지</option>
		                            <option value="0" selected="true">무제한</option>
		                </select>
		                <%}else{ %>
		                 <select id="MaxMember" name="MaxMember" class="gColorBk4 _selectUnlimited">
		                            <option value="10" selected="true">10명까지</option>
		                            <option value="0" >무제한</option>
		                 </select>
		                <%} %>                      
                	</div>
                </div>
            </li>
        </ul>
        <div class="attention -tLine">
            <h3 class="title">꼭 읽어보세요!</h3>
            <div class="noticeArea">
                <p class="noticeText">멤버수 설정은 하루에 한번만 변경할 수 있습니다.</p>               
            </div>
        </div>
        <div class="introOption">
        <div class="introOptionBox gTaC gPat15 gPab17">
            <button type="submit" class="uButton -confirm _btnSaveIntroDescription">저장</button>
        </div>
    </div>
    </div>
</form>   
</section>
</div></main>
</body>
</html>