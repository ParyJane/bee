<%@page import="com.fourmeeting.bee.bees.model.vo.Setting"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.BeesUser"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@page import="com.fourmeeting.bee.schedule.model.vo.Schedule"%>
<%@page import="com.fourmeeting.bee.image.model.vo.Image"%>
<%@page import="com.fourmeeting.bee.file.model.vo.BeesFile"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.fourmeeting.bee.vote.model.vo.FeedVote"%>
<%@page import="com.fourmeeting.bee.comment.model.vo.FeedComment"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fourmeeting.bee.board.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="/common/cdnLib.jsp"%>
	<!--비즈 전체페이지 + 사이드 프로필 + 메인 컨텐츠 크기-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesForm.css">
	<script type="text/javascript" src="/resources/js/beesForm.js"></script>
	<!--비즈 컨텐츠 + 글쓰기 / 검색 버튼-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesContents.css">
	<script type="text/javascript" src="/resources/js/beesContents.js"></script>
	<!--비즈 피드 -->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesFeed.css">
	<script type="text/javascript" src="/resources/js/beesFeed.js"></script>
	<!--비즈 글쓰기 모달-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesWriteModal.css">
	<script type="text/javascript" src="/resources/js/beesWriteModal.js"></script>
	<!--비즈 피드 수정 모달-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesModifyModal.css">
	<script type="text/javascript" src="/resources/js/beesModifyModal.js"></script>
	<!-- 비즈 가입 모달 -->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesJoinModal.css">
	<link rel="stylesheet" type="text/css" href="/common/common.css">
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<title>${requestScope.bees.beesName} | bee</title>
</head>
<body>

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
	
	//피드 필요정보
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 a KK시 mm분", Locale.KOREA);
	SimpleDateFormat scheFormat = new SimpleDateFormat("yyyy년 MM월 dd일 (E)", Locale.KOREA);
	
	ArrayList<Feed> feedList = (ArrayList<Feed>)request.getAttribute("feedList");
	HashMap<Integer,Integer> likeMap = (HashMap <Integer,Integer>)request.getAttribute("likeMap");
	HashMap<Integer, ArrayList<FeedComment>> commentMap =(HashMap<Integer, ArrayList<FeedComment>>)request.getAttribute("commentMap");
	HashMap<Integer, ArrayList<FeedComment>> recommentMap =(HashMap<Integer, ArrayList<FeedComment>>)request.getAttribute("recommentMap");
	HashMap<Integer, ArrayList<FeedVote>> voteMap = (HashMap<Integer, ArrayList<FeedVote>>)request.getAttribute("voteMap");
	HashMap<Integer, BeesFile> fileMap = (HashMap<Integer, BeesFile>)request.getAttribute("fileMap");
	HashMap<Integer, ArrayList<Image>> imageMap = (HashMap<Integer, ArrayList<Image>>)request.getAttribute("imageMap");
	HashMap<Integer, Schedule> scheduleMap = (HashMap<Integer, Schedule>)request.getAttribute("scheduleMap");
	
%>
<script>

//피드페이징처리
var currentPage = 1;
var recordCountPerPage = 5;
var start = currentPage*recordCountPerPage - (recordCountPerPage-1);
var end = currentPage*recordCountPerPage;
var feedTotalCount = <%=feedList.size()%>;
var totalPage;

if (feedTotalCount % recordCountPerPage > 0) {
	totalPage = feedTotalCount / recordCountPerPage + 1;
	// ex) pageTotalCount = 108 / 5 + 1 -> 22 Page
} else {
	totalPage = feedTotalCount / recordCountPerPage + 0;
	// ex) pageTotalCount = 105 / 5 + 0 -> 21 Page
};


$(function(){
for(var i=start-1;i<end;i++){
			
	$('.bees-feed').eq(i).css('display','block'); }
	
	
	var height = $('#bees-contents').height();
	if(height<800){
	$('#bees-contents').css('height',(Number($(document).height())-220)+"px");
	}
	
	if('${requestScope.user}'!=null){
		if('${requestScope.user.userBlockYN}'=='Y'){
			alert("차단된 회원입니다.");
			history.back(-1);
		}
	}
	
});

$(window).scroll(function(){
if($(window).scrollTop()==($(document).height()-$(window).height())){
		       /*스크롤 끝까지 오면 이벤트*/
		       
		  if(currentPage<totalPage){
		    	setTimeout(function(){
		    	currentPage++;
		       start = currentPage*recordCountPerPage - (recordCountPerPage-1);
		       end = currentPage*recordCountPerPage;
		    
		       for(var i=start-1;i<end;i++){
					$('.bees-feed').eq(i).css('display','block');
					}
		    	}, 1000);
		  		}else{
		  			if($(document).height()>1200){
				  		alert("피드가 더이상 존재하지 않습니다.");
			  			}
		  		}
		  }
			
	});
</script>

	
	<div id="header">
		<%@include file="/include/headerBee.jsp" %>
	</div>	
	<div class="container pt-3">
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
							<!-- 비즈 메인페이지 외에는 삭제해주세요! -->
							<%} 
							}
							%>
							<%
							if(bees.getBeesPublicYN()=='Y'){
							if(user==null){
							if(userAuth!=null){%>
							<tr>
								<td id="join-box" colspan="2">
									<button id="join-btn" disabled="true">승인 대기중</button>
								</td>
							</tr>
							<%}else{%>
							<tr>
								<td id="join-box" colspan="2">
									<button id="join-btn">비즈 가입하기</button>
								</td>
							</tr>
							<%}
							}
							}else{
							} 
							%>
							<!-- 여기까지 삭제해주세요 -->
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
				<form action="/beesSearchOne.do?" method="get">
				<input type="hidden" name="beesNo" value="<%=bees.getBeesNo() %>"/>
				<input type="hidden" name="memberNo" value="<%=member.getMemberNo() %>"/>
				<div id="bees-search-bar">
					<%if(user==null){%>
						<input type="text" name="keyword" placeholder="비즈 회원만 검색이 가능합니다." disabled="true" style="background-color:white">
						<button type="button" disabled="true">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="dimgray" class="bi bi-search" viewBox="0 0 16 18">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
    </svg></button>
					<% }else{%>
						<input type="text" name="keyword" placeholder="글 내용, @작성자 검색" autocomplete="off">
						<button type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="dimgray" class="bi bi-search" viewBox="0 0 16 18">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
    </svg>
						</button>
					<%} %>
					</div>
					</form>
					<div id="bees-write-box">
						<div id="bees-typing-box">
							<span class="write-modal-btn">새로운 소식을 남겨보세요</span>
						</div>
						<div class="bees-function-box" style="margin-left: 10px;">
							<p class="bees-function-tag">사진</p>
							<span class="bees-function-icon"> <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="lightgray" class="write-modal-btn bi bi-image-fill" viewBox="0 0 16 16">
            <path d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2V3zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z" />
          </svg>
							</span>
						</div>
						<div class="bees-function-box">
							<p class="bees-function-tag">투표</p>
							<span class="bees-function-icon" style="margin-left: 10px"> <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="lightgray" class="write-modal-btn bi bi-bar-chart-line-fill" viewBox="0 0 16 16">
            <path d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2z" />
          </svg>
							</span>
						</div>
						<div class="bees-function-box">
							<p class="bees-function-tag">파일</p>
							<span class="bees-function-icon"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="lightgray" class="write-modal-btn bi bi-paperclip" viewBox="0 0 16 16">
            <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z" />
          </svg> </span>
						</div>
						<div class="bees-function-box">
							<p class="bees-function-tag">일정</p>
							<span class="bees-function-icon"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="lightgray" class="write-modal-btn bi bi-calendar-week" viewBox="0 0 16 16">
            <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
          </svg></span>
						</div>
					</div>
					<script>
					$('.write-modal-btn').click(function () {
						<%if(user!=null){ %>
						var setWrite = '<%=setting.getSetWrite()%>';
						var userClass = '<%=user.getUserClass() %>';
						
						if(setWrite=='user'){
							
							// 모달 크기 변경 //
							$.writeModalOpen();
							
						}else if(setWrite='manager'){
							
							// 모달 크기 변경 //
							$.writeModalOpen();
							
							if(userClass!='user'){
							alert("글쓰기 권한이 없습니다.");
							}else{
								$.writeModalOpen();
							}
						}else{
							if(userClass=='host'){
								
								// 모달 크기 변경 //
								$.writeModalOpen();
							}else{
								alert("글쓰기 권한이 없습니다.");
							}
						}
							
						<% }else{%>
						alert("비즈 회원이 아닙니다. 글쓰기 권한이 없습니다.");
						<%}%>
					})
					</script>
					<%
					if(bees.getBeesPublicYN()!='N' || user!=null){
						if(!(feedList.isEmpty())){
						for (int i = 0; i < feedList.size(); i++) {
							Feed feed = feedList.get(i);
							
					%>
					<div class="bees-feed" id="<%=feed.getBoardNo() %>">
					<div>
						<table class="feed-table">
							<tr>
								<td class="feed-writer-info" rowspan="2">
									<%if(feed.getProfileImg()==null){%>
									<div class="feed-writer-profile" style="background-image:url('/resources/image/user/profile_none.png')"></div>
									<%}else{ %>
									<div class="feed-writer-profile" style="background-image:url('/resources/image/profile/<%=feed.getProfileImg() %>')" onError="javascript:this.src='/resources/image/user/profile_none.png'"></div><%} %>
								</td>
								<td class="feed-writer-name"><%=feed.getUserName() %></td>
								<td class="feed-setting" rowspan="2">
								<%if(member.getMemberNo()==feed.getMemberNo()){%>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
        <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
    </svg><%} %>
								</td>
							</tr>
							<tr>
								<td class="feed-timestamp"><%=dateFormat.format(feed.getBoardDate()) %></td>
							</tr>
							<%if(member.getMemberNo()==feed.getMemberNo()){%>
							<tr style="visibility: hidden;">
							<td rowspan="1"></td>
								<td class="feed-navi" colspan="3">
									<div class="feed-navi-block">
										<div class="feed-modify" id="fm<%=feed.getBoardNo() %>">수정하기</div>
										<div class="feed-delete" id="fr<%=feed.getBoardNo() %>">삭제하기</div>
									</div>
								</td>
							</tr>
							<%} %>
							<tr>
								<td class="feed-cont" colspan="3">
									<div class="board-cont">
										<%if(feed.getBoardCont()==null){ %>
										<%}else{ %>
											<%=feed.getBoardCont()%>
										<%}%>
										<%if((imageMap.get(feed.getBoardNo()))!=null) {
										ArrayList<Image> imageList = imageMap.get(feed.getBoardNo());
									for(int j=0; j<imageList.size(); j++){
										Image image = imageList.get(j);
									%>
									<img src='/resources/image/bees/feedImage/<%=image.getChangeImageName() %>' style="margin:10px; max-width:80%;" >
									<%} 
									}%>
									</div>
									<% if(feed.getScheduleNo()>0) {
										
										if((scheduleMap.get(feed.getBoardNo()))!=null){
											Schedule sche = scheduleMap.get(feed.getBoardNo());
									%>
									<div class="sche-box">
										<div class="sche-icon-box">
											<div class="sche-icon"></div>
										</div>
										<div class="sche-cont-box" id="<%=sche.getScheduleNo() %>">
											<p class="sche-title"><%=sche.getScheduleTitle() %></p>
											<p class="sche-date"><%if(sche.getScheduleStartDate()!=null && sche.getScheduleEndDate()!=null){%>
												<%=scheFormat.format(sche.getScheduleStartDate()) %>  - <%= scheFormat.format(sche.getScheduleEndDate()) %>
												<% }else{
												if(sche.getScheduleStartDate()!=null){ %>
													<%=scheFormat.format(sche.getScheduleStartDate()) %>
												<%}else { %>
													<%=scheFormat.format(sche.getScheduleEndDate())  %>
												<%}
												}
												}%>
											</p>
										</div>
									</div>
									<%
									}%>
									<%if(feed.getFileNo()>0){
										if((fileMap.get(feed.getBoardNo()))!=null){
										BeesFile file = fileMap.get(feed.getBoardNo());
										
									%>
									<div class="file-box">
										<div class="file-icon-box">
											<div class="file-icon file-down-btn"></div>
										</div>
										<div class="file-cont-box">
											<p class="file-info file-down-btn">파일</p>
											<p class="file-title file-down-btn" id="<%=file.getFileNo() %>"><%=file.getOriginalFileName() %></p>
										</div>
									</div>
									<%}
									}
									//투표
									if(feed.getVoteNo()>0){
										
										if(!((voteMap.get(feed.getVoteNo()).isEmpty()))){
										ArrayList<FeedVote> voteList = voteMap.get(feed.getVoteNo());
										ArrayList voteItems = new ArrayList();
										FeedVote vote = null;
										HashMap <String, Integer> voteAnswer = new HashMap<String,Integer>();
										
										//voteList.size() = 총 답변의 수
										for(int k=0; k<voteList.size(); k++){
											vote = voteList.get(k);
											if(voteAnswer.get(vote.getVoteChoItem())==null){
												voteAnswer.put(vote.getVoteChoItem(),1);
											}else{
												int count = voteAnswer.get(vote.getVoteChoItem());
												count++;
												voteAnswer.put(vote.getVoteChoItem(),count);
											}
										}
										StringTokenizer st = new StringTokenizer(vote.getVoteItem(),",");
										for(int j=0; st.hasMoreTokens(); j++){
											voteItems.add(st.nextToken());
										}
										
									%>
										<div class="vote-box" id="all<%=voteList.size()%>">
											<div class="vote-title-box">
												<div class="vote-icon-box">
													<div class="vote-icon"></div>
												</div>
												<div class="vote-info-box">
													<p class="vote-state" name="<%=vote.getVoteEndYN() %>"><%
													if(vote.getVoteEndYN()=='N'){
													%>투표 진행중<%
													}else{
													%>투표 완료<%
													}
													%></p>
													<p class="vote-title"><%=vote.getVoteTitle() %></p>
												</div>
											</div>
											<!--투표 선택 바-->
											<%for(int j=0;j<voteItems.size();j++){
											
											String voteItem = String.valueOf(voteItems.get(j));
											
											%>
											<div class="vote-items-box">
												<div class="item-section" id="<%=voteItems.get(j) %>">
													<div class="item-select">
														<!-- check box-->
														<input type="checkbox" name="<%=voteItems.get(j) %>" style="display: none;">
														<label for="<%=voteItems.get(j) %>"> 
														<%if(vote.getVoteEndYN()=='N'){
															%><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="lightgray" class="item-select-btn bi bi-check-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" /><%
															}else{
															%><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="gray" class="item-select-btn bi bi-check-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" /><%
															}%>
														
                <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
            </svg>
														</label>
													</div>
													<div class="item-info">
														<div class="item-name"><%=voteItems.get(j) %></div>
														<div class="item-vote-num">
															<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="lightgray" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
            </svg>
															<span class="vote-num"><%if(voteAnswer.get(voteItems.get(j))==null){%>0
															<%}else{ %><%=voteAnswer.get(voteItems.get(j))%><%}%>
															</span>
														</div>
														<div class="item-vote-bar" id="<%=feed.getVoteNo() %>bar<%=j %>" >
															<!-- width: 투표 결과에 따라-->
															<%if(vote.getVoteEndYN()=='N'){
															%><p class="color-bar"></p><%
															}else{
															%><p class="color-bar" style="background-color:gray"></p><%
															}%>
															<p class="default-bar"></p>
														</div>
													</div>
												</div>
											</div>
											<script>
												var selector = "#"+<%=feed.getVoteNo() %>+'bar'+<%=j %>;
												var voteCount = $(selector).prev().find('.vote-num').html();
												var voteNum = Number(voteCount);
												var all = Number(($(selector).closest('.vote-box').attr('id')).replace("all",""));
												if(voteNum== '0'){
													$(selector).children('.color-bar').css('width',"0%");
												}else{
													$(selector).children('.color-bar').css('width',Math.round((voteNum/all)*100)+"%");
												}
											</script>
											<%} %>
											<div class="vote-footer">
												<hr>
												<center>
												<%if(user==null){
												if(vote.getVoteEndYN()=='N'){%>
												투표 권한이 없습니다.
												<%}else{%>
												종료된 투표입니다.
												<%}}else{ %>
												<%if(member.getMemberNo()!=vote.getMemberNo()){
													if(vote.getVoteEndYN()=='N'){%>
													<button class="vote-reset" type="reset">취소하기</button>
													<button class="vote-submit" type="submit">투표하기</button><%}else{%>
													종료된 투표입니다.
													<%}
													}else{%>
													<%if(vote.getVoteEndYN()=='N'){
													%><button class="vote-end" type="button" id="vn<%=vote.getVoteNo() %>">종료하기</button>
													<button class="vote-submit" type="submit">투표하기</button><%
													}else{
													%>종료된 투표입니다.<%
													}
													}
													}%>
												</center>
											</div>
										</div>
									<!--투표 끝-->
									<%}
						}//if %>
						
								</td>
							</tr>
							<tr>
								<td colspan="2" style="padding-left: 50px; font-size: 0.9rem; font-weight: 300; padding-top: 30px;">
									<%if(likeMap.get(feed.getBoardNo())==null){%>
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="lightgray" class="feed-like-btn bi bi-heart-fill" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" /> </svg>
        							<%}else{%>
        							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="feed-like-btn bi bi-heart-fill" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" /> </svg>
        							<%} %>
									<span class="feed-like-count"><%=feed.getLikeCount() %></span> 
									&nbsp;&nbsp; 댓글 
									<span class="comment-count"><%=feed.getCommentCount() %></span>
								</td>
								<td class="comment-box-btn" style="font-size: 0.9rem; font-weight: 300; padding-top: 30px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="comment-close bi bi-chevron-up" viewBox="0 0 15 15">
            <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z" />
        </svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="comment-open bi bi-chevron-down" viewBox="0 0 15 15">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
        </svg>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="padding-left: 35px; padding-right: 35px;">
									<hr>
								</td>
							</tr>
						</table>
						
						<table class="comment-table" id="c<%=feed.getBoardNo() %>">
						<%
							if(commentMap.get(feed.getBoardNo())!=null){
							
							ArrayList<FeedComment> commentList = commentMap.get(feed.getBoardNo());
							
							for(FeedComment comment : commentList){
							if(comment.getCommentDelYN()=='N'){%>
							<tr>
							<td rowspan="3" class="comment-writer">
							<%if(comment.getProfileImg()==null){
							%>
								<div class="comment-writer-profile" style="background-image:url('/resources/image/user/profile_none.png')"></div>
							<%}else{ %>
								<div class="comment-writer-profile" style="background-image:url('/resources/image/profile/<%=feed.getProfileImg() %>')" onError="javascript:this.src='/resources/image/user/profile_none.png'"></div>
								<%} %>
							</td>
							<td class="comment-writer-name"><%=comment.getUserName() %></td>
							</tr>
							<tr>
								<td class="comment-cont"><%=comment.getCommentCont() %></td>
							</tr>
							<tr>
								<td class="comment-date">
									<%=dateFormat.format(comment.getCommentDate()) %><%if(user!=null){ %><span class="recomment-btn">답글쓰기</span><%} if(member.getMemberNo()==comment.getMemberNo() ){%><span class="comment-modify-btn"> 수정하기 </span> <span class="comment-del-btn" id="cd<%=comment.getCommentNo()%>"> 삭제하기 </span><%} %>
								</td>
							</tr>
							
							<tr class="recomment-write-box">
								<!--attr로 display 속성 없애기-->
								<td>
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6D6042" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
        </svg>						<div class="recomment-input-box">
									<input class="recomment-input-text" type="text" placeholder="답글을 남겨주세요">
									<span>1/200</span>
									</div>
									<input class="recomment-submit-btn" type="submit" value="보내기" id="rn<%=comment.getCommentNo() %>">
									<button class="recomment-reset-btn" type="button">취소</button>
								</td>
							</tr>
							<!--수정하기-->
							<tr class="comment-textarea">
								<td>
									<textarea class="comment-cont-modify"><%=comment.getCommentCont() %></textarea>
								</td>
							</tr>
							<tr class="comment-textarea-btn">
								<td>
									<input class="comment-modify-reset-btn" type="reset" value="취소">
									<input class="comment-modify-submit-btn" id="mc<%=comment.getCommentNo() %>" type="submit" value="저장">
									<p class="comment-modify-count">1/200</p>
								</td>
							</tr>
							<!--수정하기-->
							<%}else{%>
							<tr>
							<td rowspan="3" class="comment-writer">
									<div class="comment-writer-profile" style="background-image:url('/resources/image/user/profile_none.png')"></div>
								</td>
							
							<td class="comment-writer-name"></td>
							</tr>
							<tr>
								<td class="comment-cont">삭제된 댓글입니다.</td>
							</tr>
							<tr>
								<td class="comment-date">
								</td>
							</tr>
							<tr class="recomment-write-box">
								<!--attr로 display 속성 없애기-->
								<td>
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6D6042" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
        </svg>						<div class="recomment-input-box">
									<input class="recomment-input-text" type="text" placeholder="답글을 남겨주세요">
									<span>1/200</span>
									</div>
									<input class="recomment-submit-btn" type="submit" value="보내기" id="rn<%=comment.getCommentNo() %>">
									<button class="recomment-reset-btn" type="button">취소</button>
								</td>
							</tr>
							<!--수정하기-->
							<tr class="comment-textarea">
								<td>
									<textarea class="comment-cont-modify"><%=comment.getCommentCont() %></textarea>
								</td>
							</tr>
							<tr class="comment-textarea-btn">
								<td>
									<input class="comment-modify-reset-btn" type="reset" value="취소">
									<input class="comment-modify-submit-btn" id="mc<%=comment.getCommentNo() %>" type="submit" value="저장">
									<p class="comment-modify-count">1/200</p>
								</td>
							</tr>
							
							
							<%}
							
							if(recommentMap.get(comment.getCommentNo())!=null){
							
								ArrayList<FeedComment> recommentList = recommentMap.get(comment.getCommentNo());
								
								for(FeedComment recomment : recommentList){
									if(recomment.getCommentDelYN()=='N'){%>
							
							<tr>
								<td rowspan="2"></td>
								<td class="recomment-cont">
									<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z" />
									</svg>
									<span class="recomment-writer-name" style="margin-right:10px;"><%=recomment.getUserName() %></span><span class="recomment-text" style="margin-right:40px;">
									<%=recomment.getCommentCont() %>
									</span>
								</td>
							</tr>
							<tr>
								<td class="recomment-date">
									<%=dateFormat.format(recomment.getCommentDate()) %>&nbsp;&nbsp;<%if(member.getMemberNo()==recomment.getMemberNo()){%><span class="recomment-modify-btn"> 수정하기 </span> <span class="recomment-del-btn" id="cd<%=recomment.getCommentNo()%>"> 삭제하기 </span><%} %>
								</td>
							</tr>
							<tr class="recomment-write-box">
								<!--attr로 display 속성 없애기-->
								<td>
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6D6042" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
        </svg>						<div class="recomment-input-box">
									<input class="recomment-input-text" type="text" placeholder="답글을 남겨주세요">
									<span>1/200</span>
									</div>
									<input class="recomment-submit-btn" type="submit" value="보내기" id="rn<%=comment.getCommentNo() %>">
									<button class="recomment-reset-btn" type="button">취소</button>
								</td>
							</tr>
							<!-- 대댓글 수정하기 -->
							<tr class="recomment-textarea">
							<td></td>
								<td>
									<textarea class="recomment-cont-modify"><%=recomment.getCommentCont() %></textarea>
								</td>
							</tr>
							<tr class="recomment-textarea-btn">
							<td></td>
								<td>
									<input class="recomment-modify-reset-btn" type="reset" value="취소">
									<input class="recomment-modify-submit-btn" id="mc<%=recomment.getCommentNo() %>" type="submit" value="저장">
									<p class="recomment-modify-count">1/200</p>
								</td>
							</tr>
							<%}else{%>
							<tr>
								<td rowspan="2"></td>
								<td class="recomment-cont">
									<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z" />
									</svg>
									<span class="recomment-writer-name" style="margin-right:10px;"></span><span class="recomment-text" style="margin-right:40px;">
									삭제된 댓글입니다.
									</span>
								</td>
							</tr>
							<tr>
								<td class="recomment-date">
								</td>
							</tr>
							<tr class="recomment-write-box">
								<!--attr로 display 속성 없애기-->
								<td>
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6D6042" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
        </svg>						<div class="recomment-input-box">
									<input class="recomment-input-text" type="text" placeholder="답글을 남겨주세요">
									<span>1/200</span>
									</div>
									<input class="recomment-submit-btn" type="submit" value="보내기" id="rn<%=comment.getCommentNo() %>">
									<button class="recomment-reset-btn" type="button">취소</button>
								</td>
							</tr>
							<!-- 대댓글 수정하기 -->
							<tr class="recomment-textarea">
							<td></td>
								<td>
									<textarea class="recomment-cont-modify"><%=recomment.getCommentCont() %></textarea>
								</td>
							</tr>
							<tr class="recomment-textarea-btn">
							<td></td>
								<td>
									<input class="recomment-modify-reset-btn" type="reset" value="취소">
									<input class="recomment-modify-submit-btn" id="mc<%=recomment.getCommentNo() %>" type="submit" value="저장">
									<p class="recomment-modify-count">1/200</p>
								</td>
							</tr>
							<%
							}
							}//대댓글//대댓글전체
							}//지우지
							}//마
							}%>
							<!-- 테이블 양식  -->
							<tr style="visible:hidden; height:0px;">
							<td rowspan="3" class="comment-writer" style="visible:hidden;">
								</td>
								<td class="comment-writer-name"></td>
							</tr>
							<tr style="visible:hidden; height:0px;">
								<td class="comment-cont"></td>
							</tr>
							<tr style="visible:hidden; height:0px;">
								<td class="comment-date"></td>
							</tr>
							<!-- 끝 -->
							<tr>
								<td class="comment-write-box" colspan="3">
									<div>
									<%if(user!=null){
									if(setting.getSetComment().equals("user")){%>
									<input class="comment-input-box" type="text" placeholder="댓글을 남겨주세요">
									<%}else if(setting.getSetComment().equals("manager")){
									if(!(user.getUserClass().equals("user"))){%>
									<input class="comment-input-box" type="text" placeholder="댓글을 남겨주세요">
									<%}else{%>
									<input class="comment-input-box" type="text" placeholder="댓글 작성 권한이 없습니다." disabled="true" style="background-color:white;">	
									<%}
									}else if(setting.getSetComment().equals("host")){
									if((user.getUserClass().equals("host"))){%>
									<input class="comment-input-box" type="text" placeholder="댓글을 남겨주세요">
									<%}else{%>
									<input class="comment-input-box" type="text" placeholder="댓글 작성 권한이 없습니다." disabled="true" style="background-color:white;">	
									<%}
									}
									}else{%>
									<input class="comment-input-box" type="text" placeholder="댓글 작성 권한이 없습니다." disabled="true" style="background-color:white;">
									<%}%>
									<span>1/200</span>
									</div>
									<input class="comment-submit-btn" type="button" value="보내기">
								</td>
							</tr>
						</table>
						</div>
					</div>
					<%
					}
					}else if(feedList.isEmpty()&&user!=null){%>
					<div style="text-align:center; margin-top:30px; margin-bottom:30px; width:100%; height:500px; background-color:white; font-size:1.2rem; font-weight:200; color:dimgray; padding-top:200px; box-shadow: 1px 1px 2px rgb(230, 230, 230);">
					게시글이 존재하지 않습니다.<br>
					<%=user.getUserName()%> 님 게시글을 남겨주세요!
					</div>	
					<%}
					}else if(user==null){// user==null%>
					<div style="text-align:center; margin-top:30px; margin-bottom:30px; width:100%; height:500px; background-color:white; font-size:1.2rem; font-weight:200; color:dimgray; padding-top:200px; box-shadow: 1px 1px 2px rgb(230, 230, 230);">
					비즈의 회원이 아닙니다.<br>
					<%=member.getMemberName() %>님, 비즈에 가입하여 글을 남겨주세요! <br>
					</div>
					<%}else{%>
					<div style="text-align:center; margin-top:30px; margin-bottom:30px; width:100%; height:500px; background-color:white; font-size:1.2rem; font-weight:200; color:dimgray; padding-top:200px; box-shadow: 1px 1px 2px rgb(230, 230, 230);">
					비공개 비즈입니다.<br>
					비즈 회원만 게시글을 조회할 수 있습니다.<br>
					</div>
					<%} %>
					<script>
					//투표 처리하는 ajax;
					$('.vote-submit').click(function(){
		var state = $(this).parent().parent().parent().find('.vote-state').attr('name');
		if(state!='Y'){
		var items = $(this).parent().parent().parent().find('.item-select-btn');
		console.log(items.length);
		var boardNo = $(this).closest('.bees-feed').attr('id');
		var memberNo = ${sessionScope.member.memberNo};
		var selectItem;
		$(items).each(function(index, item){
			if($(item).attr('fill')!='lightgray'){
				selectItem = $(this).parent().prev().attr('name');
				$.ajax({
					url:"/voteInsertItem.do",
					type:"get",
					data:{"selectItem":selectItem,"boardNo":boardNo,"memberNo":memberNo},
					success:function(data){
						if(data>0){
						var selector = '#'+selectItem;
						var voteNum = Number($(selector).find('.vote-num').html())+1;
						$(selector).find('.vote-num').html(Number(voteNum));
						var all = Number(($(selector).closest('.vote-box').attr('id')).replace("all",""));
						$(selector).find('.color-bar').css('width', Math.round((voteNum/(all+1))*100)+"%");
						location.reload();
						}else{
							alert("투표가 진행되지 않았습니다. 다시 진행해주세요.");
						}
						var labels = $('.vote-box').find('.item-select-btn');
						labels.attr('fill','lightgray');
					},
					error:function(){
					}
				});
			}
		})
		
		}else if(state=='Y'){
			alert("이미 완료된 투표입니다.");
		}
		
	})
	
	
	$('.vote-end').click(function(){
		var voteNoV = $(this).attr('id');
		var voteNo = voteNoV.replace("vn","")
		if(confirm('투표를 종료하시겠습니까?')){
		$.ajax({
		url:"/voteEnd.do",
		data:{"voteNo":voteNo},
		success:function(data){
			if(data>0){
				alert("종료되었습니다.");
				var selector = '#vn'+voteNo;
				$(selector).parent().parent().parent().find('.item-select-btn').attr('fill','gray');
				$(selector).parent().parent().parent().find('.color-bar').css('background-color','gray');
				$(selector).prev().css('display','none');
				$(selector).css('display','none');
				$(selector).parent().html('<center>종료된 투표입니다.</center>');
				location.reload();
			}else{
			}
		},
		error:function(){
		}
		});
		}
	})
			$('.comment-submit-btn').click(function(){
				var commentCont = $(this).prev().children().eq('0').val();
				var memberNo = ${sessionScope.member.memberNo};
				var boardNo = $(this).closest('.bees-feed').attr('id');
				var beesNo = ${requestScope.bees.beesNo};
				$.ajax({
					url:"/insertComment.do",
					type:"get",
					data:{"commentCont":commentCont,"memberNo":memberNo,"boardNo":boardNo},
					success:function(data){
						if(data>0){
							alert("댓글이 성공적으로 등록되었습니다.");
							location.reload();
						}else{
							alert("댓글 등록에 실패하였습니다. ");
							location.reload();
						}
					},
					error:function(){
					}
				})
			})
			$('.recomment-submit-btn').click(function(){
				var commentCont = $(this).prev().children().eq('0').val();
				var memberNo = ${sessionScope.member.memberNo};
				var recommentNo = ($(this).attr('id')).replace("rn","");
				var boardNo = $(this).closest('.bees-feed').attr('id');
				$.ajax({
					url:"/insertRecomment.do",
					type:"get",
					data:{"commentCont":commentCont,"memberNo":memberNo,"boardNo":boardNo, "recommentNo":recommentNo},
					success:function(data){
						if(data>0){
							alert("댓글이 성공적으로 등록되었습니다.");
							location.reload();
						}else{
							alert("댓글 등록에 실패하였습니다. ");
							location.reload();
						}
					},
					error:function(){
					}
				})
			})
			$('.feed-delete').click(function() {
			
			if (confirm("피드를 정말 삭제하시겠습니까?")) {
				$('.feed-navi').parent().css('visibility', 'hidden');
				var boardNo = $(this).closest('.bees-feed').attr('id');
				console.log(boardNo);
				// 삭제하는 로직 구현
				$.ajax({
					url:"/deleteFeed.do",
					data:{"boardNo":boardNo},
					type:"post",
					success:function(data){
						
						if(data>0){
							alert("게시글이 성공적으로 삭제되었습니다.");
							location.reload();
						}else{
							alert("게시글 삭제에 실패하였습니다. ");
							location.reload();
						}
						
					},
					error:function(){
						
					}
				})

			}

				})
			</script>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<script>		
	
		$('.feed-like-btn').click(
				function() {
					var boardNo = $(this).closest('.bees-feed').attr('id');
					var memberNo = ${sessionScope.member.memberNo};
					if ($(this).attr('fill') == 'red') {
						$.ajax({
							url : "/deleteBoardLike.do",
							data : {
								"boardNo" : boardNo,
								"memberNo" : memberNo
							},
							success : function(data) {
								if (data > 0) {
									
								} else {
									alert("다시 시도해주세요");
								}

							},
							error : function() {

							}
						})
						$(this).attr('fill', 'lightgray');
						$(this).next().html(Number($(this).next().html()) - 1);

					} else if ($(this).attr('fill') == 'lightgray') {

						$.ajax({
							url : "/insertBoardLike.do",
							data : {
								"boardNo" : boardNo,
								"memberNo" : memberNo
							},
							success : function(data) {

								if (data > 0) {
									
								} else {
									alert("다시 시도해주세요");
								}

							},
							error : function() {

							}
							
						})
						// 좋아요 추가하는 로직
						$(this).attr('fill', 'red');
						$(this).next().html(Number($(this).next().html()) + 1);
					}
					
				});
	</script>
	<!--글쓰기 모달-->
	<!--form태그로 묶임. -->
	<!--모달 부분 -->
	<form>
		<div id="write-modal-bg"></div>
		<div id="write-modal">
			<div id="write-modal-header">
				<span style="margin-left: 30px;">글쓰기</span>
				<button id="write-modal-close" type="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16">
                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
				</button>
			</div>
			<div id="write-modal-cont">
				<div id="write-modal-cont-div" contentEditable="true"></div>
				<textarea style="display: none"></textarea>
			</div>
			<div id="write-modal-footer">
				<div class="write-function-box">
					<p class="write-function-tag">사진</p>
					<span class="write-function-icon"> <form id="inputImageForm" method="post" enctype="multipart/form-data" style="display:none;"><input type="file" style="display: none;" name="image[]" id="input-image" multiple="multiple"><input type="hidden" name="imageNo" id="input-imageNo"></form><label for="input-image"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="gray" class="bi bi-image-fill" viewBox="0 0 16 16">
                    <path d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2V3zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z" />
                </svg> </label>
					</span>
				</div>
				<div class="write-function-box">
					<p class="write-function-tag">투표</p>
					<span class="write-function-icon"> <svg id="vote-modal-btn" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="gray" class="bi bi-bar-chart-line-fill" viewBox="0 0 16 16">
                    <path d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2z" />
                </svg>
					</span>
				</div>
				<div class="write-function-box">
					<p class="write-function-tag">파일</p>
					<span class="write-function-icon"><form id="inputFileForm" method="post" enctype="multipart/form-data" style="display:none;"><input type="file" style="display: none" id="input-file" name="file"></form><label for="input-file"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="gray" class="bi bi-paperclip" viewBox="0 0 16 16">
                    <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z" />
                </svg> </label>
					</span>
				</div>
				<div class="write-function-box">
					<p class="write-function-tag">일정</p>
					<span class="write-function-icon"> <svg id="sche-modal-btn" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="gray" class="bi bi-calendar-week" viewBox="0 0 16 16">
                    <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                </svg></span>
				</div>
				<button id="write-modal-submit" type="button" name="0">게시</button>
			</div>
		</div>
		<div id="dual-modal-bg"></div>
		<div id="vote-modal">
			<div id="vote-modal-header">
				<span style="margin-left: 50px;">투표</span>
				<button id="vote-modal-close" type="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16">
                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
				</button>
			</div>
			<div id="vote-modal-cont" style="text-align: center;">
				<input type="text" class="vote-modal-title" placeholder="투표 제목">
				<br>
				<input type="text" class="vote-modal-items" placeholder="항목 입력">
				<input type="button" class="item-del-btn" value=" " disabled="true">
				<br>
				<input type="text" class="vote-modal-items" placeholder="항목 입력">
				<input type="button" class="item-del-btn" value=" " disabled="true">
				<br> <span id="vote-modal-items-message" style="display: none; font-size: 0.7rem; color: rgb(247, 64, 64); position: absolute; left: 50%;">투표 항목은 2개 이상이어야 합니다.</span>
				<button id="item-add-btn" type="button" style="padding: 20px 0px 10px 0; margin-right: 240px; background-color: transparent; border: 0px solid white; font-size: 0.9rem; font-weight: 200;">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#6D6042" class="bi bi-plus" viewBox="0 0 16 16">
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
            </svg>
					항목 추가
				</button>
				<div id="vote-setting" style="width: 100%; height: 40px; text-align: left; margin-bottom: 10px;">
					<input type="checkbox" id="anonymous-selection" style="display: none;">
					<label for="anonymous-selection" style="padding-left: 22px;"> <svg class="anonymous-btn" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="lightgray" class="item-select-btn bi bi-check-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
            </svg> <span style="font-size: 0.9rem; font-weight: 300;">무기명 투표</span><br>
					</label>
				</div>
			</div>
			<div id="vote-modal-footer">
				<button id="vote-modal-submit" type="button">게시</button>
			</div>
		</div>
		<div id="sche-modal">
			<div id="sche-modal-header">
				<span style="margin-left: 50px;">일정 등록하기</span>
				<button id="sche-modal-close" type="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16">
                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
				</button>
			</div>
			<div id="sche-modal-cont" style="text-align: center;">
				<table>
					<tr>
						<td colspan="2">
							<input id="sche-modal-title" type="text" placeholder="일정 제목">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea id="sche-modal-note" placeholder="일정 설명"></textarea>
						</td>
					</tr>
					<tr style="height: 15px; font-size: 0.9rem;">
						<td>시작</td>
						<td>종료</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 5px;">
							<input id="sche-start-date" type="date">
						</td>
						<td style="text-align: left; padding-left: 5px;">
							<input id="sche-end-date" type="date">
						</td>
					</tr>
				</table>
			</div>
			<div id="sche-modal-footer">
				<button id="sche-modal-submit" type="button">완료</button>
			</div>
		</div>
	</form>
	<script>
	$('.file-down-btn').click(function(){
		var fileName = $('.file-title').html();
		var fileNo = $('.file-title').attr('id');
		if(confirm(fileName+"을 다운로드 하시겠습니까?")){
			$.ajax({
				url:"/downloadBeesFile.do",
				data:{"fileNo":fileNo},
				type:"POST",
				beforeSend : function(xhr){
				xhr.setRequestHeader("Authorization", window.localStorage['accessToken']);
				},
				success: function(data, status, xhr) {
					var filename = xhr.getResponseHeader("Filename");
					var _blob = new Blob([data], {type : 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'});
					var link = document.createElement('a');
					link.href = window.URL.createObjectURL(_blob);
					link.download = filename;
					link.click();
					
					
					},
				error: function() {
					console.log("error");
				}
			})
		}
			
	});
	
	
	$.insertSchedule = function(boardNo, scheduleNo){
		var scheduleTitle = $('#sche-modal-title').val();
		var scheduleCont = $('#sche-modal-note').val();
		var scheduleStartDate = $('#sche-start-date').val()+" 00:00:00";
		var scheduleEndDate=$('#sche-end-date').val()+" 00:00:00";
		console.log(scheduleStartDate);
		var userNo = 0;
		<% if(user==null){%>
		userNo = 0;
		<%}else{%>
		userNo = ${requestScope.user.userNo};
		<%}%>
		var beesNo = ${requestScope.bees.beesNo};
		$.ajax({
			url:"/insertSchedule.do",
			data:{"scheduleTitle":scheduleTitle,
				"boardNo":boardNo,
				"scheduleNo":scheduleNo,
				"scheduleCont":scheduleCont, 
				"scheduleStartDate":scheduleStartDate, 
				"scheduleEndDate":scheduleEndDate,
				"userNo":userNo,
				"beesNo":beesNo},
			type:"post",
			success:function(data){
				console.log("일정등록완료");
			},
			error:function(data){
				
			}
			
		})
		
		
	};
	
	$.insertVote = function(boardNo, voteNo){
		
		var modalItemArr = new Array();
		
		$('.vote-modal-items').each(function(){

		    if($(this).val()!=''){
		        modalItemArr.push($(this).val());
		    }
		 })

		var voteTitle = $('.vote-modal-title').val(); 
		var voteItem;// DB에 들어가는 String 
		var votePublicYN = 'N';
		var beesNo = ${requestScope.bees.beesNo};
		
		if($('.anonymous-btn').attr('fill')!='lightgray'){
			votePublicYN = 'Y';
		}
		
		$(modalItemArr).each(function(index, item){
			
			if(index==0){
				voteItem = item+",";
			}else if(index<modalItemArr.length-1){
				voteItem = voteItem+item+",";
			}else if(index==modalItemArr.length-1){
				voteItem = voteItem+item;
			}
			
		})
		
		$.ajax({
			url:"/insertVote.do",
			data:{"voteTitle":voteTitle, "voteItem":voteItem, "votePublicYN":votePublicYN, "beesNo":beesNo, "boardNo":boardNo, "voteNo":voteNo},
			type:"post",
			success:function(data){
				console.log("투표등록성공");
			},
			error: function(){
				
			}
			
		})
		
		
	};
	
	
	$.insertImage = function(boardNo){
		
		var formData = new FormData();
		var filesLength=document.getElementById('input-image').files.length;
		for(var i=0;i<filesLength;i++){
			formData.append("image[]", document.getElementById('input-image').files[i]);
		}
		
		var imageList=document.getElementById('input-imageNo').value;
		console.log(imageList);
		formData.append("imageList",imageList);
		formData.append("boardNo",boardNo);
		
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',	// 필수
			url: '/uploadBeesImages.do',
			dataType:'json',
			data: formData,		// 필수
			processData: false,	// 필수
			contentType: false,	// 필수
			cache: false,
			success: function (result) {
			},
			error: function (e) {
			}
		});
		 

		
		
	}
	
	$.insertFile = function(boardNo, fileNo){
		
		var formData = new FormData($('#inputFileForm')[0]); 
		formData.append("fileNo",fileNo);
		formData.append("boardNo",boardNo);
		
		
		$.ajax({ 
			type: "POST", 
			enctype: 'multipart/form-data',
			url: '/uploadBeesFile.do',
			data: formData,
			processData: false,
			contentType: false,
			cache: false,
			success: function (data){ 
				
				if(data>0){
					console.log('파일 업로드 완료');
				}
			},
			error: function (e) { } 
			
		});
		
	}
	
	
	
	$('#input-file').change(function(){
		$('#write-modal-submit').attr('name','file');
	})
	
	$('#input-image').change(function(){
		$('#write-modal-submit').attr('name','image');
	})
	
	
	
	$('#write-modal-submit').click(function(){
		
		var boardCont = $('#write-modal-cont-div').html();
		
		var memberNo = ${sessionScope.member.memberNo};
		var beesNo = ${requestScope.bees.beesNo};
		var beesFunction = $('#write-modal-submit').attr('name');
		var imageCount = 0;
		if(beesFunction=='image'){
			imageCount=document.getElementById('input-image').files.length;
		}
		console.log(imageCount);
		$.ajax({
			url:"/insertBoard.do",
			data:{"boardCont":boardCont, "memberNo":memberNo, "beesNo":beesNo, "beesFunction":beesFunction, "imageCount":imageCount},
			type:"post",
			success:function(data){
				
				if(data[0]!=null){
					
					console.log(beesFunction);
					
					if(beesFunction=='vote'){
						$.insertVote(data[0].boardNo, data[0].voteNo);
					}else if(beesFunction=='schedule'){
						$.insertSchedule(data[0].boardNo, data[0].scheduleNo);
					}else if(beesFunction=='file'){
						$.insertFile(data[0].boardNo, data[0].fileNo);
					}else if(beesFunction=='image'){
						$('#input-imageNo').val(data[1]);
						$.insertImage(data[0].boardNo);
					}else{
					}
					
					location.reload();
					
				}else{
					
				}
				
			},
			error:function(){
				
			}
			
		})
		
		
	});
	</script>
	<!--일정 모달 끝-->
	<!--전체 모달 거대한 form태그로 묶기-->
	<!--글 수정 모달 -->
	<form>
		<div id="modify-modal-bg"></div>
		<div id="modify-modal">
			<div id="modify-modal-header">
				<span style="margin-left: 30px;">글 수정하기</span>
				<button id="modify-modal-close"  type="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16">
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                    </svg>
				</button>
			</div>
			<div id="modify-modal-cont">
				<div id="modify-modal-cont-div" contentEditable="true"></div>
				<textarea style="display: none"></textarea>
			</div>
			<div id="modify-modal-footer">
				<div class="modify-function-box">
					<p class="modify-function-tag">사진</p>
					<span class="modify-function-icon"> <input type="file" style="display: none;" id="modify-input-image" multiple> <label><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="gray" class="bi bi-image-fill" viewBox="0 0 16 16">
                            <path d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2V3zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z" />
                        </svg> </label>
					</span>
				</div>
				<div class="modify-function-box">
					<p class="modify-function-tag">투표</p>
					<span class="modify-function-icon"> <svg id="modify-vote-modal-btn" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="gray" class="bi bi-bar-chart-line-fill" viewBox="0 0 16 16">
                            <path d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2z" />
                        </svg>
					</span>
				</div>
				<div class="modify-function-box">
					<p class="modify-function-tag">파일</p>
					<span class="modify-function-icon"> <input type="file" style="display: none" id="modify-input-file"> <label><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="gray" class="bi bi-paperclip" viewBox="0 0 16 16">
                            <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z" />
                        </svg> </label>
					</span>
				</div>
				<div class="modify-function-box">
					<p class="modify-function-tag">일정</p>
					<span class="modify-function-icon"> <svg id="modify-sche-modal-btn" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="gray" class="bi bi-calendar-week" viewBox="0 0 16 16">
                            <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                        </svg></span>
				</div>
				<button id="modify-modal-submit" type="button">수정</button>
				<input id="modify-del-function" type="hidden" value="-1"/>
				<input id="modify-image-del-function" type="hidden"/>
			</div>
		</div>
	</form>
	<script>
	

	
	
	$('#modify-modal-submit').click(function(){
		
		var boardCont = ($('#modify-modal-cont-div').html());
		var boardNo = ($('#modify-modal').attr('name'));
		var delFunction = $('#modify-del-function').val();
		var imageArr = (($('#modify-image-del-function').val()).replace(/undefined/g,"")).split(',');
		var delImage = "";
		
		$(imageArr).each(function(index, item){
			
			if(index==0){
				delImage = item+",";
			}else if(index<imageArr.length-1){
				delImage = delImage+item+",";
			}else if(index==imageArr.length-1){
				delImage = delImage+item;
			}
			
		})
		
		$.ajax({
			url:"/updateBoard.do",
			data:{"boardCont":boardCont,"boardNo":boardNo,"delFunction":delFunction,"delImage":delImage},
			type:"POST",
			success:function(data){
				if(data>0){
					alert("피드 수정이 완료되었습니다.");
					location.reload();
				}else{
					alert("수정에 실패하였습니다.");
					location.reload();
				}
				
			},
			error:function(){
				
			}
		})
		
		
		
	})
	</script>
	<!--수정 모달 -->
	<!--상세일정모달 부분 -->
	<div id="feed-modal-bg"></div>
	<div id="sche-detail-modal">
		<div id="sche-detail-modal-header">
			<button id="sche-detail-modal-close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16">
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                </svg>
			</button>
		</div>
		<form>
			<div id="sche-detail-modal-cont">
				<div id="sche-detail-title"></div>
				<div id="sche-detail-date"></div>
				<div id="sche-detail-writer-info">
					<div id="sche-detail-writer-profile"></div>
					<span></span>
				</div>
				<div id="sche-detail-note"></div>
			</div>
			<div id="sche-detail-modal-footer"></div>
		</form>
	</div>
	<!--상세일정 모달부분-->
	<!--비즈가입 부분 -->
    <!---->
    <div id="join-modal-bg"></div>
    <form>
    <div id="join-modal">
        <div id="join-modal-header">
            <span style="margin-left: 70px;">비즈 가입하기</span>
            <button id="join-modal-close" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#F7D078" class="bi bi-x"
                    viewBox="0 0 16 16">
                    <path
                        d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </button>
        </div>
        <div id="join-modal-cont" style="text-align: center;">
        	<p style="color: #6d6042;font-size: 1rem;font-weight: 500; margin-top:20px; height:auto;" ><%=bees.getBeesName() %></p>
        	<p style="color: #6d6042;font-size: 0.9rem;font-weight: 300; margin-top:-10px; padding:0px;">이 비즈에서 사용할 이름을 입력해주세요</p>
            <input id="join-modal-name" type="text" placeholder="이름을 입력해주세요" maxlength="10" autocomplete="off"><br>
        </div>
        <div id="join-modal-footer">
            <button id="join-modal-submit" type="button">비즈 가입하기</button>
        </div>
    </div>
    </form>
    <!--모달 끝 form태그로 묶어야함. -->
	<div id="footer">
	<%@include file="/common/footer.jsp"%>
	</div>
<script>
//가입은 메인 페이지에서만 가능
$.joinMember = function(userName, memberNo, beesNo){
	$.ajax({
		url:"/insertBeesUser.do",
		type:"POST",
		data:{"userName":userName,"memberNo":memberNo,"beesNo":beesNo},
		success:function(data){
			if(data>0){
				alert("가입 신청이 완료되었습니다. 관리자 승인시 가입이 완료됩니다.");
				location.reload();
			}else{
				alert("가입에 실패하였습니다.");
				location.reload();
			}
		},
		error:function(){
		}
	});
};

$('#join-modal-submit').click(function(){

	var userName = $('#join-modal-name').val();
	var beesUserLimit = ${requestScope.bees.beesUserLimit};
	var memberNo = ${sessionScope.member.memberNo};
	var mBirth = '${sessionScope.member.memberBirth}';
	var memberBirth =Number(mBirth.substring(0,4));
	var beesNo = ${requestScope.bees.beesNo};
	var beesMaxBirth = ${requestScope.bees.beesMaxBirth};
	var beesMinBirth = ${requestScope.bees.beesMinBirth};
	var beesGender='${requestScope.bees.beesGender}';
	var userCount = ${requestScope.userCount};
	var memberGender = '${sessionScope.member.memberGender}';
	
	if(beesUserLimit==0){
		if(beesGender=='N'){ // 성별 제한 없고 
			if(beesMaxBirth!=0){ //최대나이는 제한 있음 
				if(beesMinBirth!=0){ //최소도 제한 있음. 
					if(memberBirth<=beesMinBirth){ //최대 + 최소 (최소 점검)
						if(memberBirth>=beesMaxBirth){//최대 + 최소 (최대 점검)
							$.joinMember(userName, memberNo, beesNo);
						}else{ //최대 나이 안맞을때 
							alert("가입 가능 연령이 아닙니다.");
						}
					}else{ //최소 나이 안맞을때 
						alert("가입 가능 연령이 아닙니다.");
					}
				}else{//최대 있고 최소 나이 없음 
					if(memberBirth>=beesMaxBirth){//최대 (최대 점검)
						$.joinMember(userName, memberNo, beesNo);
					}else{ //최대 나이 안맞을때 
						alert("가입 가능 연령이 아닙니다.");
					}
				}
				}else if(beesMinBirth!=0){//최대 없고 최소 있음
				if(memberBirth<=beesMinBirth){//최소점검
					$.joinMember(userName, memberNo, beesNo);
				}else{//최소 안맞음
					alert("가입 가능 연령이 아닙니다.");
				}
			}else{//나이 제한 성별제한 없음
				$.joinMember(userName, memberNo, beesNo);
			}
		}else{// 성별 제한있음 
			if(beesGender==memberGender){ //성별 같을때 
				if(beesMaxBirth!=0){ //최대 나이 제한 있음
					if(beesMinBirth!=0){ //최소 나이 제한 있음
						if(memberBirth<=beesMinBirth){ //최소+최대 최소점검
							if(memberBirth>=beesMaxBirth){ //최소+최대 최대까지 맞음
								$.joinMember(userName, memberNo, beesNo);
							}else{//최소 최대 최대안맞음
								alert("가입 가능 연령이 아닙니다.");
							}
						}else{//최소 최대 최소 안맞음
							alert("가입 가능 연령이 아닙니다.");
						}
					}else{//최대 제한만 있음
						if(memberBirth>=beesMaxBirth){//최대 조건 맞음
							$.joinMember(userName, memberNo, beesNo);
						}else{//최대 조건 안맞음
							alert("가입 가능 연령이 아닙니다.");
						}
					}
				}else if(beesMinBirth!=0){
					if(memberBirth<=beesMinBirth){
						$.joinMember(userName, memberNo, beesNo);
					}else{
						alert("가입 가능 연령이 아닙니다.");
					}
				}else{//나이 조건 없음
					$.joinMember(userName, memberNo, beesNo);
				}
			}else{
				alert("가입 가능 성별이 아닙니다.");
			}
		}
	}else{//beesUserLimit !=0
		if(beesGender=='N'){ // 성별 제한 없고 
			if(beesMaxBirth!=0){ //최대나이는 제한 있음 
				if(beesMinBirth!=0){ //최소도 제한 있음. 
					if(memberBirth<=beesMinBirth){ //최대 + 최소 (최소 점검)
						if(memberBirth>=beesMaxBirth){//최대 + 최소 (최대 점검)
							$.joinMember(userName, memberNo, beesNo);
						}else{ //최대 나이 안맞을때 
							alert("가입 가능 연령이 아닙니다.");
						}
					}else{ //최소 나이 안맞을때 
						alert("가입 가능 연령이 아닙니다.");
					}
				}else{//최대 있고 최소 나이 없음 
					if(memberBirth>=beesMaxBirth){//최대 (최대 점검)
						$.joinMember(userName, memberNo, beesNo);
					}else{ //최대 나이 안맞을때 
						alert("가입 가능 연령이 아닙니다.");
					}
				}
				}else if(beesMinBirth!=0){//최대 없고 최소 있음
				if(memberBirth<=beesMinBirth){//최소점검
					$.joinMember(userName, memberNo, beesNo);
				}else{//최소 안맞음
					alert("가입 가능 연령이 아닙니다.");
				}
			}else{//나이 제한 성별제한 없음
				$.joinMember(userName, memberNo, beesNo);
			}
		}else{// 성별 제한있음 
			if(beesGender==memberGender){ //성별 같을때 
				if(beesMaxBirth!=0){ //최대 나이 제한 있음
					if(beesMinBirth!=0){ //최소 나이 제한 있음
						if(memberBirth<=beesMinBirth){ //최소+최대 최소점검
							if(memberBirth>=beesMaxBirth){ //최소+최대 최대까지 맞음
								$.joinMember(userName, memberNo, beesNo);
							}else{//최소 최대 최대안맞음
								alert("가입 가능 연령이 아닙니다.");
							}
						}else{//최소 최대 최소 안맞음
							alert("가입 가능 연령이 아닙니다.");
						}
					}else{//최대 제한만 있음
						if(memberBirth>=beesMaxBirth){//최대 조건 맞음
							$.joinMember(userName, memberNo, beesNo);
						}else{//최대 조건 안맞음
							alert("가입 가능 연령이 아닙니다.");
						}
					}
				}else if(beesMinBirth!=0){
					if(memberBirth<=beesMinBirth){
						$.joinMember(userName, memberNo, beesNo);
					}else{
						alert("가입 가능 연령이 아닙니다.");
					}
				}else{//나이 조건 없음
					$.joinMember(userName, memberNo, beesNo);
				}
			}else{
				alert("가입 가능 성별이 아닙니다.");
			}
		}
	}
});


</script>
</body>
</html>