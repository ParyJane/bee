<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bee 로그인</title>
<%@ include file="/common/cdnLib.jsp"%>
<style>
	* {
		font-family: 'Noto Sans KR', sans-serif;	
	}
	
	body {
		background-color:#F9F9F9;
	}
	
	div {
		box-sizing: border-box;
	}
	
	#header {
		border-top: 5px solid #FFF3D8;
		background-color : white;
	}
	
	.nav {
        width: 500px;
        height: 30px;
        overflow: hidden;
    }
    
    .nav>ul{
        width: 100%;
        height: 100%;
        margin: 0px;
        padding: 0px;
    }
    
    .nav>ul li {
        float: left;
        list-style-type: none;
        width: 33%;
        height: 100%;
        text-align: center;
        color: #50401B;
    }
    
    #sub-content {
    	background-color: white;
    }
    
    #sub-content-title {
    	color: #50401B;
    	font-size: 1.5rem;
    	font-weight:bold;
    }
    
    hr {
    	border: 0;
    	height: 5px;
    	background: #D6D3CA;
    }
    
    .beesImage {
    	border-radius:50px;
    }
    
    .myBees, .recommend {
		text-decoration: none;
		color: #50401B;
		font-weight:bold;
		vertical-align:middle;
	}
	
	.myBees:hover, .recommend {
		color: #50401B;
		font-weight:bold;
		vertical-align:middle;
	}
	
	.makeBeesBtn {
		font-weight: bold;
		text-decoration: none;
		color: #50401B;
		border-radius: 10px;
		background-color: #F7D078;
	}
	
	.viewMoreBtn {
		font-weight: bold;
		text-decoration: none;
		color: white;
		border-radius: 25px;
		background-color: #50401B;
	}
	
	.viewMoreBtn:hover {
		font-weight: bold;
		text-decoration: none;
		color: white;
		border-radius: 25px;
		background-color: #50401B;
	}
    #main-content-title {
    	color: #50401B;
    	font-size: 1.7rem;
    	font-weight:bold;
    }
	
	.categoryImg {
		border-radius:5px;
	}
	
	.beesInfo {
		color: #50401B;
		font-size: 0.8rem;
	}
	
	.recommendCategory {
		color: #50401B;
		font-size: 0.5rem;
		background-color:white;
		border : 1px solid #50401B;
		border-radius:8px;
		padding:2px;
	}
</style>
</head>

<body>
	<div id="header">
		<div class="nav m-auto">
	        <ul>
	        	<!-- 서브헤더 공간 -->
	        	<!-- 
	            <a href="#"><li id="rad1">내 비즈 소식</li></a>
	            <a href="#"><li>인기글</li></a>
	            <a href="#"><li>추천비즈</li></a>
	            -->
	        </ul>
	    </div>
    </div>
    
	<div class="container pt-3">
		<div class="row">
			<div class="col-1">
			</div>
			<div class="col-3 p-0">
				<div id="sub-content" class="container m-0 p-2">
					<!-- 좌측 서브 Content 공간 -->
					<!-- 아래 코드는 비즈검색결과 예시 (지우고 작업) 
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
	
					<div class="row m-0">
						<div class="d-none d-md-block col-md-3 p-1">
							<a href="#">
								<div class="m-auto beesImage" style="width:40px; height:40px;
								background: url('/resources/image/test.jpg') no-repeat;
								background-size: cover;">
								</div>
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
					
					-->
				</div>
			</div>
			<div class="col-7 p-0">
				<div id="main-content" class="container m-0 p-2">
				
					<!-- 우측 메인 Content 공간 -->
					<!-- 아래 코드는 비즈검색결과 예시 (지우고 작업) 
					<div class="row m-0">
						<div class="col-12">
							<span id="main-content-title">카테고리</span>
						</div>
					</div>
					<div class="row m-0">
						<div class="col-4 col-md-4 col-lg-2">
							<a href="#">
								<div class="m-auto categoryImg" style="width:100%; height:80px;
								background: url('/resources/image/hobby_meet.PNG') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
						<div class="col-4 col-md-4 col-lg-2">
							<a href="#">
								<div class="m-auto categoryImg" style="width:100%; height:80px;
								background: url('/resources/image/hobby_study.PNG') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
						<div class="col-4 col-md-4 col-lg-2">
							<a href="#">
								<div class="m-auto categoryImg" style="width:100%; height:80px;
								background: url('/resources/image/hobby_game.PNG') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
						<div class="col-4 col-md-4 col-lg-2">
							<a href="#">
								<div class="m-auto categoryImg" style="width:100%; height:80px;
								background: url('/resources/image/hobby_exercise.PNG') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
						<div class="col-4 col-md-4 col-lg-2">
							<a href="#">
								<div class="m-auto categoryImg" style="width:100%; height:80px;
								background: url('/resources/image/hobby_area.PNG') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
						<div class="col-4 col-md-4 col-lg-2">
							<a href="#">
								<div class="m-auto categoryImg" style="width:100%; height:80px;
								background: url('/resources/image/hobby_etc.PNG') no-repeat;
								background-size: cover;">
								</div>
							</a>
						</div>
					</div>
					
					<div class="row mt-4 m-0">
						<div class="col-12">
							<span id="main-content-title">User님 만을 위한 추천 비즈</span>
						</div>
					</div>
					

					<div class="row mt-1 m-0">
							<div class="d-none d-md-block col-md-2 p-1 py-3">
								<a href="#">
									<div class="m-auto beesImage" style="width:60px; height:60px;
									background: url('/resources/image/profile.png') no-repeat;
									background-size: cover;">
									</div>
								</a>
							</div>
							<div class="col-6 col-md-4 py-2 px-0">
								<a href="#" class="recommend">여행에 미치다</a>
								<span class="recommendCategory">취미</span>
								<br>
								<span class="beesInfo">비즈장 : 이승현</span><br>
								<span class="beesInfo">인원수 : 1002명</span>
							</div>
							<div class="d-none d-md-block col-md-2 p-1 py-3">
								<a href="#">
									<div class="m-auto beesImage" style="width:60px; height:60px;
									background: url('/resources/image/profile.png') no-repeat;
									background-size: cover;">
									</div>
								</a>
							</div>
							<div class="col-6 col-md-4 py-2 px-0">
								<a href="#" class="recommend">여행에 미치다</a>
								<span class="recommendCategory">취미</span>
								<br>
								<span class="beesInfo">비즈장 : 이승현</span><br>
								<span class="beesInfo">인원수 : 1002명</span>
							</div>
					</div>
					
					<div class="row mt-3 m-0">
						<div class="col-12">
							<a class="viewMoreBtn btn w-100 py-2" href="#">+ 더보기</a>
						</div>
					</div>
					-->
					
					
				</div>
			</div>
			<div class="col-1">
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="/resources/js/index.js"></script>
		
</body>
</html>