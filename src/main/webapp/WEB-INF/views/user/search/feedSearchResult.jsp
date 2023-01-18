<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="com.fourmeeting.bee.image.model.vo.Image"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Locale"%>
<%@page import="com.fourmeeting.bee.board.model.vo.Feed"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.keyword} 검색결과 | bees</title>
</head>
<body>
	<%@ include file="/common/cdnLib.jsp"%>
	<link rel="stylesheet" type="text/css" href="/resources/css/feedSearchResult.css">
<%
	Member member = (Member)session.getAttribute("member");
	ArrayList<Feed> feedList = (ArrayList<Feed>)request.getAttribute("feedList");
	ArrayList<Bees> myBees = (ArrayList<Bees>) request.getAttribute("beesList");
	ArrayList<Integer> beesNoList = (ArrayList<Integer>) request.getAttribute("beesNoList");
	String keyword = (String)request.getAttribute("keyword");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일", Locale.KOREA);
	HashMap<Integer,Integer> likeMap = (HashMap <Integer,Integer>)request.getAttribute("likeMap");
	HashMap<Integer, ArrayList<Image>> imageMap = (HashMap<Integer, ArrayList<Image>>)request.getAttribute("imageMap");
	
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
			
	$('.search-feed').eq(i).css('display','block');
			
}
	
});

$(function(){
	var height = $('#main-container').height();
	if(height<800){
	$('#main-container').css('height',(Number($(document).height())-220)+"px");
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
					$('.search-feed').eq(i).css('display','block');
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
			
			
			<div class="col-7 p-0" id="main-container">
			<div id="main-content" class="container m-0 p-0">
			<div class="row mt-2 m-0">
						<div class="col-12">
							<span id="main-content-title">'<%=keyword %>' 검색 결과 (<%=feedList.size() %>)</span>
							<a class="categoryBtn btn ml-3" href="/beesSearchResult.do?searchData=<%=keyword %>&endNo=10">비즈 검색</a>
							<a class="categoryBtn btn" href="/feedSearchResult.do?keyword=<%=keyword %>">게시글 검색</a>
						</div>
					</div>
					<%
					if(!(feedList.isEmpty())){
					for(int i=0; i<feedList.size(); i++){ 
							
						Feed feed = feedList.get(i);
						
						String beesName = null;
						if(feed.getBeesName().length()>15){
							beesName=feed.getBeesName().substring(0,15);
						}else{
							beesName=feed.getBeesName();
						}
						String maintext="";
						if(feed.getBoardCont()==null){
						maintext="";
						}else{
							if(feed.getBoardCont().length()>150){
							//maintext = feed.getBoardCont().substring(0,150)+"...";
							maintext = feed.getBoardCont();
							}else{
							maintext = feed.getBoardCont();
							}
						}
						
					%>
					<div class="search-feed" id="<%=feed.getBoardNo() %>">
						<div class="search-feed-cont">
							<div class="search-feed-title">
								<a class="search-feed-bees-name"  href="/beesSelectOne.do?beesNo=<%=feed.getBeesNo() %>&memberNo=<%=feed.getMemberNo() %>"><%=beesName %></a> <i class="fas fa-angle-left"></i> <span class="search-feed-writer"><%=feed.getUserName() %></span> <span class="search-feed-date"><%=dateFormat.format(feed.getBoardDate()) %></span>
							</div>
							<div class="search-feed-main">
								<div class="search-feed-maintext"><%=maintext %></div>
							</div>
							<div class="search-feed-footer">
								<span class="search-feed-like-btn" style="line-height: 20px; font-weight: 600; padding-left: 20px;"> 
								<%if(likeMap.get(feed.getBoardNo())==null){
									if((beesNoList.indexOf(feed.getBeesNo()))<0){%>
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="dimgray" class="none-like-btn bi bi-heart-fill" viewBox="0 0 16 16">
							        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" /> </svg>
								<%}else{%>
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="lightgray" class="feed-like-btn bi bi-heart-fill" viewBox="0 0 16 16">
       								 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" /> </svg>
        							<%}}else{%>
        							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="feed-like-btn bi bi-heart-fill" viewBox="0 0 16 16">
       								 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" /> </svg>
        							<%}%>
								</span> <span class="search-feed-like-count"><%=feed.getLikeCount() %></span> &nbsp;&nbsp; 댓글 <span class="search-feed-comment-count"><%=feed.getCommentCount() %></span>
							</div>
						</div>
						<div class="search-feed-image" class="col-4">
						<%if((imageMap.get(feed.getBoardNo()))!=null) {
										ArrayList<Image> imageList = imageMap.get(feed.getBoardNo());
										Image image = imageList.get(0);
							%>
								<center>
								<img src="/resources/image/bees/feedImage/<%=image.getChangeImageName() %>" style="max-width:80%; max-height:80%; padding:5px;">
								</center><% 
							}%>
						</div>
					</div>
					<%}
					}else{%>
					<div style="text-align:center; margin-top:30px; margin-bottom:30px; width:100%; height:620px; background-color:white; font-size:1.2rem; font-weight:200; color:dimgray; padding-top:250px; box-shadow: 1px 1px 2px rgb(230, 230, 230);">
					게시글이 존재하지 않습니다.<br>
					<%= member.getMemberName() %>님, <%=keyword %>에 관련된 글을 작성해보세요!<br>
					</div>
					<%}%>
					</div>
				</div>
			
		<div class="col-1"></div>
	</div>
</div>
</div>
</div>
		
	<div id="footer">
	<%@include file="/common/footer.jsp"%>
	</div>
	
	<script>
				$('.none-like-btn').click(function(){
					alert("해당 비즈의 가입회원이 아닙니다.");
				});
				
				$('.feed-like-btn').click( function() {
					
					var boardNo = $(this).closest('.search-feed').attr('id');
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
						$(this).parent().next().html(Number($(this).parent().next().html()) - 1);

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
						
						$(this).attr('fill', 'red');
						$(this).parent().next().html(Number($(this).parent().next().html()) + 1);
					}
				
				});
				</script>
</body>
</html>