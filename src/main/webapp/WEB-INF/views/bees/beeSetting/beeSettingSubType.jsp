<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubType.css">
<title>비즈 설정</title>
</head>
<body>
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
	<main id="content" role="main" class="midContent"data-uiselector="contentRegion"><div data-viewname="DBandTypeConditionView">
	<section class="sSettingBand gContentCardShadow">
	<form action="subTypeSet.do" method="post">
		<div class="uHeaderWrap -h50">
			<header class="header beeHeaderColor">
			<h1 class="title">비즈 공개</h1>
			</header>
		</div>
		<ul class="sSettingList -tbSpace">
		<input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo() %>"/>
		 <%if(beeResult.getBeesPublicYN()=='Y'){ %>
			<li class="sSettingItem _openTypeWrapper plusNoBoard" style="border-top-width: 0;">
				<div class="itemContent">
					<label for="check1" class="label _openTypeLabel -point">비공개
						비즈</label> <span class="subTxt">비즈와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수
						있습니다.</span>
				</div>
				<div class="itemSide">
					<label class="uCheck -checkbox"> <input type="radio"
						id="check1"  class="checkInput _radioOpenType" name="beeType"
						value="secret"> <span class="checkLabel">
							<span class="shape"></span>
					</span>
					</label>
				</div>
			</li>

			<li class="sSettingItem _openTypeWrapper">
				<div class="-flexible">
					<div class="itemContent">
						<label for="check2" class="label _openTypeLabel ">공개 비즈</label> <span
							class="subTxt">누구나 비즈를 검색해 찾을 수 있고, 비즈 소개와 게시글을 볼 수 있습니다.</span>
					</div>
					<div class="itemSide">
						<label class="uCheck -checkbox"> <input type="radio"
							id="check2"  class="checkInput _radioOpenType" name="beeType"
							value="public" checked="ture"> <span class="checkLabel"> <span
								class="shape"></span>
						</span>
						</label>
					</div>
				</div>
			</li>
			<%}else{ %>
			<li class="sSettingItem _openTypeWrapper">
				<div class="itemContent">
					<label for="check1" class="label _openTypeLabel -point">비공개
						비즈</label> <span class="subTxt">비즈와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수
						있습니다.</span>
				</div>
				<div class="itemSide">
					<label class="uCheck -checkbox"> <input type="radio"
						id="check1" class="checkInput _radioOpenType" name="beeType"
						value="secret" checked="ture"> <span class="checkLabel">
							<span class="shape"></span>
					</span>
					</label>
				</div>
			</li>

			<li class="sSettingItem _openTypeWrapper">
				<div class="-flexible">
					<div class="itemContent">
						<label for="check2" class="label _openTypeLabel ">공개 비즈</label> <span
							class="subTxt">누구나 비즈를 검색해 찾을 수 있고, 비즈 소개와 게시글을 볼 수 있습니다.</span>
					</div>
					<div class="itemSide">
						<label class="uCheck -checkbox"> <input type="radio"
							id="check2" class="checkInput _radioOpenType" name="beeType"
							value="public" > <span class="checkLabel"> <span
								class="shape"></span>
						</span>
						</label>
					</div>
				</div>
			</li>
			<%} %>
		</ul>
		<div class="btnFooter">
			<button type="submit" class="uButton -sizeL -confirm _btnConfirm">완료</button>
		</div>
	</form>
	</section>
	</div>
	</main>
</body>
</html>