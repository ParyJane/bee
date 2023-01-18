<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.member.model.vo.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bee 비즈 만들기</title>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeCreate/beeCreateSub.css">
</head>
<body>
<main id="content" data-uiselector="regionContent" role="main" class="" style="min-height: 800px;">
<section data-viewname="DGroupBandCreateView" class="bandMake">
<form action="/beeCreate.do" class="_form" method="post" enctype="multipart/form-data">
    <fieldset>
        <legend class="gSrOnly">비즈 만들기</legend>
        <div class="makeCover">
            <h2 class="title">비즈 이름</h2>
            <div class="uInput -simpleLine inputBand">
                <label class="gSrOnly" for="ex_name">여행을 좋아하는 사람들</label>
                <input type="text" class="_inputBandName" id="beeName" name="beeName" maxlength="50" placeholder="비즈 이름을 입력해주세요">
            </div>
<%
	String category = request.getParameter("category");
    Member sessionMember = (Member)session.getAttribute("member");
%>        
            <div class="coverSelect">
                <div class="mainCover">
                    <span class="cover">      
                        <img id="image_section" name="image_section" src="#" data-cover="/resources/image/beeCreate/hobby1.png" 
                         class="_selectedCover coverImg" width="300" height="225" alt="" onError="javascript:this.src='/resources/image/beeCreate/hobby1.png'">         
                    	<input type="hidden" id="beeCoverImage" name="beeCoverImage" value="/resources/image/beeCreate/hobby1.png"/>
                    	<input type="hidden" id="category" name="category" value="<%=category%>"/>
                    	<input type="hidden" id="beesHost" name="beesHost" value="<%=sessionMember.getMemberId()%>"/>
                    	<input type="hidden" id="beesHostNo" name="beesHostNo" value="<%=sessionMember.getMemberNo()%>"/>
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
            <div class="makeNoticeArea">
                <p class="makeNoticeText">비즈이름과 사진은 개설 후에도 변경할 수 있어요</p>
            </div>         
        </div>
   <div class="makeType">
            <h2 class="title">비즈 공개</h2>
            <div class="bandType">
                <div class="bandTypeListWrap gBoxShadow">
                    <ul class="typeList ">
                        <li class="typeListItem">
                            <label for="secret" class="uCheck -checkbox">
                                <input type="radio" value="secret" name="beeType" id="secret" class="checkInput">
                                <span class="checkLabel">
                                <span class="shape"></span>
                                <span class="text">
                                    <strong>비공개 비즈</strong>
                                    <span class="msg">비즈와 게시글이 공개되지 않습니다.<br> 초대를 통해서만 가입할 수 있습니다.</span>
                                </span>
                            </span>
                            </label>
                        </li>
                    <li class="typeListItem">
                        <label for="public" class="uCheck -checkbox">
                            <input type="radio" value="public" name="beeType" id="public" class="checkInput">
                            <span class="checkLabel">
                                <span class="shape"></span>
                                <span class="text">
                                    <strong>공개 비즈</strong>
                                    <span class="msg">누구나 비즈를 검색해 찾을 수 있고,<br> 비즈 소개와 게시글을 볼 수 있습니다.</span>
                                </span>
                            </span>
                            </label>
                        </li>
                    </ul>               
                </div>

            </div>
        </div>
        <div class="btnFooter">
            <button type="button" onclick="location.href='/myBeesPage.do?memberNo=<%=sessionMember.getMemberNo() %>'" class="_btnCancel uButton -sizeXL -cancel">취소</button>
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
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	 
	$('.data-cover').click(function(){
		var coverSrc = $(this).attr("data-cover");
		jQuery("#image_section").attr("src", coverSrc);
		jQuery("#beeCoverImage").attr("value", coverSrc);
	});

</script>
</body>
</html>