<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내정보 | bee</title>
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
	
	
	
	<%
		Member m = (Member)session.getAttribute("member");
	%>
	
	<script type="text/javascript" src="/resources/js/myPageInfo.js"></script>

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
				
				<!-- mypage 피드(내정보) -->
				<div class="col-7 p-0 myInfo_div">
					<table class="myInfo_table">
						<tr class="border_Y">
							<th colspan="4">내 정보</th>
						</tr>
						<tr class="border_Y">
							<td><b>사용중인 프로필</b></td>
							<td colspan="2">
							<%if(m.getProfileImg()==null){ %>
								<div id="member_profile" style="background-image : url(/resources/image/user/profile_none.png"></div>
							<%}else{ %>
								<div id="member_profile" style="background-image : url(/resources/image/profile/<%=m.getProfileImg()%>"></div>
							<%} %>
								<div id="member_name"><%=m.getMemberName() %></div>
							</td>
							<td>
								<input type="button" value="관리" class="myInfo_profile_btn"/>
							</td>
						</tr>
						<tr class="border_Y">
							<td><b>개인정보</b></td>
							<td>생일</td>
							<td>
								<div style="display:block;">
									<% String birth = Integer.toString(m.getMemberBirth());%>
									<%=birth.substring(0,4) %>년 <%=birth.substring(4,6) %>월 <%=birth.substring(6,8) %>일
									<input type="hidden" id="myBirth" value="<%=Integer.toString(m.getMemberBirth()) %>">
								</div>
								<div style="display:none;">
									<select name="YEAR" id="YEAR"></select>년도 
									<select name="MONTH" id="MONTH"></select>월 
									<select name="DAY" id="DAY"></select>일
								</div>
							</td>
							<td>
								<input type="hidden" value="확인" id="memberBirthModify" class="myInfo_hidden_btn"/> <!-- ajax로 변경하는 페이지.. 이케이케.. -->
								<input type="button" value="변경" class="myInfo_modify_btn" id="memberBirth"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>성별</td>
							<td>
								<div style="display:block;">
									<%if(m.getMemberGender()=='F') {%>
										여자
									<%}else{ %>
										남자
									<%} %>
								</div>
								<div style="display:none;">
									<select id="memberGender" name="memberGender">
										<option value="F">여자</option>
										<option value="M">남자</option>
									</select>
								</div>
							</td>
							<td>
								<input type="hidden" value="확인" id="memberGenderModify" class="myInfo_hidden_btn"/>
								<input type="button" value="변경" class="myInfo_modify_btn"  id="memberGender"/>
							</td>
						</tr>
						<tr class="border_Y">
							<td><b>로그인계정</b></td>
							<td>휴대폰번호</td>
							<td>
								<div style="display:block;">
									<%String phone = m.getMemberPhone(); %>
									+82 <%=phone.substring(1,3) %> - <%=phone.substring(3,5) %>** - <%=phone.substring(7,9) %>**
								</div>
								<div style="display:none;">
									<input type="text" id="memberPoneM" autocomplete="off" name="memberPone" placeholder="휴대폰 번호 입력">
								</div>
							</td>
							<td>
								<input type="hidden" value="확인" id="memberPhoneModify" class="myInfo_hidden_btn"/> <!-- 휴대폰 번호 인증 -->
								<input type="button" value="변경" class="myInfo_modify_btn" id="memberPhone"/>
							</td>
						</tr>
						<!-- 휴대폰 인증 번호 칸 -------------------------------------------------------------------------------------------------------------------- -->
						<!-- <tr id="member_phone_certified">
							<td colspan="2"></td>
							<td><input type="text" name="memberPhoneCertified" id="member_phone_certified_input" placeholder="인증번호 입력"></td>
							<td><input type="button" value="확인" id="member_phone_certified_btn"/></td>
						</tr> -->
						<tr>
							<td></td>
							<td>이메일</td>
							<td>
								<div style="display:block;">
									<%String email = m.getMemberEmail(); %>
									<%String[] values = email.split("@");%>
									
									<%=values[0].substring(0,2) %>
									<%for(int i=0; i<(values[0].length()-2); i++) {%>
										*
									<%} %>
									@<%=values[1] %>
									
								</div>
								<div style="display:none;">
									<input type="text" id="memberEmailInput" autocomplete="off" name="memberEmail" placeholder="이메일 입력">
								</div>
							</td>
							<!-- <td>kh****@naver.com</td> -->
							<td>
								<input type="hidden" value="확인" id="memberEmailModify" class="myInfo_hidden_btn"/> <!-- 이메일 중복확인 -->
								<input type="button" value="변경" class="myInfo_modify_btn" id="memberEmail"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>비밀번호</td>
							<td></td>
							<td>
								<input type="button" value="변경" class="myInfo_pw_modify_btn" id="memberPw"/>
							</td>
						</tr>
						<tr class="border_Y">
							<td><b>회원 탈퇴</b></td>
							<td colspan="2"></td>
							<td><input type="button" value="탈퇴" class="myInfo_del_yn"/></td>
						</tr>
					</table>
				</div>
				<!-- mypage 피드(내정보) -->
				
				<!-- 여백 -->
				<div class="col-1"></div>
			</div>
		</div>
		<!-- container -->
		
	<!-------- 모달 시작 ---------->
	<div class="modal_bg"></div>
	
	<!-- 프로필 모달 -->
	<div id="member_profile_modal">
		<div id="member_profile_modal_header">
			<span style="margin-left: 50px;">프로필 수정</span>
			<button id="member_profile_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
		<!-- ///////////////////////////////////////////////////////////////////////////////////////////////프로필변경 -->
		<form action="/updateMemberProfile.do" id="fileForm" method="POST" enctype="multipart/form-data" >
			<div id="member_profile_modal_cont" style="text-align: center;">
				<table>
					<tr>
						<th>
							<div id="member_profile_img" style="background-image : url(/resources/image/profile/<%=m.getProfileImg()%>)">
							<input type="hidden" id="originImg" value="<%=m.getProfileImg()%>"/>
							</div> 
							<div id="member_profile_icon"><i class="fas fa-camera"></i></div>
								<input type="file" id="file" name="file" style="display: none;"/> <!-- style="display: none;" -->
							
						</th>
					</tr>
					<tr>
						<td><input id="member_profile_modal_name" autocomplete="off" name="newMemberName" type="text" placeholder="멤버이름"></td>
					</tr>
				</table>
			</div>
			<div id="member_profile_modal_footer">
				<button id="member_profile_modal_reset" type="button">취소</button>
				<button id="member_profile_modal_submit" type="submit">완료</button>
			</div>
		</form>
		<!-- ///////////////////////////////////////////////////////////////////////////////////////////////프로필변경 -->
	</div>
	<!--프로필 모달 끝-->
	
	<!-- 비밀번호 모달 시작 -->
	<div id="member_pw_modify_modal">
		<div id="member_pw_modify_modal_header">
			<span style="margin-left: 50px;">비밀번호 변경</span>
			<button id="member_pw_modify_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
		<form>
			<div id="member_pw_modify_modal_cont" style="text-align: center;">
				<table>
					<tr>
						<td>
							<p>비밀번호는 소문자,특수문자,숫자를 조합한 <br>
							 8~16글자로 입력로 입력해야 합니다.</p>
						</td>
					</tr>
					<tr>
						<td><input id="member_pw_modify_modal_input" type="password" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td><input id="member_repw_modify_modal_input" type="password" placeholder="비밀번호를 다시 한 번 입력하세요"></td>
					</tr>
				</table>
			</div>
			<div id="member_pw_modify_modal_footer">
				<button id="member_pw_modify_modal_reset" type="button">취소</button>
				<button id="member_pw_modify_modal_submit" type="button">완료</button>
			</div>
		</form>
	</div>
	<!--비밀번호 모달 끝-->
	
	
	<!-- 회원탈퇴 모달 시작 -->
	<div id="myInfo_del_modal">
		<div id="myInfo_del_modal_header">
			<span style="margin-left: 50px;">회원 탈퇴</span>
			<button id="myInfo_del_modal_close">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#F7D078" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</button>
		</div>
		<form>
			<div id="myInfo_del_modal_cont" style="text-align: center;">
				<table>
					<tr>
						<td>
							<p>Bee를 탈퇴하면, <br>
							       비즈에 등록한 글,사진,댓글 등을 수정/삭제 할 수 없습니다.<br>
							       필요시 꼭 탈퇴 전에 수정하거나 삭제해주세요.
							</p>
						</td>
					</tr>
					<tr>
						<td><input id="myInfo_del_modal_pw_check" type="password" placeholder="비밀번호를 입력하세요"></td>
					</tr>
				</table>
			</div>
			<div id="myInfo_del_modal_footer">
				<button id="myInfo_del_modal_reset" type="button">취소</button>
				<button id="myInfo_del_modal_submit" type="button">완료</button>
			</div>
		</form>
	</div>
	<!--회원탈퇴 모달 끝-->
	
	
	<!-- 모달 끝 -->

	<div><%@include file="/common/footer.jsp" %><div>

</body>
</html>