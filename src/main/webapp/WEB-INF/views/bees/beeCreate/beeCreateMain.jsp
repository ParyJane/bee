<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bee 비즈 만들기</title>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeCreate/beeCreateMain.css">
</head>

<body>
<main id="content" data-uiselector="regionContent" role="main" class=""><div data-viewname="DGroupBandCreationSetView" class="bandMakeUsecaseArea gMat50" style="min-height: 800px;">
<h2 class="title">만들고 싶은 모임을 선택하세요.</h2>

<ul class="usecaseList">
	
	<li class="usecaseItem">
		<a href="/beeCreateSub.do?category=meet" class="usecaseItemLink _createType" data-type="" data-usecase="취미, 동호회" data-type2="">
			<span class="iconUscase"><img src="/resources/image/beeCreate/취미.PNG" alt="취미, 동호회"></span>
			<em class="uscaseName">취미, 동호회</em>		
		</a>
	</li>
	
	<li class="usecaseItem">
		<a href="/beeCreateSub.do?category=study" class="usecaseItemLink _createType" data-type="secret" data-usecase="스터디" data-type2="">
			<span class="iconUscase"><img src="/resources/image/beeCreate/스터디.PNG"  alt="스터디"></span>
			<em class="uscaseName">스터디</em>
			
		</a>
	</li>
	
	<li class="usecaseItem">
		<a href="/beeCreateSub.do?category=game" class="usecaseItemLink _createType" data-type="" data-usecase="게임" data-type2="">
			<span class="iconUscase"><img src="/resources/image/beeCreate/게임.PNG"  alt="게임"></span>
			<em class="uscaseName">게임</em>
			
		</a>
	</li>
	
	<li class="usecaseItem">
		<a href="/beeCreateSub.do?category=exercise" class="usecaseItemLink _createType" data-type="" data-usecase="운동 모임" data-type2="">
			<span class="iconUscase"><img src="/resources/image/beeCreate/운동.PNG"  alt="운동 모임"></span>
			<em class="uscaseName">운동</em>
			
		</a>
	</li>
	
	<li class="usecaseItem">
		<a href="/beeCreateSub.do?category=area" class="usecaseItemLink _createType" data-type="" data-usecase="지역 모임" data-type2="">
			<span class="iconUscase"><img src="/resources/image/beeCreate/지역.PNG"  alt="지역 모임"></span>
			<em class="uscaseName">지역</em>
			
		</a>
	</li>
	
	<li class="usecaseItem">
		<a href="/beeCreateSub.do?category=etc" class="usecaseItemLink makeLink _createType">
			<span class="iconUscase"><img src="/resources/image/beeCreate/직접만들기.PNG"  alt="직접만들기 모임"></span>
			<em class="uscaseName">직접 만들기</em>
		</a>
	</li>
</ul>

</div></main>
</body>
</html>