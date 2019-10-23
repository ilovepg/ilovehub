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
	opacity: 0.75;
	font-size: 1.17em;
	font-weight: bold;
	display: inline;
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
.thumb { width:70px; padding:5px; float:left; position:relative;}
.thumb > img:nth-child(even) { width:100%; }
.thumb > img:nth-child(odd) { } 
.thumb > .close {
	width:20px; 
	height:20px; 
	cursor:pointer; 
	opacity:10;
	position:absolute;
	left:45px;
	top:-1px;
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
											<div class="card-header">글쓰기</div>
											<div class="card-body">
												<div class="row" style="margin-bottom: 20px;">
													<div class="col-md-12">
														<label class="header" for="preface">분류</label>
														<select name="preface" required="required"
														data-error="Please select one option.">
															<option value="">선택해주세요.</option>
															<c:forEach var="item" items="${bpvos}">
																<option value="<c:out value='${item.code}'/>"><c:out value='${item.codeExplain}'/></option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="row" style="margin-bottom:10px;">
													<div class="col-md-12">
														<h3>제목</h3>
														<input type="text" name="title" style="width: 100%;"
															placeholder="제목을 입력해 주세요." />
													</div>
												</div>

												<div class="row" style="margin-bottom: 20px;">
													<div class="col-md-12">
														<textarea name="contents" id="editor" rows="25"></textarea>
														<!-- <textarea id="summernote" class="summernote" name="editordata"></textarea> -->
													</div>
												</div>

												<!-- 태그 등록 -->
												<div class="row">
													<div class="col-md-12">
														<h3>태그</h3>
														<input type="text" id="tag" style="width: 100%;"
															placeholder="태그 [엔터, 스페이스바를 이용하여 등록]">
													</div>
												</div>
												<!-- 태그 등록 결과 -->
												<div class="row">
													<div class="col-md-12">
														<ul id="tag-list"></ul>
													</div>
												</div>
												<!-- 게시글 설정 -->
												<div class="row">
													<div class="col-md-12">
														<h3>게시글 설정</h3>
														<br>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<span> <label for="is_public" class="">공개</label> 
															<input type="checkbox" name="is_public" checked="checked" value="y">
														</span> <span> <label for="permit_reply" class="">댓글허용</label>
															<input type="checkbox" name="permit_reply" value="y" checked="checked">
														</span>
													</div>
												</div>
												<!-- submit 버튼 -->
												<div class="row">
													<div class="col-md-12">
														<button style="float: right;"
															class="btn btn-outline-danger" id="writeActBtn">등록</button>
													</div>
												</div>
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
															<div class="panel-heading">
																<h3>첨부파일</h3>
															</div>
															<!-- /.panel-heading -->
															<div class="panel-body">
																<div class="uploadDiv">
																	<input name='uploadFile' type='file' multiple/>
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
														<!-- <div class='uploadResult'>
															<ul></ul>
														</div> -->
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
		<!-- ckeditor 호출 -->
		<script src="/resources/external_lib/ckeditor/ckeditor.js"></script>
		<!-- submit, 초기작업 js호출 -->
		
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
		<script src="/resources/js/custom/write_common.js"></script>
		
		<!-- File Upload 관련 -->
		<script>
			const regex = new RegExp("(.*?)\.(exe|sh|alz)$"); //제외시킬 확장자명 정규식
		  	const maxSingleFileSize = 20971520; //20MB 하나의 파일이 업로드될 수 있는 최대 크기
		  	const maxFilesSize = 52428800; //50MB 모든 파일크기가 이 값을 넘을 순 없다.
		  	let sumFilesSize=0; //파일 예외처리 할 때 모든 파일 사이즈의 합
		  	
			window.addEventListener('DOMContentLoaded', function(){
				const inputFile = document.querySelector("input[name='uploadFile']");
				inputFile.addEventListener("change",fileUploadHandler);
			});
			
			//파일 업로드 핸들러 함수
			function fileUploadHandler(){
				const files = this.files;
				sumFilesSize=0; //파일 업로드함수가 호출될 때 마다 이 값은 초기화 되어야한다.
				
				const formData = new FormData();
				for(let i=0; i<files.length; i++){ //예외처리
					if(!checkExtension(files[i].name, files[i].size)){
						console.log("file upload failed:"+files[i].name)
						return false;
					}
					previewHandler(files[i],i);
					formData.append("uploadFile",files[i]);
				}
				fileUplaod(formData);
			}
			
			//실제로 파일 업로드하는 함수
			function fileUplaod(formData){
				const url = '/files'
				const xhr = new XMLHttpRequest();
				xhr.upload.onprogress = function (e){
					let percent = e.loaded * 100 / e.total;
					//console.log(`file:${percent}`);
					console.log("file:"+percent);
				}
				xhr.onload=function(){
					if (xhr.status === 200 || xhr.status === 201) {
					    console.log(xhr.responseText);
					}else {
						console.error(xhr.responseText);
					}
				};
				xhr.open('post', url, true);
	            xhr.send(formData);
			}
			
			function previewHandler(file,idx){
				const type = file.type;
				console.log("file type:"+type);
				if(type.indexOf('image')>-1)
					previewImage(file,idx);
				else
					previewFile(file,idx,type);
				
			}
			
			//파일 썸네일 생성
			function previewFile(file,idx,type){
				let icon="";
				if(type.indexOf('ms-excel')>-1 || type.indexOf('spreadsheetml')>-1)
					icon='<img src="/resources/icon/excel-240.png" />';
				else if(type.indexOf('presentationml.presentation')>-1)
					icon='<img src="/resources/icon/powerpoint-240.png" />';
				else if(type.indexOf('wordprocessingml.document')>-1)
					icon='<img src="/resources/icon/word-240.png" />';
				else if(type.indexOf('text/html')>-1)
					icon='<img src="/resources/icon/HTML-512.png" />';
				else
					icon='<img src="/resources/icon/File-512.png" />';
				
				let html = '<div class="thumb"> \
					<img class="close" src="/resources/icon/file_del-256.png" data-idx="' + idx + '"/> \
						' + icon + ' \
					</div>';
					/* html = '<div class="thumb"> \
						<div class="close" data-idx="' + idx + '">X</div> \
							' + icon + ' \
						</div>'; */
				$("#thumbnails").append(html);
			}
			
			//이미지 썸네일 생성
			function previewImage(file,idx){
				const reader = new FileReader();
				reader.onload=(function(f,idx){
					return function(e){
						//바닐라 자바스크립트로 짠 코드는 EverNode 코드모음 노트북에 있으니 보려면 거기로 가야함.						
						//문자열의 뒤에 '\' 를 사용한것은 es5 형식의 멀티 라인 문자열을 의미합니다. '\' 뒤에는 space를 포함한 아무런 문자가 없어야 합니다.
						 let html = '<div class="thumb"> \
							 	<progress value="0" max="100" ></progress> \ 
// 							 	<img class="close" src="/resources/icon/file_del-256.png" data-idx="' + idx + '"/> \
								<img src="' + e.target.result + '" /> \
							</div>';
						$("#thumbnails").append(html);
					}	
				})(file, idx);
				reader.readAsDataURL(file);
			}
			
			//파일 예외처리 함수
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSingleFileSize){ //단일 파일 사이즈 측정
					alert(`${fileName} 파일 사이즈 초과 ${fileSize} / ${maxSingleFileSize}`);
					console.log(`${fileName} 파일 사이즈 초과 ${fileSize}/${maxSingleFileSize}`);
		  			return false;
		  		}
		  		if(regex.test(fileName)){ //파일의 확장자명 검사
		  			alert(`${fileName}과 같은 확장자는 업로드할 수 없습니다.`);
		  			console.log(`${fileName}과 같은 확장자는 업로드할 수 없습니다.`);
		  			return false;
		  		}
		  		sumFilesSize+=fileSize;
		  		if(sumFilesSize>=maxFilesSize){
		  			alert(`모든 파일의 합이 최대 용량을 초과합니다. ${sumFilesSize}/${maxFilesSize}`);
		  			console.log(`모든 파일의 합이 최대 용량을 초과합니다. ${sumFilesSize}/${maxFilesSize}`);
		  			return false;
		  		}
		  		return true;
			}
			
		</script>
</body>
</html>