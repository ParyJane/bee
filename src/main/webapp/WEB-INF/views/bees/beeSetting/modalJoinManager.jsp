<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.BeesUserList"%>
<%@page import="java.util.ArrayList"%>
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
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	ArrayList<BeesUserList> list = (ArrayList<BeesUserList>)request.getAttribute("list");
	ArrayList<BeesUserList> listUser = (ArrayList<BeesUserList>)request.getAttribute("listUser");
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingModalJoinManager.css">
<!-- modal -->
<div class="modal fade" id="myModalJoinManager" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
      <h4 class="modal-title" id="myModalLabel">멤버 선택</h4>      
      </div>
      <div class="modal-body">
      
<div class="leaveMemberList">  
<%  if(listUser.isEmpty()) { %>
<div class="listWrap">
        <ul class="cMemberList"><li data-viewname="DBandBlockMemberItemView" class="uFlexItem">
<span class="body">
    <span class="text -ellipsis">매니저에 추가할 멤버가 없습니다.</span>
</span>
</li></ul>
        <p class="uEmpty _collectionEmptyMsgEl" style="height: 545px; display: none;">
            <span class="gColorGr3 _collectionEmptyMsg"></span>
        </p>
    </div> 
	
<%}else{
	for(BeesUserList bu : listUser){%> 
    <div class="listWrap">
        <ul class="cMemberList"><li data-viewname="DBandBlockMemberItemView" class="uFlexItem">
<span class="body">
    <span class="text -ellipsis"><%=bu.getUserName() %></span>
</span>
<span class="etc">
    <%-- <span class="uCheck  -checkbox ">
            <input type="checkbox" name="toManager" class="checkInput _chkMember" value="<%=bu.getMemberNo() %>" >          
            <span class="checkLabel">
                <span class="shape"></span>
            </span>
     </span> --%>
     <form action="subJoinManagerSet.do" method="post"> 
     <input type="hidden" id="beesNo" name="beesNo" value="<%=bu.getBeesNo()%>"/>
     <input type="hidden" id="memberNo" name="memberNo" value="<%=bu.getMemberNo()%>"/>  
     <button type="submit" class="uButton -sizeS -confirm2 beesModalDo">추가</button>
     </form>
</span></li></ul>
        <p class="uEmpty _collectionEmptyMsgEl" style="height: 545px; display: none;">
            <span class="gColorGr3 _collectionEmptyMsg"></span>
        </p>
    </div> 
<%} 
}%> 
</div>
      </div>   
      <div class="modal-footer" style="margin: 0 auto;">
         <button type="button" onclick="location.href='/beeSettingSubJoinManager.do?beesNo=<%=beeResult.getBeesNo()%>'" class="uButton -sizeS -confirm2 beesModalCancle">취소</button>       
      </div>   
    </div>  
  </div>
</div>

</body>
</html>