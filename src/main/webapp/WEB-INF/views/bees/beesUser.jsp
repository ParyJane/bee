<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fourmeeting.bee.beesuser.model.vo.BeesUserList" %>
<%@ page import="com.fourmeeting.bee.beesuser.model.vo.BeesUser" %>
<%@page import="com.fourmeeting.bee.bees.model.vo.Setting"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bees 멤버</title>

</head>
<body>
	<%@ include file="/common/cdnLib.jsp"%>
	
	<!--비즈 전체페이지 + 사이드 프로필 + 메인 컨텐츠 크기-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesForm.css">
	<script type="text/javascript" src="/resources/js/beesForm.js"></script>
	

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



	//memberPage 들어왔을 때 보이는 멤버 목록 List 
	ArrayList<BeesUserList> list = (ArrayList<BeesUserList>)request.getAttribute("list"); 
	ArrayList<BeesUserList> WaitersList = (ArrayList<BeesUserList>)request.getAttribute("WaitersList"); 	
	
	String keyword = (String)request.getAttribute("keyword");
	if(keyword==null)keyword="";
	
	String option = (String)request.getAttribute("option");
	if(option==null)option="user_name";
	
  	System.out.println("==================================");
  	System.out.println(option);
  	

	BeesUser BU = (BeesUser)session.getAttribute("BeesUser");

%>



<link rel="stylesheet" type="text/css" href="resources/css/beesMember.css">
<style>
#notFound{
color : #50401B;
font-size : 0.9rem;
width : 100%;
margin-top : 10%;
margin-left : 33%;
margin-bottom : 10%;

}

#memberList-outline{
 margin-top : 15%;
}

.memberListImg{
	width: 38px;
	height: 38px;
	background-color: #ffd6e1;
	border-radius: 999px;
	float: left;
}

#host{
background-color : #50401B;
margin-left : 1.5%;
color : white;
font-size : 0.6rem;
padding :0.6%;
padding-left : 1%;
padding-right : 1%;
border-radius: 25px;
}
#memberList-outline{
width : 100%;
overflow:scroll;
}
.memberList{
height : 10%;
}

#all{
padding-bottom : 12%;
height : 100%;
}
#bees-contents{
padding-bottom : 100px;
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
							<!-- 비즈 메인페이지 외에는 삭제해주세요! -->
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
				
				
				
				
				
			
			<div class="col-7 p-0 ">
				<div id="bees-contents" class="container m-0 p-2">
				<div class="row"  id="feed">
						<div class="col-md-12" id="feed-top">멤버 <b><%= list.size() %></b></div>
						<form action="/beesUserSearch.do" method="post" id="search-outLine">
						<div class="col-md-12">
						<input type="text" id="search" placeholder="&nbsp;&nbsp;&nbsp;멤버검색" name="keyword" value='<%=keyword%>'/><button type="submit" id="searchBtn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-zoom-in" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
  <path d="M10.344 11.742c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1 6.538 6.538 0 0 1-1.398 1.4z"/>
  <path fill-rule="evenodd" d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5z"/>
</svg></button>
					</form>	
						
				
			<%System.out.println("비즈 :"+ BU.getUserClass()); %>
			
			<%if(BU.getUserClass().equals("manager") || BU.getUserClass().equals("host") ){ %>
						<div id="applicant"><a href="/beesApplicant.do">가입 신청자 <span><%= WaitersList.size() %></span> ></a> </div>
			<%} %>		
			
					<%--
						<script>
							$(function(){
								var test = $('#applicant').children().children('span').text(su);
								var su = <%= WaitersList.size() %>;
							alert(su);
							})
						</script>
						 --%>
						<div class="col-md-12" id="line3"></div>
						<div class="col-md-12" id="search-select">
	
						<select id="memberListSort" name="Opt">
						
							<%if(option.equals("user_name")){ %>
							
							 <option value="user_name" name="user_name" selected>이름순</option>
							<option value="user_auth_date" name="user_auth_date">가입일순</option>
							<%}else{ %>
							<option value="user_name" name="user_name" >이름순</option>
							<option value="user_auth_date" name="user_auth_date" selected>가입일순</option>
							<%} %>
						</select></div>
						 
	
						</div>
							<script>
							
							
							$(function(){
									$('#memberListSort').change(function(){

										var option = $('#memberListSort').val();
										var keyword = $('#search').val();

										location.replace("/beesUserSearch.do?keyword="+keyword+"&option="+option);
										
										
									});
									
									});
							</script>
							
							
								<!--  
									
										*/
										$(function(){
								
								
								$('#memberListSort').change(function(){
									//var option = $('#memberListSort option').val();
									var option = $(this).val();
									console.log(option);
								
									
									$.ajax({
										url : "beesMember.do",
										type: "post",
										data : {"option":option},
										success : function(){
											
										},
										error : function(){
											alert("ajax통신실패")
										}
									});
									
									
									
									
									
							})
							})
							/* 		
										//var option = $(this).children().val();
										var option = $('#memberListSort').val();
										var keyword = $('#search').val();
										
										console.log(option);
										console.log(keyword);
										
										$.ajax({
											url : "/beesUserSearch.do",
											type: "post",
											data : {"keyword":keyword,"option" : option},
											success : function(){
												
											},
											error : function(){
												alert("ajax통신실패")
											}
										});
										*/
									 -->
							
						
						
							
						<div class="row" id="memberList-outline">
						
						
						<%if(!list.isEmpty()){ %>
						
						<!-- memberPage 열렸을 때 보이는 memberList -->
						<%for(BeesUserList BUList : list){ %>
							<div class="col-md-12 p-0, memberList" >
							<img onError="this.src='/resources/image/user/profile_none.png'" src="/resources/image/profile/<%= BUList.getProfileImg() %>" class="memberListImg"/><%= BUList.getUserName() %> <span> <%= BUList.getMemberId() %></span>
							
							<% if(BUList.getUserClass().equals("host") ){%>
								<span id="host">호스트 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg></span>
								
							<%} %>
							
							</div>  
						<%} %>
						<%}else{ %>
						  <div class="col-md-12 p-0" id="notFound">입력하신 멤버에 대한 정보가 없습니다.</div>
						<%} %>
					   
						
						<!-- memberPage에서 검색했을 시 열리는 memberList -->
						
						<%-- 
						<% if(SearchList != null && !SearchList.isEmpty()){ %>
						
							<%for(BeesUserList BUList : SearchList){ %>
								<div class="col-md-12 p-0, memberList" ><img src="/resources/image/p6.png" class="memberListImg"/><%= BUList.getUserName() %> <span> <%= BUList.getMemberId() %></span></div>  
							<%} %>
							
							 
						<%}else{%>
							 <div>입력하신 멤버에 대한 정보가 없습니다.</div>
							<%=SearchList %>
							<%=list%>
						<%} %>
					   
					--%>
						
						</div>
						
						
						<div class="col-md-12" id="line3"></div>
						<div class="col-md-12" id="memberInviteBtn"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg><a href="/inviteMember.do" id="memberInvite">멤버 초대하기</a></div>
					</div>
    
				
				</div>
				
			</div>	
		</div>	
		
	</div>	
			
		<script>
			$(function(){
				//footer위치조절
				var higth = $("body").height();
				if(higth<754){
				   $("#footer").css('position','absolute').css('bottom','0');
				}
			})
		</script>
	<div id="footer">
	<%@include file="/common/footer.jsp"%>
	</div>

	
</body>
</html>


