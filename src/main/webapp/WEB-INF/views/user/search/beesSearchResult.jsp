<%@page import="java.text.DecimalFormat"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.BeesUserCount"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bee 로그인</title>
<%@ include file="/common/cdnLib.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/beesSearchResult.css">
</head>

<body>
	<%
	Member m = (Member)session.getAttribute("member");
	ArrayList<BeesUserCount> resultBees = (ArrayList<BeesUserCount>) request.getAttribute("resultBees");
	ArrayList<Bees> myBees = (ArrayList<Bees>) request.getAttribute("myBees");
	DecimalFormat formatter = new DecimalFormat("###,###");
	int endNo = (int) request.getAttribute("endNo");
	String searchData = (String) request.getAttribute("searchData");
	%>
	<%@include file="/include/headerUser.jsp" %>
    
	<div class="container pt-3">
		<div class="row">
			<div class="col-1">
			</div>
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
							<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=m.getMemberNo()%>">
								<div class="m-auto beesImage" style="width:30px; height:30px;
								background: url('<%=beesCover %>') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
						<div class="col-12 col-md-9 py-2 px-0">
							<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=m.getMemberNo()%>" class="myBees"><%=b.getBeesName() %></a>
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
			<div class="col-7 p-0">
				<div id="main-content" class="container m-0 p-0">
					<div class="row mt-2 m-0">
						<div class="col-12">
							<span id="main-content-title">'<%=searchData %>' 검색 결과 (비즈)</span>
							<a class="categoryBtn btn ml-3" href="#">비즈 검색</a>
							<a class="categoryBtn btn" href="/feedSearchResult.do?keyword=<%=searchData %>">게시글 검색</a>
						</div>
					</div>
					<div class="row m-0">
						<!-- 반복 -->
						<%if(!resultBees.isEmpty()) {
							if(resultBees.size() < endNo-10) {
								for(BeesUserCount b : resultBees) {
									String coverPath = b.getBeesCover();	
									String beesCover = null;
					    			if(coverPath.endsWith("_bee")){
					    			beesCover = "/resources/image/beeCreateProfile/"+coverPath;
					    			}else{
					    			beesCover = coverPath;
					    			}
								
								%>
									<div class="d-none d-md-block col-md-2 p-1 py-3">
										<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=m.getMemberNo()%>">
											<div class="m-auto beesImage" style="width:60px; height:60px;
											background: url('<%=beesCover%>') no-repeat;
											background-size: cover;">
											</div>
										</a>
									</div>
									<div class="col-6 col-md-4 py-2 px-0">
										<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=m.getMemberNo()%>" class="recommend"><%=b.getBeesName() %></a>
										<span class="recommendCategory"><%=b.getBeesCategory() %></span>
										<br>
										<span class="beesInfo">비즈장 : <%=b.getBeesHost() %></span><br>
										<span class="beesInfo">인원수 : <%=formatter.format(b.getBeesUserCount()) %>명</span>
									</div>
							<% 	}
							} else {
								for(int i=0; i < endNo-10; i++) {
									BeesUserCount b = resultBees.get(i);
									String coverPath = b.getBeesCover();	
									String beesCover = null;
					    			if(coverPath.endsWith("_bee")){
					    			beesCover = "/resources/image/beeCreateProfile/"+coverPath;
					    			}else{
					    			beesCover = coverPath;
					    			}
							%>
									<div class="d-none d-md-block col-md-2 p-1 py-3">
										<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=m.getMemberNo()%>">
											<div class="m-auto beesImage" style="width:60px; height:60px;
											background: url('<%=beesCover %>') no-repeat;
											background-size: cover;">
											</div>
										</a>
									</div>
									<div class="col-6 col-md-4 py-2 px-0">
										<a href="/beesSelectOne.do?beesNo=<%=b.getBeesNo() %>&memberNo=<%=m.getMemberNo()%>" class="recommend"><%=b.getBeesName() %></a>
										<span class="recommendCategory"><%=b.getBeesCategory() %></span>
										<br>
										<span class="beesInfo">비즈장 : <%=b.getBeesHost() %></span><br>
										<span class="beesInfo">인원수 : <%=formatter.format(b.getBeesUserCount()) %>명</span>
									</div>
						<% 		}
							}
						} %>
					</div>
					
					<%if (resultBees.size() > endNo-10) { %>
					<div class="row mt-3 m-0">
						<div class="col-12">
							<a id="moreView" class="viewMoreBtn btn w-100 py-2" href="/beesSearchResult.do?searchData=<%=searchData %>&endNo=<%=endNo%>">+ 더보기</a>
						</div>
					</div>
					<% } else if (resultBees.isEmpty()){ %>
					<div style="text-align:center; margin-top:30px; margin-bottom:30px; width:100%; height:620px; background-color:white; font-size:1.2rem; font-weight:200; color:dimgray; padding-top:250px; box-shadow: 1px 1px 2px rgb(230, 230, 230);">
					<%=searchData %>와 관련된 비즈가 존재하지 않습니다.<br>
					<%= m.getMemberName() %>님, <%=searchData %>에 관련된 비즈를 개설해보세요!<br>
					</div>
					<%} %>
					
				</div>
			</div>
			<div class="col-1">
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
	<script type="text/javascript" src="/resources/js/index.js"></script>
	<script>
	var higth = $("body").height();
	if(higth<754){
	   $("#footer").css('position','absolute').css('bottom','0');
	}
	</script>
</body>
</html>