<%@page import="java.util.TreeSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@page import="com.fourmeeting.bee.comment.model.vo.MyComment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴 댓글 | bee</title>
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
			background-color: #f9f9f9;
		}
		
		.container{
			width: 100%;
			height: 100%;
		}
		
		/* 내 정보 네비바 */
		.mypage_navi_div{
			padding: 0;
		}
		
		#mypage_navi_ul{
			width: 75%;
			height: 300px;
			list-style-type: none;
			margin: 20px auto;
			padding: 0px;
		}
		
		#mypage_navi_ul a{
 			text-decoration: none;
			color : #50401B;
			display: block; /*a태그를 li영역 전체로 잡기 위함*/
			position: relative;
		}
		
		#mypage_navi_ul li{
		 	border: 1px solid #ededed;
		 	padding: 10px;
		 	background-color: white;
		}
		
		#mypage_navi_ul li i{
			color : #50401B;
			position: absolute;
			left: 95%;
			top: 20%;
		}
		
		
		/* 내가 쓴 글 피드 */
		.myhistroy_div{
			width: 100%;
			height: auto;
			margin: 20px auto;
		}
		
		.myhistroy_table tr th{
			padding: 10px 20px;
			background-color: #dedede;
			position: relative;
		}
		
		.myhistroy_table tr th > select{
			color : #50401B;
			position: absolute;
			right: 5%;
			top: 17%;
		}
		
		select:focus{
			outline: none;
		}
			
		.myhistroy_categories td{
			width: 50%;
			padding: 10px 0px;
			text-align: center;
			position: relative;
		}
		
		.myhistroy_categories td a{
			text-decoration: none;
			color : #50401B;
			display: block; /*a태그를 영역 전체로 잡기 위함*/
		}
		
		.myhistroy_categories_underbar td:nth-child(2){ /*댓글 아래 언더바*/
		 	background-color: #50401B;
		 	height: 2px;
		}
		
		.myhistroy_beesName a{
			text-decoration: none;
			color : #50401B;
			display: block; /*a태그를 영역 전체로 잡기 위함*/
		}
		
		.myhistroy_beesName{
			border: 1px solid #ededed;
		}
		
		.myhistroy_beesName td{
			padding: 5px 20px;
		}
		
				
		.myhistroy_table, .myhistroy_comment_table{
			width: 100%;
			color : #50401B;
			border: 1px solid #ededed;
			background-color: white;
		}
		
		.myhistroy_comment_table{
			margin: 10px auto;
		}
		
		tr[class^= "mycomments"] td{
			/*mycomments로 시작하는 class모두 선택*/
		}
		
		.mycomments1 td{
			padding: 20px 20px 5px 20px;
			font-weight: 500;
		}
		.mycomments1 td span{
			color: gray;
		}
		
		.mycomments2 td{
			padding: 5px 20px;
		}
		
		.mycomments3 td{
			padding: 5px 20px;
			color: gray;
		}
		
		.mycomments4 td{
			padding: 5px 20px 20px 20px;
			color: gray;
		}
		
		

		
	</style>
	
	<script>
	
		$(function(){
			
			//사이드 네비 초기값
			$(".navi_li").eq(1).css('background','#F7D078').css('font-weight','700');
			
			$(".mycomments").click(function(){
				alert("해당 페이지 모달 나오게 추후 구현 예정");
			});
			
			//footer위치조절
			var higth = $("body").height();
			if(higth<754){
				$("#footer").css('position','absolute').css('bottom','0');
			}
			
			$("#beesList").on('change',function(){
				var myBeesName = $(this).find(":selected").val();

				//목록별 검색
			 	$.ajax({
					url : "/myPageBeesComment.do",
					data : {"beesName" : myBeesName}, //key:value
					type : "post",
					success: function(data){
						$(".myhistroy_div").css('margin-bottom','230px');
						$(".myhistroy_comment_table").remove();
						
						$.each(data, function(index, value){
							
							var bCont;
							if(value.boardCont != null){
								bCont = value.boardCont;								
							}else{
								bCont = " ";
							}
							
							var myDate = new Date(value.commentDate);
							cDate = myDate.getFullYear(value.commentDate)+'년 '+(myDate.getMonth(value.commentDate)+1) + '월 ' + (myDate.getDate(value.commentDate)) + '일 ';

							
							$(".myhistroy_div").append('<table class="myhistroy_comment_table">'+
																'<tr class="myhistroy_beesName">'+
																	'<td colspan="2"><a href="/beesSelectOne.do?beesNo='+value.beesNo+'&memberNo='+value.memberNo+'">'+value.beesName+'</a></td>'+ 
																'</tr>'+
																'<tr class="mycomments mycomments1">'+	
																'<td colspan="2">'+value.userName+'<span> 댓글</span></td>'+
																'</tr>'+
																'<tr class="mycomments mycomments2">'+
																	'<td colspan="2">'+value.commentCont+'</td>'+
																'</tr>'+
																'<tr class="mycomments mycomments3">'+
																	'<td colspan="2">'+bCont+'</td>'+
																'</tr>'+
																'<tr class="mycomments mycomments4">'+
																	'<td colspan="2">'+cDate +'</td>'+
																'</tr>'+
															'<table>');
						});
						
					}
			});
			
			});
			
			
		});
	
	</script>
	
	<%
		Member m = (Member)session.getAttribute("member");
		ArrayList<MyComment> list = (ArrayList<MyComment>)request.getAttribute("list");
	%>
	
	<%@include file="/include/headerUser.jsp" %>
		
		<div class="container pt-3">
			<div class="row">
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
				<!-- mypage 사이드 네비 -->				
				<div class="col-3 p-0 mypage_navi_div">
					<ul id="mypage_navi_ul">
						<li class="navi_li"><a href="/myPageInfo.do" id="myInfo">내 정보<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href="/myPageBoard.do" id="myHistory">내가 쓴 글<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageHeart.do' id="myHeart">좋아요 누른 목록<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageBeesJoinQnas.do' id="myApprove">비즈 가입 확인<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageQnaHistory.do' id="myQuestion">문의사항<i class="fas fa-angle-right"></i></a></li>
						<li class="navi_li"><a href='/myPageNotice.do' id="myNotice">공지사항<i class="fas fa-angle-right"></i></a></li>
					</ul>
				</div>
				<!-- mypage 사이드 네비 -->
				
				<!-- mypage 피드(내가 쓴 글_게시글) -->
				<div class="col-7 p-0 myhistroy_div">
					<table class="myhistroy_table">
						<tr>
							<th>내가 쓴 글</th>
							<th>
								<select name="beesList" id="beesList">
									<option value="1">비즈별 모아보기</option>
									<%if(!list.isEmpty()){ 
										ArrayList<String> arr = new ArrayList<String>();
										for(MyComment mc : list) 
										{
											arr.add(mc.getBeesName());
										}
										TreeSet<String> arr2 = new TreeSet<String>(arr);
										ArrayList<String> arr3 = new ArrayList<String>(arr2);
										
										for(String beesName : arr3){ %>
											<option value="<%=beesName%>"><%=beesName%></option>
										<%}
										
									} %>
					<%-- <option value="<%=mc.getBeesName()%>"><%=mc.getBeesName() %></option> --%>				
									<!-- 가입한 비즈 목록 불러오기 -->
								</select>
							</th>
						</tr>
						<tr class="myhistroy_categories">
							<td><a href="/myPageBoard.do">게시글</a></td>
							<td><a href="/myPageComment.do">댓글</a></td>
						</tr>
						<tr class="myhistroy_categories_underbar">
							<td></td>
							<td></td>
						</tr>
					</table>
					<%if(!list.isEmpty()){ %>
						<%for(MyComment mc : list){ %>
						<table class="myhistroy_comment_table">
							<!-- 클릭하면 비즈로 이동 -->
							<tr class="myhistroy_beesName">
								<td colspan="2"><a href="/beesSelectOne.do?beesNo=<%=mc.getBeesNo()%>&memberNo=<%=mc.getMemberNo()%>"><%=mc.getBeesName() %></a></td>
							</tr>
							<!-- 클릭하면 비즈로 이동 -->
						
							<!-- 클릭하면 모달로 게시글 보여줌 -->
							<tr class="mycomments mycomments1">
								<td colspan="2"><%=mc.getUserName() %> <span>댓글</span></td>
							</tr>
							<tr class="mycomments mycomments2">
								<td colspan="2"><%=mc.getCommentCont() %></td>
							</tr>
							<tr class="mycomments mycomments3">
							  <%if(mc.getBoardCont()!=null){ %>
								<td colspan="2"><%=mc.getBoardCont() %></td>
							  <%} %>
							</tr>
							<tr class="mycomments mycomments4">
								<td colspan="2">
									<%SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); %>
									<%=sdFormat.format(mc.getCommentDate()) %>
								</td>
							</tr>
							<!-- 클릭하면 모달로 게시글 보여줌 -->
						</table>
						<%} %>
					<%}else{ %>
						<table class="myhistroy_comment_table">
							<tr>
								<td style="text-align:center; padding: 20px 10px; color: gray;">등록한 댓글이 없습니다.</td>
							</tr>
						</table>
					<%} %>
					
					
				</div>
				<!-- mypage 피드(내가 쓴 글_게시글) -->
				
				<!-- 여백 -->
				<div class="col-1"></div>
			</div>
		</div>

	<div><%@include file="/common/footer.jsp" %><div>

</body>
</html>