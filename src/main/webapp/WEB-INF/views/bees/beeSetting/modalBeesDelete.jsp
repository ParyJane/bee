<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>	
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> 
<title>비즈 설정</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>


<style>
* {
	box-sizing: border-box;
}
button:focus { outline:none; }
#myModalLabel {
    font-size: 19px;
    color: #6D6042;
    margin: auto;
    font-weight: normal;
}
.modal-header .close {
    padding: 1rem 1rem;
    margin: -1rem -1rem -1rem auto;
}
button.close {
    padding: 0;
    background-color: transparent;
    border: 0; 
}
.modal-body >span {
    font-size: 1rem;
    color: #6D6042;
    font-weight: bold;
    text-align: center;
}
.modal-footer {
    display: flex;
    flex-wrap: wrap;
    text-align: center;
    margin: auto;
    flex-shrink: 0;
    align-items: center;
    justify-content: flex-end;
    padding: .75rem;
    border-top: 0px ;
    border-bottom-right-radius: calc(.3rem - 1px);
    border-bottom-left-radius: calc(.3rem - 1px);
}
.modal-body {
    position: relative;
    flex: 1 1 auto;
    padding: 1rem;
    border-bottom: 1px solid #dee2e6;
}
.modal-body {
    position: relative;
    flex: 1 1 auto;
    padding: 2rem 2rem;
    border-bottom: 1px solid #dee2e6;
}
#url{
width : 100%;
background-color :#F9F9F9;
border : 1px solid #E8E8E8;
font-size : 14px;
color : #6D6042;
margin-top : 5%;
margin-bottom : 5%;
}

#closeBtn{
color : #F7D078;
}

#withDraw{
background-color : #50401B;
border-radius : 50px;
border : none;
margin-right: 41%;
}
.subTxtbeesWithdraw {
    display: block;
    margin-top: 6px;
    font-size: 0.8rem;
    font-weight: 400;
    color: #666;
}
.subTxt.beesWithdraw{
text-align: inherit;
}
.uButton.-confirm2.beesModalCancle{
	border: 1px solid #50401B;
    background-color: #FFFFFF;
    color: #50401B;
}
.uButton.-confirm2.beesModalDo{
	border: 0px;
    background-color: #50401B;
    color: #FFFFFF;
}
</style> 
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	Member sessionMember = (Member)session.getAttribute("member");
%>
<!-- modal -->
<div class="modal fade" id="myModalBeesDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
      <h4 class="modal-title" id="myModalLabel">비즈 삭제</h4>      
      </div>
      <div class="modal-body">
       <span>비즈 삭제 전에 꼭 확인하세요</span>
       <span class="subTxt beesWithdraw">비즈를 삭제하시겠습니까?<br>
       	삭제 후에는 복구가 불가능합니다.</span>      	
      </div>   
      <div class="modal-footer">
         <button type="button" onclick="location.href='/beeSettingMain.do?beesNo=<%=beeResult.getBeesNo()%>'" class="uButton -sizeS -confirm2 beesModalCancle">아니오 </button> 
         <form action="/beeSettingSubOneDelete.do" method="post">
         <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo()%>"/>
         <input type="hidden" id="memberNo" name="memberNo" value="<%=sessionMember.getMemberNo()%>"/>
         <button type="submit" class="uButton -sizeS -confirm2 beesModalDo">예</button>
         </form>
      </div> 
    </div>
  </div>
</div>
</body>
</html>