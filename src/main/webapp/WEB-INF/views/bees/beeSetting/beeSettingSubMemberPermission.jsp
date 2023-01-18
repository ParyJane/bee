<%@page import="com.fourmeeting.bee.bees.model.vo.Setting"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 설정</title>
</head>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubMemberPermission.css">
<body>
<%
	Setting settingResult = (Setting)request.getAttribute("settingResult");	
%>
<main id="content" role="main" class="midContent" data-uiselector="contentRegion">
<div data-viewname="DGroupBandMemberPermissionView" class="sSettingBand gContentCardShadow">
<form action="subMemberPermissionSet.do" method="post">
<div class="uHeaderWrap -h50">
    <header class="header beeHeaderColor">
        <h1 class="title">멤버들의 권한 설정</h1>
    </header>
</div>
<ul class="sSettingList">      
    <li class="sSettingItem topBorderNo">
        <div class="itemContent">
            <span class="label">공지글 등록</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
             <input type="hidden" id="beesNo" name="beesNo" value="<%=settingResult.getBeesNo() %>"/>
                <select id="set_notice" name="set_notice" class="gColorBk4 _selectRole" data-key="edit_notice_roles">
                    <!-- <option value="user">모든 멤버</option> -->
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">글쓰기</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_write" name="set_write" class="gColorBk4 _selectRole" data-key="comment_roles">
                    <option value="user">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">댓글 쓰기</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_comment" name="set_comment" class="gColorBk4 _selectRole" data-key="comment_roles">
                    <option value="user">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
   
    
</ul>

<h2 class="sSettingTitle -hideTxt"><span class="gSrOnly">멤버들의 권한 설정</span></h2>

<ul class="sSettingList">
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">일정 등록</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_sche_regist" name="set_sche_regist" class="gColorBk4 _selectRole" data-key="register_schedule_roles">
                    <option value="user">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">일정 수정</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_sche_modify" name="set_sche_modify" class="gColorBk4 _selectRole" data-key="modify_schedule_roles">
                    <option value="user">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
</ul>


<h2 class="sSettingTitle -hideTxt"><span class="gSrOnly">멤버들의 권한 설정</span></h2>

<ul class="sSettingList">
    
    <!-- <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">채팅 초대하기</span>
            <span class="subTxt">채팅방에 멤버를 초대해 대화할 수 있어요.</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set12" class="gColorBk4 _selectRole" data-key="invite_chat_roles">
                    <option value="user" selected="true">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    
    <li class="sSettingItem _chatToLeaderWrapper" style="display: none;">
        <div class="itemContent">
            <label for="chkChatToLeader" class="label">리더에게 채팅 보내기</label>
            <span class="subTxt">채팅 초대 권한이 없어도 리더나 공동리더에게는<br>1:1 채팅을 보낼 수 있도록 설정할 수 있어요.</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                
                <select id="chkChatToLeader" class="gColorBk4 _chkChatToManager">
                    <option value="leader">리더만</option>
                    <option value="leader,coleader">리더와 공동리더</option>
                    <option value="" selected="">비허용</option>
                </select>
            </div>
        </div>
    </li> -->
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">공개채팅방 만들기</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_chat_open" name="set_chat_open" class="gColorBk4 _selectRole" data-key="create_open_chat_roles">
                    <option value="user">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">공개채팅방 삭제</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_chat_del" name="set_chat_del" class="gColorBk4 _selectRole" data-key="delete_open_chat_roles">
                   <option value="user">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
</ul>


<h2 class="sSettingTitle -hideTxt"><span class="gSrOnly">멤버들의 권한 설정</span></h2>

<ul class="sSettingList">
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">멤버 초대</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_user_invite" name="set_user_invite" class="gColorBk4 _selectRole" data-key="invite_member_roles">
                    <option value="user">모든 멤버</option>
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">멤버 가입신청 수락 </span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_user_permit" name="set_user_permit" class="gColorBk4 _selectRole" data-key="accept_application_roles">
                <!--   <option value="user" >모든 멤버</option>  -->
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">가입방법, 가입조건 설정 </span>
            <!-- <span class="subTxt">가입신청관련 가입조건을 설정 할 수 있습니다.</span> -->
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_user_condi" name="set_user_condi" class="gColorBk4 _selectRole" data-key="manage_join_roles">
                  <!--  <option value="user" >모든 멤버</option> -->
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
</ul>

<h2 class="sSettingTitle -hideTxt"><span class="gSrOnly">멤버들의 권한 설정</span></h2>

<ul class="sSettingList">
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">다른 멤버의 게시물, 댓글 삭제</span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_cont_del" name="set_cont_del" class="gColorBk4 _selectRole" data-key="delete_contents_roles">
                   <!-- <option value="user" >모든 멤버</option> -->
                    <option value="manager">리더와 매니저</option>
                    <option value="host">리더만</option>
                </select>
            </div>
        </div>
    </li>
    
    <li class="sSettingItem">
        <div class="itemContent">
            <span class="label">멤버 탈퇴, 차단 설정 </span>
        </div>
        <div class="itemSide -wAuto">
            <div class="uSelect -bg">
                <select id="set_user_block" name="set_user_block" class="gColorBk4 _selectRole" data-key="ban_member_roles">
                    <!-- <option value="user" >모든 멤버</option> -->
                    <option value="manager">리더와 매니저</option>
                    <option value="host" >리더만</option>
                </select>
            </div>
        </div>
    </li>
</ul>
<div class="btnFooter -lrSpace">
    <button type="submit" class="uButton -sizeL -confirm _btnConfirm">저장</button>
</div>
</form>
</div></main>
<script type="text/javascript">
$("#set_notice").val("<%=settingResult.getSetNotice()%>").prop("selected", true);
$("#set_write").val("<%=settingResult.getSetWrite()%>").prop("selected", true);
$("#set_comment").val("<%=settingResult.getSetComment()%>").prop("selected", true);
$("#set_sche_regist").val("<%=settingResult.getSetScheRegist()%>").prop("selected", true);
$("#set_sche_modify").val("<%=settingResult.getSetScheModify()%>").prop("selected", true);
$("#set_chat_open").val("<%=settingResult.getSetChatOpen()%>").prop("selected", true);
$("#set_chat_del").val("<%=settingResult.getSetChatDel()%>").prop("selected", true);
$("#set_user_invite").val("<%=settingResult.getSetNotice()%>").prop("selected", true);
$("#set_user_permit").val("<%=settingResult.getSetUserPermit()%>").prop("selected", true);
$("#set_user_condi").val("<%=settingResult.getSetUserCondi()%>").prop("selected", true);
$("#set_cont_del").val("<%=settingResult.getSetContDel()%>").prop("selected", true);
$("#set_user_block").val("<%=settingResult.getSetUserBlock()%>").prop("selected", true);
</script> 
</body>
</html>