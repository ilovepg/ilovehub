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
	/* 첨부파일 리스트 */
	.uploadResult{
		width:100%;
		max-height: 150px;
    	overflow-y: auto;
	}
	.uploadResult ul li{
		padding-bottom:5px;
	}
	 /* 썸네일 스타일 셋팅 */
     #preview{
         z-index: 9999;
         position:absolute;
         border:0px solid #ccc;
         background:#333;
         padding:1px;
         color:#fff;
     }
     /* 첨부이미지 클릭 시 원본이미지 표시창 */
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		/* background-color: gray; */
		z-index: 100;
		background:rgba(255,255,255,0,5);
	}
	.bigPicture{
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.bigPicture img{
		width:600px;
	}
	
	
	.thumb div.fileName{ /* 파일이름이 길경우에는 '....' 표시 */
		width:100%;
		text-overflow: ellipsis;
	    overflow: hidden;
	    white-space: nowrap;
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
														<h2><c:out value="${board.title}"/></h2>
													</div>
												</div>
												<div class="row info" style="margin-bottom: 20px;">
													<div class="col-md-12">
														<span><c:out value="${board.preface.codeExplain}"/></span>
														<span><c:out value="${board.writer}"/></span>
														<span><c:out value="${board.regDate}"/></span>
														<span>조회 수 <c:out value="${board.views}"/></span>
														<span>댓글 수 xx</span>
													</div>
												</div>
												<div class="row" style="margin-bottom: 20px;">
													<div class="col-md-12">
														<div><c:out value="${board.contents}" escapeXml="false"/></div>
													</div>
												</div>

												<!-- 태그 -->
												<div class="row">
													<div class="col-md-12">
														<ul id="tag-list">
															<c:forEach var="tagItem" items="${board.tags}">
																<li>#<c:out value="${tagItem.tag}"/></li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<!-- end of Card -->
										<!-- 썸네일 클릭시 원본이미지 보여주는 부분 -->
										<div class="bigPictureWrapper">
											<div class="bigPicture">
											</div>
										</div>
										<!-- 첨부파일 카드 -->
										<div class="card attachFileCard" style="margin-top: 10px;">
											<div class="card-header">첨부파일</div>
											<div class="card-body">
												<!-- 첨부파일  표시영역 -->
												<div class="row">
													<div class="col-md-12">
														<div class='uploadResult'>
															<ul>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- end of Card -->
										<div class="row" style="float:right; margin-top:5px;">
											<div class="col-md-12 operBtns">
												<button data-oper="list" class="btn btn-primary">목록</button>
												<button data-oper="modify" class="btn btn-warning">수정</button>
												<button data-oper="delete" class="btn btn-danger">삭제</button>
											</div>
										</div>
										<!-- 해당 버튼을 클릭하면 페이지를 이동시켜주는 form (버튼자체에 링크를 처리하기보다 다양한 상황을 처리하기 편하므로 form을 이용)[목록,수정,삭제] -->
										<div class="form-group row">
											<form id="operForm">
												<input type="hidden" name="boardId" value="<c:out value='${board.boardId}'/>">
												<input type='hidden' name='page' value='${cri.page}'>
												<input type='hidden' name='perPageBoardNum' value='${cri.perPageBoardNum}'><%-- 												<input type="hidden" name="type" value="<c:out value='${cri.type}'/>"> --%>
											</form>
										</div>
										<!-- end of buttons -->
										<div class="row" style="clear:both;">
											<div class="col-md-12">
												<hr/>
											</div>
										</div>
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
		<!-- 첨부파일 이미지에 마우스 오버하면 썸네일 보이기 -->
		<script>
			window.addEventListener('DOMContentLoaded', function(){
				const xOffset=10;
				const yOffset=30;
				const uploadResult=document.querySelector(".uploadResult");
				uploadResult.addEventListener("mouseover",function(e){
					const target = e.target;
					if(target.classList[0]=="thumbnail"){
						const body=document.querySelector("body");
						const fileCallPath=target.dataset.filecallpath;
						const html="<p id='preview'><img src=/thumbnail?fileCallPath="+fileCallPath+" width='200px'/></p>";
						body.insertAdjacentHTML('beforeend',html);
						const preview=document.querySelector("#preview");
						preview.style.top=e.clientY+xOffset+document.documentElement.scrollTop+"px";
						preview.style.left=e.clientX+yOffset+document.documentElement.scrollLeft+"px";
// 						preview.style.top=e.offsetX+xOffset+"px";
// 						preview.style.left=e.offsetY+yOffset+"px";
						
					}
				});
				uploadResult.addEventListener("mousemove",function(e){
					const target = e.target;
					if(target.className=="thumbnail"){
						const preview=document.querySelector("#preview");
						preview.style.top=e.clientY+xOffset+"px";
						preview.style.left=e.clientX+yOffset+"px";
					}
				});
				uploadResult.addEventListener("mouseout",function(e){
					const target = e.target;
					if(target.className=="thumbnail"){
						document.querySelector("#preview").remove();
					}
				});
			});
		</script>
		<!-- 첨부파일 일반파일 누르면 다운로드, 이미지파일 누르면 원본파일 보이기 -->
		<script>
			window.addEventListener('DOMContentLoaded', function(){
				document.querySelector(".uploadResult").addEventListener('click', function(e){
					const target=e.target;
					if(target.tagName=="SPAN"){
						fileClickHandler(target);
					}
			    },false);
				
				function fileClickHandler(target){
					const li=target.parentNode.parentNode;
					const imageType=isImage(li.dataset.type)
					if(imageType){ //이미지라면 원본보여주기
						const fileCallPath = encodeURIComponent(li.dataset.path+"/"+li.dataset.uuid+"_"+li.dataset.filename); //썸네일의 경로+전체파일명(uuid포함)
						showOriginalImg(fileCallPath);
					}else{//이미지가 아니라면 다운로드
						self.location = "/download?fileCallPath="+target.dataset.filecallpath;
					}
				}
				
				//표시된 원본이미지 클릭 시 안보이게
				document.querySelector(".bigPictureWrapper").addEventListener('click', function(){
					this.style.display="none";
			    },false);
				//원본이미지 표시
				function showOriginalImg(fileCallPath){
					const bigPictureWrapper = document.querySelector(".bigPictureWrapper");
					const bigPicture = document.querySelector(".bigPicture");
					bigPictureWrapper.style.display="flex";
					bigPicture.innerHTML="<img width='100%' height='100%' src='/orginal?fileCallPath="+fileCallPath+"'>";
				}
				
				//파라미터(item)이 이미지인지 아닌지 판별(MIME타입)  - 중복됨(위에서도씀)
				function isImage(file){
					if(file.indexOf('image') > -1){
						return true;
					}
					return false;
				}
			});
		</script>
		<!-- 초기 로딩 [첨부파일 정보 세팅, 댓글 정보 세팅 등 -->
		<script>
			window.addEventListener('DOMContentLoaded', function(){
				const boardId='<c:out value="${board.boardId}"/>';
				fetch("/articles/files/"+boardId, {
					method: "GET",
			        credentials: "same-origin",
				}).then((response) => {
					if(response.status === 200 || response.status === 201){ //요청성공 시
						return response.json().then(function(files) {
							if(files.length!=0){//첨부파일이 있을 시에만 작동
								files.forEach(function(file,index){
									//DOM
									const attachFileCardDom = document.querySelector(".attachFileCard");
									const attachFileContainer=attachFileCardDom.querySelector(".uploadResult ul");
									//파일정보들
									const uploadPath=file['uploadPath'];
									const uuid=file['uuid'];
									const fileName=file['originalFile'];
									//const fileName=file['originalFile'].substring(0,file['originalFile'].lastIndexOf("."));
									attachFileCardDom.style.display="inherit";
									let html=""; 
									//첨부파일 type에 따라 세팅
									if(isImage(file['fileType'])){ //이미지
										const fileCallPath=encodeURIComponent(uploadPath+"/s_"+uuid+"_"+fileName);
										html += "<li data-path='"+uploadPath+"' data-uuid='"+uuid+"' data-fileName='"+fileName+"' data-type='"+file['fileType']+"'>";
										html += "	<div class='fileOutter'>"
							  		    html += "		<span class='thumbnail' data-fileCallPath="+fileCallPath+">"+fileName+"</span>";
							  		    html += "	</div>";
							  		    html += "</li>";
										/* 
										html+='<div class="thumb">';
										html+='	<img class="icon" src="/thumbnail?fileCallPath='+fileCallPath+'">';
										html+='	<div class="fileName" data-toggle="tooltip" data-placement="top">';
										html+='		<span>' + file['originalFile'] + '</span>';
										html+='	</div>';
										html+='</div>'; */
									}else{ //일반 파일
										const fileCallPath=encodeURIComponent(uploadPath+"/"+uuid+"_"+fileName);
										html += "<li data-path='"+uploadPath+"' data-uuid='"+uuid+"' data-fileName='"+fileName+"' data-type='"+file['fileType']+"'>";
										html += "	<div class='fileOutter'>"
							  		    html += "		<span data-fileCallPath="+fileCallPath+">"+fileName+"</span>";
							  		    html += "	</div>";
							  		    html += "</li>";
									}
									attachFileContainer.insertAdjacentHTML('beforeend',html);
								});
							}
						});
					}else{
						alert('첨부파일 요청 실패!');
					}
				}).catch(error => console.error('error:',error)); //요청에러 시 에러 로그 출력
			});
			
			//파라미터(item)이 이미지인지 아닌지 판별(MIME타입) - 중복됨(위에서도씀)
			function isImage(file){
				if(file.indexOf('image') > -1){
					return true;
				}
				return false;
			}
		</script>
		<!-- 목록, 수정, 삭제 버튼 핸들러들 -->
		<script>
			window.addEventListener('DOMContentLoaded', function(){
				const pageFlag = '<c:out value="${boardType}" />';//tech,noti,free 등등 게시판 타입
				const operForm = document.querySelector("#operForm");
				
				Array.prototype.forEach.call(document.querySelectorAll(".operBtns button"), function(btns) {
					btns.addEventListener('click', function() {
				    	operationFunc(this);
				    },false);
				});
				
				function operationFunc(target){
					event.preventDefault();
					const oper=target.dataset.oper;
					if(oper=="list"){
						operForm.querySelector("input[name='boardId']").remove();
						operForm.setAttribute("action","/articles/"+pageFlag);
						operForm.setAttribute("method","GET");
						operForm.submit();
					}else if(oper=="modify"){
						console.log("modify");
					}else{ //Delete
						console.log("delete");
					}
				}
				
			});
		</script>
</body>
</html>