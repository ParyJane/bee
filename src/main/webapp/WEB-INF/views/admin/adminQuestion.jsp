<%@page import="com.fourmeeting.bee.question.model.vo.QnA"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
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

	<link rel="stylesheet" type="text/css" href="/resources/css/adminQuestion.css">



	<%
		Member m = (Member)session.getAttribute("member");
		ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
		String sb = (String)request.getAttribute("sb");
	%>


	<script type="text/javascript" src="/resources/js/adminQuestion.js"></script>


	<%@include file="/include/headerAdmin.jsp" %>
	
	<!-- 검색바 -->
	<div class="container pt-4">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<span id="search_title">1:1 문의</span>

				<form action="/adminQuestionSearch.do" method="post">
					<table class="search_bar_table">
						<tr>
							<td class="search_bar"><input type="date" name="startDate"></td>
							<td class="search_bar"><input type="date" name="endDate"></td>
							<td class="search_bar">
								<select name="searchSelect">
										<option value="1">전체보기</option>
										<option value="2">글번호</option>
										<option value="3">카테고리</option>
										<option value="4">글제목</option>
										<option value="5">글제목+내용</option>
								</select>
							</td>
							<td class="search_bar">
								<input type="text" style="width: 90%;"  autocomplete="off"  name="search">
							</td>
							<td class="search_bar"><button type="submit" id="search_btn">
									<img src="resources/image/search.png" />
								</button></td>
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
				
				<div class="col-10 question_div">
					<table border="1" class="question_table">
						<tr>
							<th>글 번호</th>
							<th>분류</th>
							<th>글 제목</th>
							<th>작성일</th>
							<th>답변</th>
							<th>삭제/복구</th>
						</tr>
						<%if(!list.isEmpty()) {%> <!-- 테이블 몇개 고정으로 보여줄껀지 -------------------------------------------------------------------- -->
							<%for(QnA q : list) {%>
								<tr>
									<td id="tableQuestionNo"><%=q.getQuestionNo() %></td>
									<input type="hidden" id="tableMemberNo" value="<%=q.getMemberNo() %>"/>
									<td><%=q.getQuestionCategory() %></td>
									<td class="member_question_title">
										<%
											String qTitle =  q.getQuestionTitle();
											if(qTitle.length()<23){
										%>
												<%=qTitle %>
											<%}else{ %>
												<%=qTitle.substring(0, 23) %>...
											<%} %>
									</td>
									<input type="hidden" class="questionNo" value="<%=q.getQuestionNo()%>"/>
									<td>
										<% 
											//날짜 포맷 생성
											String pattern = "yy.MM.dd";
											SimpleDateFormat sdFormat = new SimpleDateFormat(pattern);
											
											//포맷에 맞춰서 저장
											String qDate = sdFormat.format(q.getQuestionDate()); 
										%>
										<%=qDate %>
									</td>
									<!-- 삭제된 문의는 답변하기 클릭X -->
									<td>
										<%if(q.getReplyYN()=='N') {%>
											<input type="button" value="답변하기" class="answer_n_btn">
										<%}else{ %>
											<input type="button" value="답변완료" class="answer_y_btn">
										<%} %>
									</td>
									<td>
										<%if(q.getQuestionDelYN()=='N') {%>
											<input type="button" value="삭제" class="qna_del_n_btn">
										<%}else{ %>
											<input type="button" value="복구" class="qna_del_y_btn">
										<%} %>
									</td>
								</tr>
							<%} %>
						<%}else{ %>
							<tr>
								<td colspan="6">등록된 문의가 없습니다.</td>
							</tr> 
						<%} %>
						
					</table>
					<div id="pageNavi"><%=sb %></div>
				</div>
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
			</div>
		</div>
		
		
	<!-- --------- 모달 페이지 --------------------------------------- -->
	<div class="modal_bg"></div>
		
	<!-- 1:1 질문 모달 시작(question) --------------------------------------->
	<div id="admin_question_modal">
		<div id="admin_question_modal_header">
			<span style="margin-left: 50px;">1:1 문의 확인</span>
			<button id="admin_question_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
			<div id="admin_question_modal_cont" style="text-align: center;">
				<div id="admin_question_modal_title">
				</div>
				<div id="admin_question_modal_text">
					<p></p>
				</div>
				<div id="admin_question_modal_footer">
					<input id="admin_question_modal_submit" type="button" value="답변하기" />
					<input id="admin_question_modal_submit_Y" type="hidden" value="답변완료"/>
				</div>
			</div>
	</div>
	<!-- 1:1 질문 모달 끝  -->
	
	<!-- 1:1 답변 확인 모달 시작(answerView) --------------------------------------->
	<div id="admin_answer_view_modal">
		<div id="admin_answer_view_modal_header">
			<span style="margin-left: 50px;">1:1 답변 확인</span>
			<button id="admin_answer_view_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
			<div id="admin_answer_view_modal_cont" style="text-align: center;">
			<div id="admin_answer_view_modal_title">
			</div>
			<div id="admin_answer_view_modal_text">
				<p></p>
			</div>
			<div id="admin_answer_view_modal_footer">
					<button id="admin_answer_view_modal_reset" type="button">수정하기</button>
					<button id="admin_answer_view_modal_submit" type="button">삭제하기</button>
			</div>
		</div>
	</div>
	<!-- 1:1 답변 확인 끝  -->
	
		
	<!-- 1:1 답변 작성 모달 시작(answer-tableVer) --------------------------------------- -->
	<div id="admin_answer_tableVer">
		<div id="admin_answer_tableVer_header">
			<span style="margin-left: 50px;">1:1 답변 작성</span>
			<button id="admin_answer_tableVer_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
		<form>
			<div id="admin_answer_tableVer_cont" style="text-align: center;">
			<div id="admin_answer_tableVer_title">
				RE: 
			</div>
			<div>
				<textarea id="adminTableAnswerCont" name="adminTableAnswer"></textarea>
			</div>
			<div id="admin_answer_tableVer_footer">
				<button id="admin_answer_tableVer_reset" type="button">취소</button>
				<button id="admin_answer_tableVer_submit" type="button">답변등록</button>
				<!-- 백단 구현할때 submit 이케이케... -->
			</div>
			</div>
		</form>
	</div>
	<!-- 1:1 답변 작성 모달 끝 -->
	
	<!-- 1:1 답변 작성 모달 시작(answer-modalVer) --------------------------------------- -->
	<div id="admin_answer_modal">
		<div id="admin_answer_modal_header">
			<span style="margin-left: 50px;">1:1 답변 작성</span>
			<button id="admin_answer_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
		<form>
			<div id="admin_answer_modal_cont" style="text-align: center;">
			<div id="admin_answer_modal_title">
				RE: 
			</div>
			<div>
				<textarea id="adminAnswerCont" name="adminAnswer"></textarea>
			</div>
			<div id="admin_answer_modal_footer">
				<button id="admin_answer_modal_reset" type="button">취소</button>
				<button id="admin_answer_modal_submit" type="button">답변등록</button>
				<!-- 백단 구현할때 submit 이케이케... -->
			</div>
			</div>
		</form>
	</div>
	<!-- 1:1 답변 작성 모달 끝 -->
	
	<!-- 1:1 답변 수정 모달 시작(answerModify) --------------------------------------- -->
	<div id="admin_answer_modify_modal">
		<div id="admin_answer_modify_modal_header">
			<span style="margin-left: 50px;">1:1 답변 수정</span>
			<button id="admin_answer_modify_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
		<form>
			<div id="admin_answer_modify_modal_cont" style="text-align: center;">
			<div id="admin_answer_modify_modal_title">
				RE:
			</div>
			<div id="admin_question_modify_modal_text">
				<textarea name="adminAnswerModify"></textarea>
			</div>
			<div id="admin_answer_modify_modal_footer">
				<button id="admin_answer_modify_modal_reset" type="button">취소하기</button>
				<button id="admin_answer_modify_modal_submit" type="button">수정하기</button>
				<!-- 백단 구현할때 submit 이케이케... -->
			</div>
			</div>
		</form>
	</div>
	<!-- 1:1 답변 수정 모달 끝 -->
	
	<div><%@include file="/common/footer.jsp" %></div>
	
</body>
</html>