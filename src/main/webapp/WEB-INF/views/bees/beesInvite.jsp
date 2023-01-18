<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Setting"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.BeesUser"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bees 멤버 초대</title>
</head>
<body>
	<%@ include file="/common/cdnLib.jsp"%>

<script>

$(function(){

//인풋태그 자동완성 X
$('input').attr('autocomplete','off');

$('.chat-open-btn').click(function(){    
window.open("chatting-page.html", '비즈 채팅', 'width=400px, height=600px, resizable=no');
return false;

});

});

</script>

<link rel="stylesheet" type="text/css" href="resources/css/beesInvite.css">

<%
//비즈 공통 정보 (서브바 필요정보)
	Member member = (Member)session.getAttribute("member");
	Bees bees = (Bees)request.getAttribute("bees");
	
	session.setAttribute("beesNo",bees.getBeesNo());//비즈 메인으로 접근할때마다 갱신
	
	Setting setting = (Setting)request.getAttribute("setting");
	int userCount = (int)request.getAttribute("userCount");
	String beesName = bees.getBeesName();
	if(bees.getBeesName().length()>=5){
	beesName = bees.getBeesName().substring(0,5)+"..";
	}
	BeesUser user = (BeesUser)request.getAttribute("user");
	String userAuth = null;
	if(user!=null){
		if(user.getUserAuthYN()=='W'){
			user = null;
			userAuth = "W";
		}
	}
	



	int beesNo = (int)request.getAttribute("beesNo");
	int memberNo = (int)request.getAttribute("memberNo");
	
	System.out.println("초대 페이지 beesNo 확인: " + beesNo);
	System.out.println("초대 페이지 memberNo 확인: " + memberNo);
%>

<style>
#all{
padding-bottom : 12%;
height : 100%;
}

#bees-cont {
	padding: 0 5px 5px 5px;
	font-size: 0.8rem;
	font-weight: 100;
}

</style>
	<div>
		<%@include file="/include/headerBee.jsp" %>
	</div>	
	<div class="container pt-3" id="all">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3 p-0">
				
				
							
			<!-- 비즈 사이드 정보 -->
				<div id="bees-side" class="container m-0 p-2">
					<div id="bees-side-profile">
					<% 
   				 String coverPath = bees.getBeesCover();	
					String beesCover = null;
    			if(coverPath.endsWith("_bee")){
    			beesCover = "/resources/image/beeCreateProfile/"+coverPath;
    			}else{
    				beesCover = coverPath;
    				}
					 %>  
						<table>
							<tr>
							
								<td id="bees-cover" colspan="2" style="background-image:url('<%=beesCover %>')"></td>
							</tr>
							<tr>
								<td id="bees-name" colspan="2"><%=bees.getBeesName() %></td>
							</tr>
							<tr>
								<td id="bees-member-count">
									멤버<b> <%=userCount %> </b>
								</td>
								<td id="bees-invite"><!-- 권한별 설정 -->
								<%if(user!=null){%>
								<%if((setting.getSetUserInvite()).equals("user")){%>
									<a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>초대</a>
              <%}else if(((setting.getSetUserInvite()).equals("manager"))){
              	if(!(user.getUserClass().equals("user"))){%>
              <a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>초대</a>
              <%}//if
              }//elseif
              else if(((setting.getSetUserInvite()).equals("host"))){
              if((user.getUserClass().equals("host"))){%>
              <a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>초대</a>
              <%}
              }
								}//userIf%>
								</td>
							</tr>
							<tr>
								<td id="bees-note" colspan="2">
								<% 
								if(user!=null){
								if(!(user.getUserClass()).equals("user")){ %>
									<a href="/beeSettingSubIntro.do?beesNo=<%=bees.getBeesNo()%>">비즈 소개 설정 </a>
								<%} 
								}%>
								</td>
							</tr>
							<%if(bees.getBeesPublicYN() == 'N' && user==null ){%>
							<tr>
								<td id="bees-public" colspan="2">
								비즈와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.
								</td>
							</tr>
							<%}else{%>
							<tr>
								<td id="bees-cont" colspan="2">
								<%if(bees.getBeesCont()==null){%>
								<%}else{ %>
								<%=bees.getBeesCont() %>
								<%} %>
								</td>
							</tr>
							<%}
							if(user!=null){%>
							<%if(!(user.getUserClass()).equals("user")){ %>
							<tr>
								<td class="innerline" colspan="2">
									<hr>
								</td>
							</tr>
							<tr>
								<td id="bees-setting" colspan="2">
								<form id="beeSettingMove" action="/beeSettingMain.do" method="post">
                        <input type="hidden" id="beesNo" name="beesNo" value="<%=bees.getBeesNo()%>"/>                     
		                <a href="#" onclick="document.getElementById('beeSettingMove').submit();"> <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
		                <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
		                <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
		             	</svg>&nbsp;비즈설정
                           </a>
                            </form>
								</td>
							</tr>
							
							<%} 
							}
							%>
		
						</table>
					</div>
					<%
					if(user!=null){ %>
					<div id="bees-side-chatting">
						<table>
							<tr>
								<td id="chatting-header">채팅</td>
								<td id="new-chat">
									
								<%if((setting.getSetUserInvite()).equals("user")){%>
								<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">새 채팅</a>	
              					<%}else if(((setting.getSetUserInvite()).equals("manager"))){
              					if(!(user.getUserClass().equals("user"))){%>
							<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">새 채팅</a>
             				<%}//if
              				}//elseif
              				else if(((setting.getSetUserInvite()).equals("host"))){
              				if((user.getUserClass().equals("host"))){%>
							<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">새 채팅</a>
             				 <%}
             				 }%>
							</td>	
							</tr>
							<tr>
								<td class="innerline" colspan="2">
									<hr>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="padding: 10px 5px 0 5px; line-height: 10px;">
									<div class="chat-profile" style="background-image:url('<%=beesCover %>')"></div>
									<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()" style="color: dimgray">
									'<%=beesName %>' 전체 채팅
									</a>
								</td>
								<script>
								$('.chat-open-btn').click(
										function() {
											window.open("/chat.do?beesNo=${requestScope.bees.beesNo }&userName=${requestScope.user.userName }", '비즈 채팅',
													'width=400px, height=600px, resizable=no');
											return false;});
								</script>
							</tr>
						</table>
					</div>
					<%}else{ 
					}%>
				</div>
				<!-- 여기까지 복사 붙여넣기 -->
				
				
				
			</div>
			
			
			
			
			
			
			
			
			<div class="col-7 p-0">
				<div id="bees-contents" class="container m-0 p-2">
				<div class="row p-0"  id="feed">
						<div class="col-md-12" id="feed-top">멤버초대</div>
						<div class="col-md-11" id="line3"></div>
						

<!-- modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			
				<div class="modal-body">
				<div id="modal-top"><span>초대 링크 공유하기</span></div>
				<div id="line5"></div>
				<div id="modal-mid"><span>초대링크 복사 후, 원하는 곳에 링크를 공유하세요.</span></div>
					<input type="text" class="form-control" id="copy-input" value="https://bee.us/n/comeonComeOn"/>
					<br />
					<a href="#" id="copy" data-clipboard-target="#copy-input" class="btn btn-default">URL 복사</a>
				</div>
			</div>
		</div>
	</div>



	<a href="#" class="btn btn-primary" data-target=".modal" data-toggle="modal" id="memberinvitebtn"><div id="memberinvitebox"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-link-45deg" viewBox="0 0 16 16">
  <path d="M4.715 6.542L3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.001 1.001 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
  <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 0 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 0 0-4.243-4.243L6.586 4.672z"/>
</svg> <span id="box-text1">초대링크 공유하기</span> <br> <sapn id="box-text2">함께하고 싶은 비즈들에게 공유해주세요!</span></div></a>
	
	
	<div class="col-md-11" id="line4"></div>

					</div>
    
 
<script src='https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.13/clipboard.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
	<script>
		$(".modal").on("shown.bs.modal", function() {
			console.log('a', Clipboard, $('#copy'), $("#copy-input").val());
			var clipboard = new Clipboard('#copy')
		});
		
		$(function(){
			var newURL = window.location.protocol + "//" + window.location.host + "/" + "beesSelectOne.do?beesNo=" + <%=beesNo%> + "&memberNo="+<%= memberNo%>;
			$('#copy-input').val(newURL);
			
			
		})
	</script>
			</div>	
		</div>		
	</div>			
</div>

	<div id="footer">
	<%@include file="/common/footer.jsp"%>
	</div>
	
</body>
</html>