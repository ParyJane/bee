<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.fourmeeting.bee.schedule.model.vo.Schedule"%>
<%@page import="com.fourmeeting.bee.file.model.vo.BeesFile"%>
<%@page import="com.fourmeeting.bee.image.model.vo.Image"%>
<%@page import="com.fourmeeting.bee.vote.model.vo.FeedVote"%>
<%@page import="com.fourmeeting.bee.comment.model.vo.FeedComment"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fourmeeting.bee.board.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 비즈 소식 | bee</title>
</head>
<body>

<%@ include file="/common/cdnLib.jsp"%>
	<link rel="stylesheet" type="text/css" href="/common/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/myBeesPage.css">
	<script type="text/javascript" src="/resources/js/myBeesPage.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/beesModifyModal.css">
	<script type="text/javascript" src="/resources/js/beesModifyModal.js"></script>

<%
	Member member = (Member)session.getAttribute("member");
	ArrayList<Feed> feedList = (ArrayList<Feed>)request.getAttribute("feedList");
	ArrayList<Bees> myBees = (ArrayList<Bees>) request.getAttribute("beesList");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 a KK시 mm분", Locale.KOREA);
	SimpleDateFormat scheFormat = new SimpleDateFormat("yyyy년 MM월 dd일 (E)", Locale.KOREA);
	
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
			
	$('.bees-feed').eq(i).css('display','block');
			
}

	
});

$(function(){
	var height = $('#myBeesFeed').height();
	if(height<800){
	$('#myBeesFeed').css('height',(Number($(document).height())-220)+"px");
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
	<div>
	<%@include file="/include/headerUser.jsp" %>
	</div>
	<div class="container pt-3">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3 p-0">
				<div id="sub-content" class="container p-2 w-75 m-auto">
					<div class="row m-0">
						<div class="col-12">
							<span id="sub-content-title">My Bees</span>
						</div>
					</div>
					<div class="row m-0">
						<div class="col-12">
							<hr class="my-1">
						</div>
					</div>
					<!-- 반복 -->
					<%
					

					if(!myBees.isEmpty()) {
						for(Bees b : myBees) {
					
	   				String coverPath = b.getBeesCover();	
					String beesCover = null;
	    			if(coverPath.endsWith("_bee")){
	    			beesCover = "/resources/image/beeCreateProfile/"+coverPath;
	    			}else{
	    			beesCover = coverPath;
	    				}
						 
					%>
					<div class="row m-0">
						<div class="d-none d-md-block col-md-3 p-1">
							<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=member.getMemberNo()%>">
								<div class="m-auto beesImage" style="width:30px; height:30px;
								background: url('<%=beesCover %>') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
						<div class="col-12 col-md-9 py-2 px-0">
							<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=member.getMemberNo()%>" class="myBees"><%=b.getBeesName() %></a>
						</div>
					</div>
					<% 		}
						} %>
					
					<div class="row m-0">
						<div class="col-12 py-2">
							<a class="makeBeesBtn btn w-100 py-2" href="/beeCreateMain.do">+ 비즈 만들기</a>
						</div>
					</div>
				</div>
				
			</div>
			<div class="col-7 p-0 m-0" id="myBeesFeed">
						<span id="main-content-title">내 비즈 소식</span>
					<%
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
								<td class="feed-writer-name"><%=feed.getUserName() %> <i class="fas fa-angle-right"></i> <a class="feed-bees-name" href="/beesSelectOne.do?beesNo=<%=feed.getBeesNo() %>&memberNo=<%=member.getMemberNo() %>"><%=feed.getBeesName() %></a> </td>
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
									<div>
									<% if(feed.getScheduleNo()>0) {
										Schedule sche = scheduleMap.get(feed.getBoardNo());
										if(sche!=null){
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
									<%} %>
									<%if(feed.getFileNo()>0){
										BeesFile file = fileMap.get(feed.getBoardNo());
										if(file!=null){
									%>
									<div class="file-box">
										<div class="file-icon-box">
											<div class="file-icon"></div>
										</div>
										<div class="file-cont-box">
											<p class="file-info">파일</p>
											<p class="file-title"><%=file.getOriginalFileName() %></p>
										</div>
									</div>
									<%}
									}
									//투표
									if(feed.getVoteNo()>0){
										
										ArrayList<FeedVote> voteList = voteMap.get(feed.getVoteNo());
										if(!(voteList.isEmpty())){
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
									<%=dateFormat.format(comment.getCommentDate()) %><span class="recomment-btn">답글쓰기</span><% if(member.getMemberNo()==comment.getMemberNo() ){%><span class="comment-modify-btn"> 수정하기 </span> <span class="comment-del-btn" id="cd<%=comment.getCommentNo()%>"> 삭제하기 </span><%} %>
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
									<input class="comment-input-box" type="text" placeholder="댓글을 남겨주세요">
									<span>1/200</span>
									</div>
									<input class="comment-submit-btn" type="button" value="보내기">
								</td>
							</tr>
						</table>
						</div>
					</div>
					<%}// if(=null)
						}// bees-feed }// bees-feed 
						else{%>
					<div style="text-align:center; margin-top:30px; margin-bottom:60px; width:100%; height:620px; background-color:white; font-size:1.2rem; font-weight:200; color:dimgray; padding-top:250px; box-shadow: 1px 1px 2px rgb(230, 230, 230);">
					가입된 비즈가 없습니다.<br>
					<%=member.getMemberName() %>님, 비즈에 가입하여 글을 남겨주세요! <br>
					</div>
					<%} %>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		<div>
		<%@include file="/common/footer.jsp"%>
		</div>
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
								if (data>0) {
									
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

								if (data>0) {
									
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
	<!--전체 모달 거대한 form태그로 묶기-->
	<!--글 수정 모달 -->
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
	<!--상세일정 모달부분-->
	<!--비즈가입 부분 -->
    <!---->

</body>
</html>
