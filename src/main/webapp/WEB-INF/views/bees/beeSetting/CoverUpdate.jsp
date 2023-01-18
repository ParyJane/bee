<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 설정</title>
</head>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/coverUpdate.css">
<body>
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
<main id="content" data-uiselector="regionContent" role="main" class=""><section data-viewname="DGroupBandCreateView" class="bandMake">
<form action="coverUpdateSet.do" class="_form" method="post" enctype="multipart/form-data">
    <fieldset>
        <legend class="gSrOnly">비즈 만들기</legend>
        <div class="makeCover">
            <h2 class="title">비즈 이름</h2>
            <div class="uInput -simpleLine inputBand">
                <label class="gSrOnly" for="ex_name"><%=beeResult.getBeesName() %></label>
                <input type="text" value="<%=beeResult.getBeesName() %>" class="_inputBandName" id="beeName" name="beeName" maxlength="50" placeholder="<%=beeResult.getBeesName() %>">
            </div>
            

            <div class="coverSelect">
                <div class="mainCover">
                    <span class="cover">      
 <% 
    String coverPath = beeResult.getBeesCover();	
    if(coverPath.endsWith("_bee")){
    	
 %>   
 						<img id="image_section" src="\resources\image\beeCreateProfile\<%=coverPath%>" data-cover="/resources/image/beeCreate/hobby1.png" 
                         class="_selectedCover coverImg" width="300" height="225" alt="" onError="javascript:this.src='/resources/image/beeCreate/hobby1.png'">         
                    	<input type="hidden" id="beeCoverImage" name="beeCoverImage" value="\resources\image\beeCreateProfile\<%=coverPath%>"/>
                    	<input type="hidden" id="choiceCover" name="choiceCover" value="1"/>
                    
                 
 <%}else{ %>                
                        <img id="image_section" src="<%=beeResult.getBeesCover()%>" data-cover="/resources/image/beeCreate/hobby1.png" 
                         class="_selectedCover coverImg" width="300" height="225" alt="" onError="javascript:this.src='/resources/image/beeCreate/hobby1.png'">         
                    	<input type="hidden" id="beeCoverImage2" name="beeCoverImage2" value="<%=beeResult.getBeesCover()%>"/>
                    	<input type="hidden" id="choiceCover" name="choiceCover" value="2"/>
                    	
 <%} %>                   	
                    	
                    	<input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo() %>"/>
                    </span>
                </div>
                <div class="coverList">
                    <div class="head">
                        <h3>커버 선택</h3>                 
                    </div>

                    <ul class="list">
                        <li>
                           <span class="changeCover _coverImageUploader js-fileapi-wrapper">
                                <span>사진 추가</span>
                                <input type="file" id="imgInput" name="imgInput" class="imageUpload" title="추가" accept="image/*" name="attachment">
                            </span>
                        </li>
        
            
                         <li class="_coverSet_0" style="">
                            
                            <a href="#" class="data-cover" data-cover="/resources/image/beeCreate/hobby1.png" class="_defaultCovers cover ">
                                <img class="coverImg" src="/resources/image/beeCreate/hobby1.png" width="120" height="90" alt="취미">
                                <span class="mask"></span>
                            </a>
                            
                        </li>
            
                        <li class="_coverSet_0" style="">
                            
                            <a href="#" class="data-cover" data-cover="/resources/image/beeCreate/meet1.png" class="_defaultCovers cover ">
                                <img class="coverImg" src="/resources/image/beeCreate/meet1.png" width="120" height="90" alt="모임">
                                <span class="mask"></span>
                            </a>
                            
                        </li>
            
                        <li class="_coverSet_0" style="">
                            
                            <a href="#" class="data-cover" data-cover="/resources/image/beeCreate/study1.png" class="_defaultCovers cover ">
                                <img class="coverImg" src="/resources/image/beeCreate/study1.png" width="120" height="90" alt="스터디">
                                <span class="mask"></span>
                            </a>
                            
                        </li>
            
                        <li class="_coverSet_0" style="">
                            
                            <a href="#" class="data-cover" data-cover="/resources/image/beeCreate/nature2.png" class="_defaultCovers cover ">
                                <img class="coverImg" src="/resources/image/beeCreate/nature2.png" width="120" height="90" alt="지역">
                                <span class="mask"></span>
                            </a>
                            
                        </li>
            
                        <li class="_coverSet_0" style="">
                            
                            <a href="#" class="data-cover" data-cover="/resources/image/beeCreate/nature1.png" class="_defaultCovers cover ">
                                <img class="coverImg" src="/resources/image/beeCreate/nature1.png" width="120" height="90" alt="풍경">
                                <span class="mask"></span>
                            </a>
                            
                        </li>
            
                        <li class="_coverSet_0" style="">
                            
                            <a href="#" class="data-cover" data-cover="/resources/image/beeCreate/game1.png" class="_defaultCovers cover ">
                                <img class="coverImg" src="/resources/image/beeCreate/game1.png" width="120" height="90" alt="게임">
                                <span class="mask"></span>
                            </a>
                            
                        </li>
            
                        <li class="_coverSet_0" style="">
                            
                            <a href="#" class="data-cover" data-cover="/resources/image/beeCreate/exercise1.png" class="_defaultCovers cover on">
                                <img class="coverImg" src="/resources/image/beeCreate/exercise1.png" width="120" height="90" alt="운동">
                                <span class="mask"></span>
                            </a>
                            
                        </li>   
                    </ul>
                </div>
            </div>          
        </div>
   
        <div class="btnFooter">
            <button type="button" onclick="location.href='/beeSettingMain.do?beesNo=<%=beeResult.getBeesNo() %>'" class="_btnCancel uButton -sizeXL -cancel">취소</button>
            <button type="submit" class="_btnConfirm uButton -sizeXL -disabled">완료</button>
        </div>
    </fieldset>
</form></section></main>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function() {
	    $("#imgInput").on('change', function(){
	        readURL(this);
	        console.log(readURL);
	    });
	});
	
	function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#image_section').attr('src', e.target.result);
	   $('#beeCoverImage').attr('value', e.target.result);
	   $('#beeCoverImage2').attr('value', e.target.result);
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	 
	$('.data-cover').click(function(){
		var coverSrc = $(this).attr("data-cover");
		jQuery("#image_section").attr("src", coverSrc);
		jQuery("#beeCoverImage").attr("value", coverSrc);
		jQuery("#beeCoverImage2").attr("value", coverSrc);
	});
</script>
</body>
</html>