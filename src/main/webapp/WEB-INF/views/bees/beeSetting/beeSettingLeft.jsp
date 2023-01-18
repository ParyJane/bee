  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 설정</title>
</head>

<body>
<%
	Bees beeResultLeft = (Bees)request.getAttribute("beeResult");
	int userCountLeft = (int)request.getAttribute("userCount");
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
 
<% 
    String coverPath = beeResultLeft.getBeesCover();	
	String beesCover = null;
    if(coverPath.endsWith("_bee")){
    	beesCover = "/resources/image/beeCreateProfile/"+coverPath;
    }else{
    	beesCover = coverPath;
    }
 %> 
<div id="bees-side-profile">
                  <table>
                     <tr>
                        <td id="bees-cover" colspan="2" style="background-image:url('<%=beesCover %>')"></td>
                     </tr>
                     <tr>
                        <td id="bees-name" colspan="2"><%=beeResultLeft.getBeesName() %></td>
                     </tr>
                     <tr>
                        <td id="bees-member-count">
                           멤버<b>  <%=userCountLeft %>  </b>
                        </td>
                        <td id="bees-invite">
                           <a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>초대</a>
                        </td>
                     </tr>
                     <tr>
                        <td id="bees-note" colspan="2">                  
                           <a href="/beeSettingSubIntro.do?beesNo=<%=beeResultLeft.getBeesNo()%>">비즈 소개 설정 </a>
                        </td>
                     </tr>
                     <tr>
								<td id="bees-cont" colspan="2">
								<%if(beeResultLeft.getBeesCont()==null){%>
								<%}else{ %>
								<%=beeResultLeft.getBeesCont() %>
								<%} %>
								</td>
					 </tr>
                     <tr>
                        <td class="innerline" colspan="2">
                           <hr>
                        </td>
                     </tr>
                     <tr>
                        <td id="bees-setting" colspan="2">
                        <form id="beeSettingMove" action="/beeSettingMain.do" method="post">
                        <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResultLeft.getBeesNo()%>"/>                     
		                <a href="#" onclick="document.getElementById('beeSettingMove').submit();"> <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
		                <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
		                <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
		             	</svg>&nbsp;비즈설정
                           </a>
                            </form>
                        </td>
                     </tr>                  
                  </table>
               </div>
              <!--  <div id="bees-side-chatting">
                  <table>
                     <tr>
                        <td id="chatting-header">채팅</td>
                        <td id="new-chat">
                           <a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">새 채팅</a>
                        </td>
                     </tr>
                     <tr>
                        <td class="innerline" colspan="2">
                           <hr>
                        </td>
                     </tr>
                     <tr>
                        <td class="chat-list" colspan="2">
                           <div class="chat-profile"></div>
                           <a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()" style="color: dimgray">사용자 이름</a>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="padding: 10px 5px 0 5px; line-height: 10px;">
                           <div class="chat-profile"></div>
                           <a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()" style="color: dimgray">'비즈' 전체 채팅</a>
                        </td>
                     </tr>
                  </table>
               </div> -->
</body>
</html>