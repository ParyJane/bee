<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/include/headerAdmin.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

.search_bar{
background-color:#F7D078;
margin-top:15px;
height:60px;

}
#search_title{
font-size: 1.5rem;
color:#50401B;
font-weight:bold;
}
#main-content div{
box-sizing: border-box;
border:0;
padding:0;
display:inline-block;
float:left;

}
#main-content form{
width:100%;

}
.search_bar input{
display:inline-block;
border-radius:30px;
height:38px;
margin:11px 10px;
padding-left:5px;
width:90%;
border:none;
}
.search_bar input:focus{
outline:none;
}

#search_btn{
width:45px;
height:35px;
background-color:white;
border:none;
border-radius:100px;
float:right;
margin:11px 10px 11px 0;
}
#search_btn img{
width:80%;
height:80%;
}
#search_btn:focus{
outline:none;
}
.search_bar select{
border-radius:30px;
height:38px;
display:inline-block;
margin:11px 10px;
width:90%;
border:none;
}
.search_bar select:focus{
outline:none;
}


#write_btn{
float:right;
width:100px;
margin-right:3px;
border:none;
color:#50401B;
font-size:1rem;

}
#write_btn:focus{
outline:none;
}
.admin_header{
width:100%;

}

</style>



</head>
<body>

<div class="container pt-3">
		<div class="row">
			<div class="col-1 p-0"></div>
			
				
			<div class="col-10 p-0" >
					<div id="main-content" class="container" style="margin-left:15px;">
						<div class="row w-100">
							<div class="col-md-12 admin_header" >
								<span id="search_title">공지사항</span>
								<!-- Button trigger modal -->
								
								<button type="button" style="background-color:#F7D078; border-radius:30px;" id="write_btn" class="btn btn-primary" data-toggle="modal" data-target="#myModal" >글작성</button>			
							</div>
						</div>
						<div class="row w-100">
						<form method="get" action="searchbarBtn.do" id="searchForm">
							<div class="col-md-2 w-100 search_bar">
							
								<input type="date" name="btnStartDate" id="startDate" value='<c:out value="${param.btnStartDate }"/>'>
								
								</div>
								<div class="col-md-2 w-100 search_bar">
								
								 <input type="date" name="btnEndDate" id="endDate" value='<c:out value="${param.btnEndDate }"/>'> 
								 </div>
								 
								<div class="col-md-2 w-100 search_bar"> 
								
								<select name="btnCategory">
									<option value=""<c:out value="${param.btnCategory == null ? 'selected': '' }"/>>선택</option>
									<option value="notice"<c:out value="${param.btnCategory eq 'notice' ? 'selected': '' }"/> >공지사항</option>
									<option value="faq"<c:out value="${param.btnCategory eq 'faq' ? 'selected': '' }"/> >FAQ</option>	
									
								</select>
							
								
								
									</div>	
					
							<div class="col-md-6 w-100 search_bar">
								<input type="text" style="width:77%; right:10px;" name="btnKeyword" id="keyword"
								placeholder="제목,내용에 해당하는 검색어를 입력해주세요" value='<c:out value="${param.btnKeyword }"/>'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
								
								<button id="search_btn" ><img src="resources/image/search.png"/></button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
			<div class="col-1 p-0"></div>
		</div>
							


</div> <!-- container -->

<script>
$(document).ready(function(){

	
	$("#searchForm button").on("click",function(e){
		var searchForm = $("#searchForm");
		var sDate = $("#startDate").val();
		var eDate = $("#endDate").val();
		var today = new Date();
		
		sDate = new Date(sDate);
		var fromYear = sDate.getFullYear();
		var fromMonth = sDate.getMonth() + 1;
		var fromDay = sDate.getDate();
		
		
		sDate = fromYear + fromMonth +fromDay;
		
		
		eDate = new Date(eDate);
		var toYear = eDate.getFullYear();
		var toMonth = eDate.getMonth() + 1;
		var toDay = eDate.getDate();
		
		
		
		eDate = toYear + toMonth +  toDay;
		
		
		var todayYear = today.getFullYear();
		var todayMonth = today.getMonth() + 1;
		var todayDay = today.getDate();
		today = todayYear + todayMonth + todayDay;
		console.log(sDate);
		console.log(today);
		console.log(eDate);
		if(sDate > today ){
			console.log(sDate);
			console.log(today);
			alert("검색시작 날짜는 오늘 날짜보다 클 수는 없습니다.");
			
			return false;
		}else if(eDate < sDate){
			console.log(eDate);
			console.log(today);
			alert("검색종료날짜는 검색 시작 날짜보다 커야 합니다.");
			
			return false;
		}
		
		
		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요");
			return false;
		}

		if (!searchForm.find(
				"input[id='keyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}
		if(!searchForm.find(
				"input[id='startDate']").val()) {
			alert("검색 시작 기간을 선택하세요");
			return false;
		}
		if(!searchForm.find(
		"input[id='endDate']").val()) {
		alert("검색 종료 기간을 선택하세요");
		return false;
		}
/*		if(isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)){
			fromYear = 0;
			fromMonth = 0;
			fromDay = 0;
		}
	*/	
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();

		searchForm.submit();
	});
	
	
	

     
     
    
 	
});




</script>



</body>
</html>