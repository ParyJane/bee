<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bee 로그인</title>
<%@ include file="/common/cdnLib.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/beesSearchResult.css">
</head>
<body>
	<div id="header">
		<div class="nav m-auto">
			<ul>
				<a href="#"><li id="rad1">비즈 검색 결과</li></a>
				<a href="#"><li>게시글</li></a>
			</ul>
		</div>
	</div>
	<div class="container pt-3">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3 p-0">
				<div id="sub-content" class="container p-2 w-75 m-auto">
					<div class="row m-0">
						<div class="col-12">
							<span id="sub-content-title">My Bees</span>
						</div>
					</div>
					<div class="row m-0">
						<div class="col-12">
							<hr class="my-1">
						</div>
					</div>
					<!-- 반복 -->
					<div class="row m-0">
						<div class="d-none d-md-block col-md-3 p-1">
							<a href="#">
								<div class="m-auto beesImage" style="width: 30px; height: 30px; background: url('/resources/image/test.jpg') no-repeat; background-size: cover;"></div>
							</a>
						</div>
						<div class="col-12 col-md-9 py-2 px-0">
							<a href="#" class="myBees">여행에 미치다</a>
						</div>
					</div>
					<!-- 반복 -->
					<div class="row m-0">
						<div class="d-none d-md-block col-md-3 p-1">
							<a href="#">
								<div class="m-auto beesImage" style="width: 30px; height: 30px; background: url('/resources/image/test.jpg') no-repeat; background-size: cover;"></div>
							</a>
						</div>
						<div class="col-12 col-md-9 py-2 px-0">
							<a href="#" class="myBees">여행에 미치다</a>
						</div>
					</div>
					<div class="row m-0">
						<div class="d-none d-md-block col-md-3 p-1">
							<a href="#">
								<div class="m-auto beesImage" style="width: 30px; height: 30px; background: url('/resources/image/test.jpg') no-repeat; background-size: cover;"></div>
							</a>
						</div>
						<div id="myBees-nameBox" class="col-12 col-md-9 py-2 px-0">
							<a href="#" class="myBees">여행에 미치다</a>
						</div>
					</div>
					<div class="row m-0">
						<div class="d-none d-md-block col-md-3 p-1">
							<a href="#">
								<div class="m-auto beesImage" style="width: 30px; height: 30px; background: url('/resources/image/test.jpg') no-repeat; background-size: cover;"></div>
							</a>
						</div>
						<div class="col-12 col-md-9 py-2 px-0">
							<a href="#" class="myBees">여행에 미치다</a>
						</div>
					</div>
					<div class="row m-0">
						<div class="col-12 py-2">
							<a class="makeBeesBtn btn w-100 py-2" href="#">+ 비즈 만들기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-7 p-0">
				<div id="main-content" class="container m-0 p-2">
					<div class="row mt-4 m-0">
						<div class="col-12">
							<span id="main-content-title">비즈 검색 결과</span>
						</div>
					</div>
					<div class="row mt-1 m-0" style="background-color:white">
						<!-- 반복 -->
						<% for(int i=0; i<10; i++) {%>
						<div class="d-none d-md-block col-md-2 p-1 py-3">
							<a href="#">
								<div class="m-auto beesImage" style="width: 60px; height: 60px; background: url('/resources/image/profile.png') no-repeat; background-size: cover;"></div>
							</a>
						</div>
						<div class="col-6 col-md-4 py-2 px-0">
							<a href="#" class="recommend">여행에 미치다</a> <span class="recommendCategory">취미</span> <br> <span class="beesInfo">비즈장 : 이승현</span><br> <span class="beesInfo">인원수 : 1002명</span>
						</div>
						<%} %>
					</div>
					<div class="row mt-3 m-0">
						<div class="col-12">
							<a class="viewMoreBtn btn w-100 py-2" href="#">+ 더보기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/index.js"></script>
</body>
</html>