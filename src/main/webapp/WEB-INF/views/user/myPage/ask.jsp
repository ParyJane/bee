<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 초대 | bee</title>
</head>
<body>


	<%@ include file="/common/cdnLib.jsp"%>
	
	<!-- 반응형 웹에 필요한 소스 -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- 폰트어썸 CDN -->	
	<!-- reference your copy Font Awesome here (from our CDN or by hosting yourself) -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="/resources/css/info.css">	
	
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
			height: 800px;
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
		
		.myhistroy_categories_underbar td:nth-child(2){
		 	background-color: #50401B;
		 	height: 2px;
		}
		
		.myhistroy_table {
			width: 100%;
			color : #50401B;
			border: 1px solid #ededed;
			background-color: white;
		}
		
		.ask_select{
			color: gray;
		}

		.myhistroy_div form{
			padding: 20px 20px;
			border: 1px solid #ededed;
			background-color: white;
			color : #50401B;
		}
		
		.myhistroy_div  form p {
			font-weight: 500;
		}
		
		.myhistroy_div hr {
			margin: 30px auto;
		}
		
		#myquestion_title_div{
			border: 1px solid gray;
			position: relative;
			margin-bottom: 30px;
		}
		
		#myquestion_title_div span{
			color: gray;
			font-size: 0.9rem;
			position: absolute;
			top: 7px;
			right: 10px;
		}
		
		#myquestion_title{
			width: 90%;
			height: 35px;
			padding: 7px 15px 5px 15px;
			overflow: auto;
			resize: none;
			color: #50401B;
			font-size: 0.9rem;
			border: 0;
		}
		
		#myquestion_div{
			border: 1px solid gray;
		}
		
		#myquestion_div p{
			text-align: right;
			padding-top: 10px;
			padding-right: 10px;
			margin-bottom: 10px;
			color: gray;
			font-size: 0.9rem;
		}
		
		#myquestion{
			width: 100%;
			height: 250px;
			overflow: auto;
			resize: none;
			padding: 15px 15px;
			color: #50401B;
			font-size: 0.9rem;
			border: 0;
		}
		
		
		textarea, select, #ask_submit_btn, 
		#myquestion_title, input[type='reset']:focus{/*클릭시 아웃라인 없애기*/
			outline: none;
		}
		
		#ask_submit_btn {
			color: white;
			background-color: #50401B;
			border-radius: 25px;
			width: 85px;
			height: 35px;
			margin-left: 10px;
			border: 0;
		}
		
		.myhistroy_div input[type='reset'] {
			color: #50401B;
			background-color: white;
			border-radius: 25px;
			width: 85px;
			height: 35px;
			font-weight: 500;
			border: 1px solid #50401B;
		}


  
	</style>
	
	
	<%
		Member m = (Member)session.getAttribute("member");
	%>
	
	
	<script>
	
	$(function(){
		
		//사이드 네비 초기값
		$(".navi_li").eq(4).css('background','#F7D078').css('font-weight','700');
		
		$(".ask_select").click(function(){
			$(this).eq(0).css('color','#50401B');
		});
		
		
		//제목 글자 수 제한
		$("#myquestion_title").keyup(function(){
			
			var text = $(this).val();
			$(this).next().html(text.length+"/15");
			
			if(text.length>15){
				$(this).val(text.substring(0,15));
				$(this).next().css('color','red');				
			} else{
				$(this).next().css('color','#50401B');
			}
		});
		
		$("#myquestion").keyup(function(){
			
			var text = $(this).val();
			$(this).next().html(text.length+"/1000");
			
			if(text.length>1000){
				$(this).val(text.substring(0,1000));
				$(this).next().css('color','red');				
			} else{
				$(this).next().css('color','#50401B');
			}
		});
		
		$("#ask_submit_btn").click(function(){
			alert("등록되었습니다.");
		});		
			
		});
	
	</script>
	
	
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
							<th colspan="2">문의사항</th>
						</tr>
						<tr class="myhistroy_categories">
							<td><a href="/myPageQnaHistory.do">나의 문의 내역</a></td>
							<td><a href="/myPageAsk.do">1:1 문의하기</a></td>
						</tr>
						<tr class="myhistroy_categories_underbar">
							<td></td>
							<td></td>
						</tr>
					</table>
						
					<form action="/insertQuestion.do" method="post">
						<p><i class="fas fa-tasks"></i> 분류<p>
						<select class="ask_select" name="ask_select">
							<option value="" disabled selected hidden>문의하고자 하는 분류를 선택해주세요</option>
							<option value="1">비즈 건의사항</option>
							<option value="2">비즈 오류</option>
							<option value="3">기타</option>
						</select>
						<br><hr>
						
						<p>제목<p>
						<div id="myquestion_title_div">
							<textarea type="text" id="myquestion_title" name="myquestion_title"></textarea>
							<span>1/15</span>
						</div>
						
						<p>문의 내용<p>
						<div id="myquestion_div" >
							<textarea id="myquestion" name="myquestion"></textarea>
							<p>1/1000</p>
						</div>
						<br><br>
						<center>
							<input type="reset" value="취소"/> <input type="submit" value="작성완료" id="ask_submit_btn"/>
						</center>
						<br>
					</form>
					
					
				</div>
				<!-- mypage 피드(내가 쓴 글) -->
				
				<!-- 여백 -->
				<div class="col-1"></div>
			</div>
		</div>

	<div><%@include file="/common/footer.jsp" %><div>

</body>
</html>