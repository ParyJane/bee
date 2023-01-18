<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@page import="com.fourmeeting.bee.notice.model.vo.Notice"%>
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

	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/resources/css/adminNoticeBoard.css">
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
	
	.question_div {
		min-height:440px;
	}
	
	.question_table{
		width: 100%;
		border: 1px solid #ededed;
		text-align: center;
		color: #50401B;
		
		
	}
	
	.question_table tr th{
		padding: 7px 20px;
		background-color: #fff3d8;
	}
	
	.question_table tr td{
		padding: 5px 20px;
		height: 40px;
	}
	
	/* 답변하기 or 답변완료 */
	#answer_yn_btn{
		color: #50401B;
		background-color: white;
		border-radius: 25px;
		width: 80px;
		height: 27px;
		font-weight: 500;
		border: 1px solid #50401B;
		font-size: 0.85rem;
		line-height: 15px;
	}
	
	/* 삭제 or 복구 */
	.qna_del_yn_btn{
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
	
	.answer_yn_btn, .qna_del_yn_btn:focus{
		outline: none;
	}
	.btn-primary{
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
	.btn-secondary{
	border-radius: 25px;
		width: 80px;
		height: 27px;
		font-weight: 500;
		font-size: 0.85rem;
		line-height: 15px;
		border: 0;
	
	}
	.btn-modify{
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
	#modify_category{
	border:none;
	text-align:center;
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
	#recipient-name{
	outline:none;
	border:none;
	}
	#myInput{
	outline:none;
	}
</style>

	
	   <%@ include file="/include/adminSearchButtomForm.jsp"  %>
<%
	ArrayList<Notice> list=(ArrayList<Notice>)request.getAttribute("list");

	Member member = (Member)session.getAttribute("member");
	int mNo = member.getMemberNo();
%>
<script>
		
	$(document).ready(function() {

			//삭제 복구 버튼
			$(".qna_del_yn_btn").click(function(){
				
				var btnVal = $(this).val();
				  var boardNum = $(this).attr('id');
				
				if(btnVal=="삭제"){
					var result = confirm("정말 삭제하시겠습니까?");
					if(result){
						
						btnVal = "N"; 
						
						
					} 
				}
				else if(btnVal=="복구"){
					
					btnVal = "Y"; 
					
				} 
				var $btnObject = $(this);
				var $modifyObject = $(this).parent().prev();
				$.ajax({
					url:"/delBtnChange.do",
					type: "get",
					data : {"btnVal":btnVal, "boardNum":boardNum},
					success : function(data){
						if(data=="true")
						{
							if(btnVal=='Y'){ 
								
								
								$btnObject.css('background-color','#F7D078').css('color','#50401B').val("삭제");
								$modifyObject.css('visibility','visible');
								
								
							}else{			
								
								$btnObject.css('background-color','#50401B').css('color','white').val("복구");
								$modifyObject.css('visibility','hidden');
							}	
						}else{
							alert("변경 실패");	
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				});
			});
			
			
			
			
			$(".btn-modify").click(function(){
				 var num = $(this).parents('tr').children().first().text(); 
				
				
				var $ctnObject = $(this);
				$.ajax({
					url:"/modifyChange.do",
					type: "post",
					data : {"num":num},
					dataType: "json",
					success : function(data){
						
						console.log(data.title);
						console.log(data.category);
						console.log(data.cont);
						console.log(num);
						console.log(data.memberNo);
				
						$("#modify_category").val(data.category);
						$("#modify_title").val(data.title);
						$("#recipient-name").val(data.cont);
						$("#modify_boardNo").val(num);
				$a = $(".btn-modifys").attr('id');
				console.log($a);
					if(($a) != data.memberNo){
						$(".btn-modifys").css('visibility','hidden');
					}else if(($a) == data.memberNo){
							$(".btn-modifys").css('visibility','visible');	
					}
					},
					error : function(request,status,error){
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 

					}
				});
			
			});
			
			
		});
		
	</script>
<%
		
if (mNo < 1000) {
	%>
	
<div class="container pt-3">
			<div class="row">
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
				<div class="col-10 question_div">
					
					<table border="1" class="question_table">
						<tr>
							<th>글 번호</th>
							<th>분류</th>
							<th>글제목</th>
							<th>작성자ID</th>
							<th>작성일</th>
							<th>글 보기/수정</th>
							<th>삭제/복구</th>
						</tr>
			
						<%for(Notice n : list){ %>	
							
						<tr>
							<td><%=n.getNoticeNo() %></td>
							<td><%=n.getNoticeCategory() %></td>
							<td><%=n.getNoticeTitle() %></td>
							
							
							<td><%=n.getMemberId() %></td>
							
							<%SimpleDateFormat sdFormat = new SimpleDateFormat("yy.MM.dd"); %>
							<td><%=sdFormat.format(n.getNoticeDate()) %></td>
							<td>
							<%if(n.getNoticeDelYN()=='N'){ %>
								<% if(member.getMemberId().equals(n.getMemberId())){%>
								<input type="button" class="btn btn-modify" data-toggle="modal" data-target="#modifyModal" value="보기/수정"
								id="mBtn" >   <!--  -->
								<%}else{ %>
								<input type="button" class="btn btn-modify" data-toggle="modal" data-target="#modifyModal" value="보기"
								id="mBtn" >
								<%} %>
							<%}else{ %>
								--
							<%} %>
							<input type="hidden" id="<%= n.getMemberNo()%>" class="hiddenCont">
							<%if(n.getNoticeDelYN()=='N'){ %>
							<td><input type="button" value="삭제" name="deleteBtn" id="<%=n.getNoticeNo() %>" class="qna_del_yn_btn"></td>
							<%}else{ %>
							<td><input type="button" value="복구" name="restoreBtn" id="<%=n.getNoticeNo() %>" class="qna_del_yn_btn" 
							style="background-color:#50401B; color:white;"></td>
							<%} %>
						
						
						
						</tr>
						<%} %> 
					</table>
				</div>	
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
				</div>
				<!--  end Pagination -->
				
					
			<form id='actionForm' action="/adminNoticeBoard.do" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type="hidden" name="btnStartDate" value='<c:out value="${param.btnStartDate }"/>'>
				<input type="hidden" name="btnEndDate" value='<c:out value="${param.btnEndDate }"/>'> 
				<input type="hidden" name="btnKeyword" value='<c:out value="${param.btnKeyword }"/>'>
				<input type="hidden" name="btnCategory" value='<c:out value="${param.btnCategory }"/>'>
								
				

			</form>
						
					
					
					
				</div>
				
				<!-- 여백 -->
				<div class="col-1"></div>
				
			</div>
		</div>

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



<!-- 글 수정 Modal -->
<div class="modal fade" id="modifyModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg ">
     <form action="/modifyUpdate.do" method="post">
    <div class="modal-content" >
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel" >  
        <input type="text" name="modifyInsertCategory"	id="modify_category">
         </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div id="title" style="border-bottom:1px solid #E4E4E4;">
       		<input class="form-control" name="modifyInsertTitle" id="modify_title" >
    		<input type="hidden" name="modifyInsertNoticeNo" id="modify_boardNo">
    		
        </div>
        
        <div class="write_area">
           
            <textarea class="form-control" name="modifyInsertCont" id="recipient-name">
           		
            </textarea>
          </div>
          
        
      </div>
     
      <div class="modal-footer" style="height:10%; width:100%;padding-right:15px;">
      <hr class="line">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float:right;background-color:#E4E4E4;color:#50401B;border:none;border-radius:10px;">취소</button>
        
        <button type="submit" id="<%=member.getMemberNo() %>" class="btn btn-modifys" style="float:right; background-color:#FFF3D8;color:#50401B;border:none;border-radius:10px;">수정</button>
       
      </div>
   
        </div> <!-- modal-content -->
         </form>
  </div> <!-- modal-dialog -->
</div><!-- Modal-fade -->





	<!--글 작성 Modal -->
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg ">
     <form action="/noticeInsert.do" method="post">
    <div class="modal-content">
 
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel" >
        	<select name="noticeCategory">
        		<option value="" selected disabled hidden>카테고리선택</option>
        		<option value="noticeModal"> 공지사항 작성</option>
        		<option value="faqModal">FAQ</option>
        	</select>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div id="title" style="border-bottom:1px solid #E4E4E4;">
        <input type="text" id="myInput" name="noticeTitle" placeholder="제목을 입력해주세요."/></div>
        
        <div class="write_area">
           
            <textarea class="form-control" id="recipient-name" name="noticeCont"></textarea>
          </div>
          
        
      </div>
     
      <div class="modal-footer" style="height:10%; width:100%;padding-right:15px;">
      <hr class="line">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float:right;background-color:#E4E4E4;color:#50401B;border:none;border-radius:10px;">취소</button>
        <button id="writeSubmit" class="btn btn-primary" style="float:right; background-color:#FFF3D8;color:#50401B;border:none;border-radius:10px;">작성완료</button>
      </div>
     
        </div> <!-- modal-content -->
         </form>
  </div> <!-- modal-dialog -->
</div><!-- Modal-fade -->


								






<%}else{ %>
		
	<script>location.href ="/index.jsp";</script>
						
<%} %>
											


</div> <!-- container -->
<jsp:include page="/common/footer.jsp" flush="true"/>
<script>

</script>



</body>
</html>