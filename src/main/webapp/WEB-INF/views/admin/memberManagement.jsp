<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 반응형 웹에 필요한 소스 -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
		
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
	<!-- 폰트어썸 CDN -->	
	<!-- reference your copy Font Awesome here (from our CDN or by hosting yourself) -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- 노토산스 폰트 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">



<style>
		
	body{
		font-family: 'Noto Sans KR', sans-serif;
		/* background-color: #f9f9f9; */
	}
	
	div{
	    /* border: 1px black solid;    */
	}	
	
	.container{
		width: 100%;
		height: 100%;
		background-color: white;
	}
	
	
	.memberManagement_table{
		width: 100%;
		border: 1px solid #ededed;
		text-align: center;
		color: #50401B;
		
	}
	
	.memberManagement_table tr th{
		padding: 7px 20px;
		background-color: #fff3d8;
	}
	
	.memberManagement_table tr td{
		padding: 5px 20px;
		height: 40px;
	}
	
	/* 탈퇴버튼 */
	.member_del_yn_btn{
	
		
		border-radius: 25px;
		width: 80px;
		height: 27px;
		font-weight: 500;
		font-size: 0.85rem;
		line-height: 15px;
		border: 0;
		outline:none;
	}
	
	/* 복구버튼  */
	.member_del_n_btn{
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
	
	.member_del_y_btn, .member_del_n_btn:focus{
		outline: none;
	}
	.pagination{
	text-align:center;
	width:100px;
	margin:0 auto;
	padding:0;
	
	}
	.pagination li{
	margin-left:10px;
	}
	.pagination a{
	color: #50401B;
	font-size: 1.2rem;
	
	}
	.navi{
	margin-top:20px;
	margin:0 auto;
	}
	.memberManagement_div {
	min-height:440px;
	}
</style>

	<script>
		
	$(document).ready(function() {
	
			$(".member_del_yn_btn").click(function(){
				var delVal = $(this).val();
		
				  var memberNum = $(this).attr('id');
				
				if(delVal=='탈퇴'){    
					var data1 = confirm("정말 탈퇴처리 하시겠습니까?");
					if(data1){
						
						delVal = 'N';   
				
					}
				}else if(delVal=='복구'){  
					var data2 = confirm("정말 복구 하시겠습니까?");
					if(data2){
			
						delVal = 'Y';
			
					}
				}
				
				var $btnObject = $(this);
				$.ajax({
					url:"/withdrawalBtnChange.do",
					type: "get",
					data : {"delVal":delVal, "memberNum":memberNum },
					success : function(result){
						
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				});
				
			});
	
		});
	
	</script>

  <%@ include file="/include/adminSearchForm.jsp"  %>
  <%
	ArrayList<Member> list=(ArrayList<Member>)request.getAttribute("list");
	Member sessionMember = (Member)session.getAttribute("member");
	int memberNo = sessionMember.getMemberNo();
	
%>
		<div class="container pt-3">
			<div class="row">
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
				<div class="memberManagement_div col-10">
					
					<table border="1" class="memberManagement_table">  
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>가입일자</th>
							<th>탈퇴일자</th>
							<th>탈퇴 / 복구</th>
						</tr>
		<%
		
		if (memberNo < 1000) {
	%>
						
				<%for(Member ml: list){ %>
						<tr>
							<td><%=ml.getMemberNo() %></td>
							<td><%=ml.getMemberId() %></td>
							<td><%=ml.getMemberName() %></td>
							<td><%=ml.getMemberEmail() %></td>
							<%SimpleDateFormat sd1Format = new SimpleDateFormat("yy.MM.dd");
							SimpleDateFormat sd2Format = new SimpleDateFormat("yy.MM.dd");
							%>
							
							<td><%=sd1Format.format(ml.getMemberDate()) %></td>
							<td><%if(ml.getMemberEndDate()==null){ %>
									--
							    <%}else{%>
							 		<%=sd2Format.format(ml.getMemberEndDate()) %>
							    <%} %>
							</td>
							<td>
								<%if(ml.getDelYN()=='N'){ %>
									<input type="button" value="탈퇴" id="<%=ml.getMemberNo() %>" class="member_del_yn_btn"
									style="background-color:#F7D078; color:#50401B;">
								<%}else if(ml.getDelYN()=='Y'){ %>
									<input type="button" value="복구" id="<%=ml.getMemberNo() %>" class="member_del_yn_btn"
									style="background-color:#50401B; color:white;">
								<%} %>
							</td>
						</tr>
				<%} %>
						
					</table>
					
					
				</div>	 <!-- class="memberManagement_div -->
					<div class='navi'>
					<ul class="pagination">

			

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}"><img src="/resources/image/admin/angel-left.png" style="width:17px; height:17px;"></a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }"><img src="/resources/image/admin/angel-right.png" style="width:17px; height:17px;"></a></li>
						</c:if>


					</ul>
				</div>  <!-- navi -->
				<!--  end Pagination -->
			
					
			<form id='actionForm' action="/memberManagement.do" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type="hidden" name="startDate" value='<c:out value="${param.startDate }"/>'>
				<input type="hidden" name="endDate" value='<c:out value="${param.endDate }"/>'> 
				<input type="hidden" name="keyword" value='<c:out value="${param.keyword }"/>'>
				<input type="hidden" name="category" value='<c:out value="${param.category }"/>'>

				

			</form>
					
					
					
					
				</div> <!-- class="row" -->
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
			</div> <!-- class="container pt-3" -->
		
		
		
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						

					});
</script>


<%}else{ %>
		
<script>location.href ="/index.jsp";</script>
						
<%} %>
<jsp:include page="/common/footer.jsp" flush="true"/>
</body>
</html>