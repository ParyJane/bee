<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fourmeeting.bee.question.model.vo.QnA"%>
<%@page import="java.util.ArrayList"%>
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

	<link rel="stylesheet" type="text/css" href="/resources/css/qnaHistory.css">	
	
	
	
	<%
		Member m = (Member)session.getAttribute("member");
		ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
	%>
	
	
	
	
	<script>
	
		$(function(){
			
			//사이드 네비 초기값
			$(".navi_li").eq(4).css('background','#F7D078').css('font-weight','700');
			
			$(".qnas_profile").parent().css('width','45px').css('padding-left','10px').css('padding-right','5px');
			$(".admin_profile").parent().css('width','45px');
			
			//footer위치조절
			var higth = $("body").height();
			if(higth<754){
				$("#footer").css('position','absolute').css('bottom','0');
			}
			
			//Member 프로필 초기 설정-------------------------------------------------
			$('.qnas_profile').css("background-image","url(/resources/image/profile/<%=m.getProfileImg()%>)");
			
			
			
			
			//수정&삭제 버튼 클릭시
			$('.qna_modify_btn').click(function() {

				var $feedNavi = $(this).parent().next().next()
				if ($feedNavi.css('visibility') == 'hidden') {
					$feedNavi.css('visibility', 'visible');
				} else {
					$feedNavi.css('visibility', 'hidden');
				}
			})
			
			
			//수정버튼 마우스오버
			$('.qna_navi_block').children().mouseover(function() {

				$(this).css('background-color', 'lightgray');

			})

			$('.qna_navi_block').children().mouseout(function() {

				$(this).css('background-color', 'white');

			})
			
			
			var questionNo;
			

			//수정버튼 클릭 ------------------------------------------------------------
			$('.qna_modify').click(function() {

				$('.modal_bg').css('display', 'block');
				$('#question_modal').css('display', 'block'); 
				
				questionNo = $(this).nextAll(".questionNo").val();
				
				
				//수정버튼 모달 불러오기
				$.ajax({
					url : "/selectOneQuestion.do",
					data : {"questionNo" : questionNo}, //key:value
					type : "post",
					success: function(data){
						$("#question_modal_title").text(data[0]);
						$("#question_modal_text").parent().html('<textarea id="question_modal_text">'+data[1]+'</textarea>');
						/* $("#question_modal_text").html(data[1]); */
					},
					error : function(data){
						alert("실패");
					}
				});
				
				$("#question_modal_title").text();
				
				
				//모달 내 버튼 클릭 (X)
				$('#question_modal_close').click(function() {
					$('.modal_bg').css('display', 'none');
					$('#question_modal').css('display', 'none');
				});
				
				//모달 내 버튼 클릭 (취소하기)
				$('#question_modal_reset').click(function() {
					$('.modal_bg').css('display', 'none');
					$('#question_modal').css('display', 'none');
				});
				

			})
			
			//모달 내 버튼 클릭 (수정하기)
				
				$('#question_modal_submit').click(function() {
					
					var data = $("#question_modal_text").val();
					
					var questionCont = data.replace(/\n/g,'<br>');
					
					// '\n' 으로 줄개행이 들어와서 바꿔줌
					// '/g'전체를 바꿔줌
					
					
					$.ajax({
						url : "/questionModify.do",
						data : {"questionNo" : questionNo, "questionCont" : questionCont}, //key:value
						type : "post",
						success: function(data){
							alert("정상적으로 수정되었습니다.");
							window.location.reload();
						},
						error : function(data){
							alert("실패");
						}
					});
				});
			
			
			
			
			//삭제버튼 클릭 -------------------------------------------------------------------
			$('.qna_delete').click(function() {
				
				var questionNo = $(this).nextAll(".questionNo").val();
				
				if (confirm("피드를 정말 삭제하시겠습니까?")) {

					$.ajax({
						url : "/questionDelete.do",
						data : {"questionNo" : questionNo}, //key:value
						type : "post",
						success: function(data){
							alert("삭제되었습니다.");
							window.location.reload();
						},
						error : function(data){
							alert("실패");
						}
					});

				}

			})
			
			
			
			

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
				
					<!-- 테이블 메뉴 -->
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
					
					<%if(!list.isEmpty()){ int index = 0;%>
						<%for(QnA q : list){ %>
							<!-- 내용 div -->
							<div class="myhistroy_qnas_div">
								<!-- 질문칸 -->
								<table class="myhistroy_q_table">
									<tr>
										<td rowspan="2"><div class="qnas_profile"></div></td>
										<td class="qnas_writer_name"><%=m.getMemberName()%></td>
										<td class="qna_modify_btn" rowspan="2">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16"> <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" /> </svg>
										</td>
									</tr>
									<tr>
										<td class="qnas_q_timestamp">
											 <!-- 2021년 01월 29일 오전 3:33 -->
											 <%
											 	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy년 MM월 dd일 a KK:mm");
											 %>
											 <%=sdFormat.format(q.getQuestionDate()) %>
										</td>
									</tr>
									<tr class="qna_modify_hidden_navi">
										<td class="qna_navi" colspan="3">
											<div class="qna_navi_block">
												<div class="qna_modify">수정하기</div>
												<div class="qna_delete">삭제하기</div>
												<input type="hidden" class="questionNo" value="<%=q.getQuestionNo()%>"/>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="qnas_title">
											<%=q.getQuestionTitle() %>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="qnas_q">
											<%=q.getQuestionCont() %>
										</td>
									</tr>
								</table>
								<%if(q.getReplyYN()=='Y' && q.getAnswerDelYN()=='N'){ %>
								<!-- 답변칸 -->
								<div class="myhistroy_qnas_answer_div">
									<table class="myhistroy_a_table">
										<tr>
											<td rowspan="2"><div class="admin_profile"></div></td>
											<td class="admin_name">관리자</td>
										</tr>
										<tr>
											<td class="qnas_a_timestamp"><%=sdFormat.format(q.getAnswerDate()) %></td>
										</tr>
										<tr>
											<td colspan="3" class="qnas_a">
												<%=q.getAnswerCont() %>
											</td>
										</tr>
									</table>
								</div>
								<%} %>
								<hr>
							</div>
						<%} %>
					<%}else{ %>
						<!-- 내용 div -->
							<div class="myhistroy_qnas_div" style="text-align:center; color:gray;">
								등록된 문의내역이 없습니다.
							</div>
					<%} %>
					
				</div>
				<!-- mypage 피드(내가 쓴 글) -->
				
				<!-- 여백 -->
				<div class="col-1"></div>
			</div>
		</div>
		
		
	<!-- --------- 모달 페이지 --------------------------------------- -->
	<div class="modal_bg"></div>
		
	<!-- 1:1 질문 모달 시작 --------------------------------------->
	<div id="question_modal">
		<div id="question_modal_header">
			<span style="margin-left: 50px;">1:1 문의 수정</span>
			<button id="question_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
		<form>
			<div id="question_modal_cont" style="text-align: center;">
			<div id="question_modal_title"></div>
			<div> 
				<textarea id="question_modal_text" name="questionCont"></textarea>
			</div>
			<div id="question_modal_footer">
				<button id="question_modal_reset" type="button">취소</button>
				<button id="question_modal_submit" type="button">수정하기</button>
				<!-- 백단때 submit으로 할수도 있을듯 -->
			</div>
			</div>
		</form>
	</div>
	<!-- 1:1 질문 모달 끝  -->
		
		
		
		

	<div><%@include file="/common/footer.jsp" %><div>

</body>
</html>