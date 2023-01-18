<%@page import="com.fourmeeting.bee.bees.model.vo.BeesAdmin"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/common/cdnLib.jsp"%>
	
	<!-- 반응형 웹에 필요한 소스 -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- 폰트어썸 CDN -->	
	<!-- reference your copy Font Awesome here (from our CDN or by hosting yourself) -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">


<style>
		
	body{
		font-family: 'Noto Sans KR', sans-serif;
		height: 100%;
	}
	
	.container{
		width: 100%;
		height: 100%;
		background-color: white;
	}
	
	.beesManagement_div p{
		font-size: 1.5rem;
		font-weight: 600;
		color: #50401B;
	}
	
	.beesManagement_table{
		width: 100%;
		border: 1px solid #ededed;
		text-align: center;
		color: #50401B;
	}
	
	.beesManagement_table tr th{
		padding: 7px 20px;
		background-color: #fff3d8;
	}
	
	.beesManagement_table tr td{
		padding: 5px 20px;
		height: 40px;
	}
	
	
	/* 삭제 or 복구 */
	.dees_del_y_btn{
		color: white;
		background-color: #50401B;
		border-radius: 25px;
		width: 80px;
		height: 27px;
		font-weight: 500;
		font-size: 0.85rem;
		line-height: 15px;
		border: 0;
	}
	
	.dees_del_n_btn{
		color: #50401B;
		background-color: #F7D078;
		border-radius: 25px;
		width: 80px;
		height: 27px;
		font-weight: 500;
		font-size: 0.85rem;
		line-height: 15px;
		border: 0;
	}
	
	.dees_del_y_btn, .dees_del_n_btn:focus{
		outline: none;
	}
	
	
		/*검색바---------------------------------------------------------------------*/
	.search_bar {
	background-color: #F7D078;
	margin-top: 15px;
	height: 60px;
}

#search_title {
	font-size: 1.5rem;
	color: #50401B;
	font-weight: bold;
	margin-top: 20px;
}

#main-content div {
	box-sizing: border-box;
	border: 0;
	padding: 0;
	display: inline-block;
	float: left;
}

#main-content form {
	width: 100%;
}

.search_bar input {
	display: inline-block;
	border-radius: 30px;
	height: 38px;
	margin: 11px 10px;
	padding-left: 20px;
	padding-right: 15px;
	width: 90%;
	border: none;
}

.search_bar input:focus {
	outline: none;
}

#search_btn {
	width: 45px;
	height: 35px;
	background-color: white;
	border: none;
	border-radius: 100px;
	float: right;
	margin: 11px 10px 11px 0;
}

#search_btn img {
	width: 70%;
	height: 70%;
}

#search_btn:focus {
	outline: none;
}

.search_bar select {
	border-radius: 30px;
	height: 38px;
	display: inline-block;
	margin: 11px 10px;
	width: 90%;
	border: none;
	padding-left: 10px;
	padding-right: 15px;
}

.search_bar select:focus {
	outline: none;
}

#main-content div {
	display: inline-block;
}

.admin_header {
	width: 100%;
}

.search_bar_table{
	width: 100%;
	margin-top: 10px;
}

/* #footer{
	position: absolute;
	bottom: 0;
} */

#pageNavi{
	text-align: center;
	padding: 30px auto;
	margin: 30px auto;
	
}

#pageNavi a{
	text-decoration: none;
	color: #50401B;
	font-size: 1.1rem;
}
	
</style>

	<%
		ArrayList<BeesAdmin> baList = (ArrayList<BeesAdmin>)request.getAttribute("baList");
		String sb = (String)request.getAttribute("sb");
	%>


	<script>
		
		$(function(){
			
			//footer위치조절
			var higth = $("body").height();
			if(higth<754){
				$("#footer").css('position','absolute').css('bottom','0');
			}
			
			
			if($(".dees_del_yn_btn").val()=="복구"){
				$(this).css('color','red');
			}
			
			$(".answer_yn_btn").click(function(){
				
				//누르면 모달창 떠서 답변 글 작성 하기
				//if 답변 정상적으로 등록되면 버튼 바뀌기 
				$(this).css('background-color','#F7D078').css('border','0').val("답변완료");
				
			});
			
			//폐쇄 버튼 클릭시
			$(".dees_del_n_btn").click(function(){
				
				var beesNo = $(this).nextAll(".beesNo").val();
				
				var result = confirm("정말 삭제하시겠습니까?");
					if(result){
						//bees 삭제 
					 	$.ajax({
							url : "/beesDelete.do",
							data : {"beesNo" : beesNo}, //key:value
							type : "post",
							success: function(data){
								if(data==0){
									window.location.reload();
								}else{
									alert("실패");				
								}
							},
							error : function(data){
								alert("실패");
							}
						}); 
					} 
				
			});
			
			
			//복구 버튼 클릭시
			$(".dees_del_y_btn").click(function(){
				var beesNo = $(this).nextAll(".beesNo").val();
				
				var result = confirm("정말 복구 하시겠습니까?");
					if(result){
						//bees 삭제 
					 	$.ajax({
							url : "/beesRollback.do",
							data : {"beesNo" : beesNo}, //key:value
							type : "post",
							success: function(data){
								if(data==0){
									window.location.reload();
								}else{
									alert("실패");				
								}
							},
							error : function(data){
								alert("실패");
							}
						}); 
					} 
			});
			
		});
	
	</script>

	<%@include file="/include/headerAdmin.jsp" %>

	<!-- 검색바 -->
	<div class="container pt-4">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<span id="search_title">모임관리</span>

				<form action="/adminBeesSearch.do" method="post">
					<table class="search_bar_table">
						<tr>
							<td class="search_bar"><input type="date" name="startDate"></td>
							<td class="search_bar"><input type="date" name="endDate"></td>
							<td class="search_bar">
								<select name="searchSelect">
									<option value="1">전체보기</option>
									<option value="2">카테고리</option>
									<option value="3">비즈이름</option>
									<option value="4">비즈장ID</option>
								</select>
							</td>
							<td class="search_bar">
								<input type="text" style="width: 90%;" autocomplete="off" name="search">
							</td>
							<td class="search_bar">
								<button type="submit" id="search_btn">
									<img src="resources/image/search.png" />
								</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<!-- container -->

		<div class="container pt-3">
			<div class="row">
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
				<div class="col-10 beesManagement_div">
					<table border="1" class="beesManagement_table">
						<tr>
							<th>카테고리</th>
							<th>비즈이름</th>
							<th>비즈장ID</th>
							<th>회원수</th>
							<th>개설일자</th>
							<th>폐쇄일자</th>
							<th>폐쇄/복구</th>
						</tr>
						<%if(!baList.isEmpty()){ %>
							<%for(BeesAdmin ba : baList){ %>
								<tr>
									<td><%=ba.getBeesCategory() %></td>
									<td><%=ba.getBeesName() %></td>
									<td><%=ba.getBeesHost() %></td>
									<td><%=ba.getMemberCount() %></td>
									<td>
										<%SimpleDateFormat sdFormat = new SimpleDateFormat("yy.MM.dd"); %>
										<%=sdFormat.format(ba.getBeesDate()) %>
									</td>
									<td>
										<%if(ba.getBeesDelDate()!=null){ %>
											<%=sdFormat.format(ba.getBeesDelDate()) %>
										<%}else{ %>
											-
										<%} %>
									</td>
									<td>
										<%if(ba.getBeesDelYN()=='N') {%>
											<input type="button" value="폐쇄" class="dees_del_n_btn">
										<%}else{ %>
											<input type="button" value="복구" class="dees_del_y_btn">
										<%} %>
										<input type="hidden" class="beesNo" value="<%=ba.getBeesNo()%>"/>
									</td>
								</tr>
							<%} %>
						<%}else{ %>
							<tr>
								<td colspan="7" style="color:gray; height:50px;">등록된 bees가 없습니다.</td>
							</tr>
						<%} %>
					</table>
					
					<!-- 페이징 처리 -->
					<div id="pageNavi"><%=sb %></div>
					
				</div>
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
			</div>
		</div>
		<div><%@include file="/common/footer.jsp" %></div>

</body>
</html>