<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>iloveHub</title>
<!-- BootStrap -->
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">
<!-- <link rel="stylesheet" href="css/reset.css"> -->
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/main_menu.css">
<link rel="stylesheet" href="/resources/css/font-awesome.css">
<link rel="stylesheet" href="/resources/css/main_banner.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<link rel="stylesheet" href="/resources/css/main_section.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<style>
.main-content-wrapper .main-content-inner {
	padding: 20px 0px 4px 0px;
}

.main-content-inner .card input[type=text] {
	border-width: 0;
	border: 1px solid transparent;
	border-bottom: 1px solid #ccc;
	border-radius: 3px;
	background-color: #fff;
	padding: 0.375rem 0.75rem;
	line-height: 1.5;
	height: 2.75em;
}

.main-content-inner .card label.header, .main-content-inner .card h3 {
	margin-bottom: 0.25em;
	padding: 0.25em 0.5em;
/* 	opacity: 0.75; */
	font-size: 1.17em;
	font-weight: bold;
	display: inline;
}
/* 제목아래 게시글정보 첫번째 span빼고 앞에 | 넣는 css */
.info span:not(:first-child):before{
	content: "|";
    font-size: 0.75em;
    color: #aaa;
    padding: 0 1em;
    vertical-align: 0.15em;
}
/* 태그 관련 */
#tag-list {
	padding: 16px 0;
}

#tag-list li {
	display: inline-block;
	margin: 0 5px;
	font-size: 12px;
	letter-spacing: -.5px;
}

#tag-list li.tag-item {
	padding: 4px 8px;
	background-color: #777;
	color: #000;
}

.tag-item:hover {
	background-color: #262626;
	color: #fff;
}

.tag-del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
}

/* 파일 업로드 관련 */
/* 파일 노멀버튼 변경 */
.btn-file{
	position: relative;
	overflow: hidden;
}
.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity=0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
/* 파일 썸네일 및 프로그래스 바 */
.thumb { 
	width:25%; 
	padding-top: 25%;
	float:left; 
	position:relative; 
	margin-right:30px;
}
.thumb > img.icon {
	width:100%; 
	max-width: 100%; 
	height: auto;
	max-height:75%;
	position:absolute;
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
}
.thumb > .close {
	width:20px; 
	height:20px; 
	cursor:pointer; 
	opacity:10;
	position:absolute;
}
.thumb div.fileName{ /* 파일이름이 길경우에는 '....' 표시 */
	width:100%;
	text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
.fileUploadprogress{
	width:100%;
}
</style>
</head>

<body>
	<%@include file="../includes/mainMenu.html"%>
	<%@include file="../includes/mainBanner.html"%>
	<div class="container">
		<div class="row">
			<!-- Level1 -->
			<div class="col-lg-12">
				<div class="row">
					<!-- Level2 -->
					<div class="col-md-3" style="padding: 0;">
						<!-- sidebar -->
						<aside id="sidebar">
							<!-- Login -->
							<div class="login-area">
								<button type="button" class="btn btn-outline-danger btn-block">Login</button>
							</div>
							<div class="login-help">
								<a class="sign-up" href="#"><i class="fa fa-user"></i>회원가입</a> <a
									class="find-login-info" href="#">ID/PW찾기</a>
							</div>
							<!-- Social Login -->
							<div class="login-help" style="margin-top: 10px;">
								<a><i class="fa fa-users"></i>소셜 로그인</a>
								<div class="login-sns-icon">
									<ul class="pure-list">
										<li><a href="#"><i class="fa fa-github"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-facebook-square"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"
												aria-hidden="true"></i></a></li>
									</ul>
								</div>
							</div>
							<!-- Study Recent Post -->
							<div class="recent-post">
								<h4>
									<span class="title-square"></span> <a href="#">Study 최신글</a>
								</h4>
								<div class="tab-container">
									<div id="study-recent">
										<ul class="nav nav-pills">
											<li id="study-new-post-tab" class="nav-item tab-item-50">
												<a class="nav-link active" href="#">최신글</a>
											</li>
											<li id="study-new-reply-tab" class="nav-item tab-item-50">
												<a class="nav-link" href="#">최신댓글</a>
											</li>
										</ul>
									</div>
									<div class="tab-inner">
										<div id="study-new-post-document"
											class="tab-content tab-active">
											<ul class="pure-list">
												<li><a href="#">
														<p class="tabs-thumb">
															<img
																src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725"
																alt="">
														</p>
														<p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
														<p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
												</a></li>
												<li><a href="#">
														<p class="tabs-thumb">
															<img
																src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725"
																alt="">
														</p>
														<p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
														<p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
												</a></li>
												<li><a href="#">
														<p class="tabs-thumb">
															<img
																src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725"
																alt="">
														</p>
														<p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
														<p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
												</a></li>
												<li><a href="#">
														<p class="tabs-thumb">
															<img
																src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725"
																alt="">
														</p>
														<p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
														<p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
												</a></li>
												<li><a href="#">
														<p class="tabs-thumb">
															<img
																src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725"
																alt="">
														</p>
														<p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
														<p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
												</a></li>
											</ul>
										</div>
										<div id="study-new-reply-document" class="tab-content">
											<ul class="pure-list">
												<li><a href="#">
														<p>
															<span class="tabs-content2">로고 변경하는거 어려울거 같았는데..
																이거 보니까 좀...</span> <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
														</p>
												</a></li>
												<li><a href="#">
														<p>
															<span class="tabs-content2">로고 변경하는거 어려울거 같았는데..
																이거 보니까 좀...</span> <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
														</p>
												</a></li>
												<li><a href="#">
														<p>
															<span class="tabs-content2">로고 변경하는거 어려울거 같았는데..
																이거 보니까 좀...</span> <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
														</p>
												</a></li>
												<li><a href="#">
														<p>
															<span class="tabs-content2">로고 변경하는거 어려울거 같았는데..
																이거 보니까 좀...</span> <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
														</p>
												</a></li>
												<li><a href="#">
														<p>
															<span class="tabs-content2">로고 변경하는거 어려울거 같았는데..
																이거 보니까 좀...</span> <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
														</p>
												</a></li>
												<li><a href="#">
														<p>
															<span class="tabs-content2">로고 변경하는거 어려울거 같았는데..
																이거 보니까 좀...</span> <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
														</p>
												</a></li>
												<li><a href="#">
														<p>
															<span class="tabs-content2">로고 변경하는거 어려울거 같았는데..
																이거 보니까 좀...</span> <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
														</p>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</aside>
						<!-- ./end of sidebar -->
					</div>
					<!-- Level2 -->
					<div class="col-md-9" style="padding: 0;">
						<!-- main content -->
						<div class="main-content-wrapper">
							<div class="row">
								<div class="col-md-12" style="padding: 0 15px 0 45px;">
									<div class="main-content-inner">
										<p>게시판</p>
										<div class="card">
											<div class="card-header">상세보기[변경필요]</div>
											<div class="card-body">
												<div class="row" style="margin-bottom:10px;">
													<div class="col-md-12">
														<h2>제목</h2>
													</div>
												</div>
												<div class="row info" style="margin-bottom: 20px;">
													<div class="col-md-12">
														<span>id</span>
														<span>regDate</span>
														<span>조회 수 xx</span>
														<span>댓글 수 xx</span>
													</div>
												</div>
												<div class="row" style="margin-bottom: 20px;">
													<div class="col-md-12">
														<div>게시글 내용이 들어감</div>
													</div>
												</div>

												<!-- 태그 -->
												<div class="row">
													<div class="col-md-12">
														<ul id="tag-list">
															<li>#태그</li>
															<li>#내용이</li>
															<li>#들어감</li>
														</ul>
													</div>
												</div>
												<!-- 게시글 설정 -->
												
											</div>
										</div>
										<!-- end of Card -->

										<!-- 첨부파일 카드 -->
										<div class="card" style="margin-top: 10px;">
											<div class="card-header">첨부파일</div>
											<div class="card-body">
												<div class="row">
													<div class="col-md-12">
														<div class="panel panel-default">
															<!-- <div class="panel-heading">
																<h3>첨부파일</h3>
															</div> -->
															<!-- /.panel-heading -->
															<div class="panel-body upload-panel">
																<div class="uploadDiv">
																	<label class="btn btn-primary btn-file">
																		업로드<input name="uploadFile" type="file" multiple/>
																	</label>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- 첨부파일 업로드 결과 -->
												<div class="row">
													<div class="col-md-12">
														<div id="thumbnails">
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- end of Card -->
									</div>
								</div>
							</div>
							<!-- ./end of main content -->
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../includes/footer.html"%>
		<!-- 
			서버에서 온 값 JSTL로 받아준다.
			JS를 나누면(import) JSTL에 접근하지 못하므로 <input hidden>에 넣으려다가 이런식으로 넣는다.
			아래에서 import하는 write_common.js에서 사용하는 변수들
		 -->
		<script>
			<!-- noti,free,tech 등등과 같은 게시판 종류 -->
			const pageFlag = '<c:out value="${board}" />';
			<!-- noti,free,tech 등등과 같은 게시판 종류에 따른 게시판코드 -->
			const classificationCode = '<c:out value="${bcvo.classificationCode}" />';
		</script>
</body>
</html>