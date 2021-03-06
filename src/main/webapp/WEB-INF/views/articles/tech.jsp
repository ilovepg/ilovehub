<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		.main-content-inner table{
		    width: 100%;
		    border-spacing: 0;
		    border-collapse: collapse;
		    font-size: inherit;
		}
		table{
		    font-size: 12px;
		    margin-top: 25px;
		    line-height: 1.5;
		}
		.main-tbl tr.content{
			cursor:pointer;
		}
		.main-tbl th{
		    padding: 9px 12px;
		    border-top: 1px solid #CCC;
		    border-bottom: 1px solid #BBB;
		    box-shadow: inset 0 -1px 0 #FFF;
		    color: #555;
		    font-size: 11px;
		    text-align: center;
		    white-space: nowrap;
		}
		.main-tbl td{
		    padding: 8px 12px;
		    font-size: 11px;
		    text-align: center;
		    white-space: nowrap;
		    border-bottom: 1px solid #EEE;
		}
		.main-tbl .top td{
		    background: #F9F9F9;
		    border-color: #DDD;
		}
		.main-tbl td.title{
		    text-align: left;
		    font-size: 12px;
		    white-space: nowrap;
		    word-break: break-all;
		}
		.main-tbl .title{
		    padding-right: 6px;
		    width: 100%;
		}
		/* 페이지네이션 커스템 */
		.custom-pagination a{
		    color: black;
		}
		/* 정렬팝업창 */
		.a-popover{
			font-size: 0.9em;
			position: absolute;
			border: 1px solid #ccc;
			text-align: center;
			background-color:#fff;
			z-index:20;
			transition:all ease-in-out 0.2s;
			width:calc(100% + 2em);
		}
		.a-popover ul{
			list-style: none;
			padding: 5px 5px 5px 5px;
			margin: 0;
		}
		.a-popover.order{
			left: -0.5em;
		}
		.a-popover ul li:hover{
			color:#3a3a3a;
			background-color:#eee;
		}
	</style>
</head>

<body>
	<%@include file="../includes/mainMenu.html" %>
	<%@include file="../includes/mainBanner.html" %>
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
                                    <a class="sign-up" href="#"><i class="fa fa-user"></i>회원가입</a>
                                    <a class="find-login-info" href="#">ID/PW찾기</a>
                                </div>
                                <!-- Social Login -->
                                <div class="login-help" style="margin-top: 10px;">
                                    <a><i class="fa fa-users"></i>소셜 로그인</a>
                                    <div class="login-sns-icon">
                                        <ul class="pure-list">
                                            <li><a href="#"><i class="fa fa-github" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- Study Recent Post -->
                                <div class="recent-post">
                                    <h4>
                                        <span class="title-square"></span>
                                        <a href="#">Study 최신글</a>
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
                                            <div id="study-new-post-document" class="tab-content tab-active">
                                                <ul class="pure-list">
                                                    <li>
                                                        <a href="#">
                                                            <p class="tabs-thumb">
                                                                <img src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725" alt="">
                                                            </p>
                                                            <p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
                                                            <p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="tabs-thumb">
                                                                <img src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725" alt="">
                                                            </p>
                                                            <p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
                                                            <p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="tabs-thumb">
                                                                <img src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725" alt="">
                                                            </p>
                                                            <p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
                                                            <p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="tabs-thumb">
                                                                <img src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725" alt="">
                                                            </p>
                                                            <p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
                                                            <p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="tabs-thumb">
                                                                <img src="https://studyforus.com/files/thumbnails/184/585/45x45.crop.jpg?20190708004725" alt="">
                                                            </p>
                                                            <p class="text-title">24. 메탄올과 에탄올 듀오였츄</p>
                                                            <p class="text-content">실로 오랜만이네요 ㄷㄷ 오...</p>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div id="study-new-reply-document" class="tab-content">
                                                <ul class="pure-list">
                                                    <li>
                                                        <a href="#">
                                                            <p>
                                                                <span class="tabs-content2">로고 변경하는거 어려울거 같았는데.. 이거 보니까 좀...</span>
                                                                <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
                                                            </p>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p>
                                                                <span class="tabs-content2">로고 변경하는거 어려울거 같았는데.. 이거 보니까 좀...</span>
                                                                <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
                                                            </p>
                                                        </a>
                                                    </li>
                                                    <li>
	                                                    <a href="#">
	                                                        <p>
	                                                            <span class="tabs-content2">로고 변경하는거 어려울거 같았는데.. 이거 보니까 좀...</span>
	                                                            <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
	                                                        </p>
	                                                    </a>
                                                    </li>
                                                    <li>
	                                                    <a href="#">
	                                                        <p>
	                                                            <span class="tabs-content2">로고 변경하는거 어려울거 같았는데.. 이거 보니까 좀...</span>
	                                                            <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
	                                                        </p>
	                                                    </a>
                                                    </li>
                                                    <li>
	                                                    <a href="#">
	                                                        <p>
	                                                            <span class="tabs-content2">로고 변경하는거 어려울거 같았는데.. 이거 보니까 좀...</span>
	                                                            <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
	                                                        </p>
	                                                    </a>

                                                    </li>
                                                    <li>
	                                                    <a href="#">
	                                                        <p>
	                                                            <span class="tabs-content2">로고 변경하는거 어려울거 같았는데.. 이거 보니까 좀...</span>
	                                                            <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
	                                                        </p>
	                                                    </a>

                                                    </li>
                                                    <li>
	                                                    <a href="#">
	                                                        <p>
	                                                            <span class="tabs-content2">로고 변경하는거 어려울거 같았는데.. 이거 보니까 좀...</span>
	                                                            <span class="tabs-date2">&nbsp;&nbsp;2019-08-06</span>
	                                                        </p>
	                                                    </a>
                                                    </li> 
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
                                            <p>기술정리 게시판</p>
                                            <table class="main-tbl table-hover">
                                                <thead>
                                                    <tr>
                                                        <th></th>  <!-- 분류 -->
                                                        <th>제목</th>
                                                        <th>작성자</th>
                                                        <th>작성일</th>
                                                        <th>조회</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="top content">
                                                        <td>공지</td>
                                                        <td class="title">사이트가 복구되었습니다.</td>
                                                        <td>마스터</td>
                                                        <td>7시간 전</td>
                                                        <td>1089</td>
                                                    </tr>
                                                    <tr class="top content">
                                                        <td>공지</td>
                                                        <td class="title">포인트 제도가 생겼습니다!</td>
                                                        <td>마스터</td>
                                                        <td>2019.12.30</td>
                                                        <td>1054</td>
                                                    </tr>
                                                    <c:forEach var="board" items="${list}">
                                                     <tr class="content" data-id="${board.boardId}">
                                                		<td><c:out value="${board.preface.codeExplain}"/></td>
                                                        <td class="title"><c:out value="${board.title}"/></td>
                                                        <td><c:out value="${board.writer}"/></td>
                                                        <td><c:out value="${board.regDate}"/></td>
                                                        <td><c:out value="${board.views}"/></td>
                                                     </tr>
                                                	</c:forEach>
                                                </tbody>
                                            </table>
                                            <!-- 정렬 -->
                                            <div style="margin-top:10px;">
                                            	<span class="pull-left" style="position:relative; margin-top:5px;">
                                            		<a id="orderSelector" class="a-btn-special">정렬</a>
                                            		<div id="a-btn-order-popup" class="a-popover order" style="display:none;">
                                            			<ul>
                                            				<li class="order-item" data-code="date" onClick="orderItemClickHandler(this);"><i class="fa fa-check" aria-hidden="true"></i>날짜순</li>
                                            				<li class="order-item" data-code="view" onClick="orderItemClickHandler(this);">조회순</li>
                                            				<li class="order-item" data-code="reply" onClick="orderItemClickHandler(this);">댓글순</li>
                                            			</ul>
                                            		</div>
                                            	</span>
                                            	
                                            	<!-- 검색 -->
                                            	<form id="searchForm"
													class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
													<div class="input-group mb-3">
														<select class="form-control" name='searchType' >
															<option value="">-----</option>
															<option value="T">제목</option>
															<option value="C">내용</option>
															<option value="W">작성자</option>
															<option value="TC">제목 OR 내용</option>
															<option value="TW">제목 OR 작성자</option>
															<option value="TWC">제목 OR 내용 OR 작성자</option>							
														</select>						
														<input type="text" class="form-control" name="keyword" style="min-width:350px; max-width:500px;">
														<input type='hidden' name='page' value='${pageMaker.cri.page}'>
														<input type='hidden' name='perPageBoardNum' value='${pageMaker.cri.perPageBoardNum}'>
														<button class='btn btn-primary'>검색</button>
													</div>
												</form>
                                            	<a style="color:white;" href="${boardType}/new-form" class="btn btn-success pull-right">쓰기</a>
                                            </div>
                                            <!-- 페이지네이션 -->
                                            <ul class="pagination justify-content-center custom-pagination" style="margin-top: 20px;">
                                            	<c:if test="${pageMaker.prev}">
													<li class="page-item"><a class="page-link" href="1">&lt;&lt;</a></li>
													<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">&lt;</a></li>
												</c:if>
												<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
													<li class="page-item  ${pageMaker.cri.page == num ? "active":""} "><a  class="page-link" href="${num}">${num}</a></li>
												</c:forEach>
												<c:if test="${pageMaker.next}">
													<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">&gt;</a></li>
													<li class="page-item"><a class="page-link" href="${pageMaker.realEndPage}">&gt;&gt;</a></li>
												</c:if>
                                            </ul>
                                            <form id='actionForm' method='GET'>
                                            	<input type='hidden' name='page' value='${pageMaker.cri.page}'>
												<input type='hidden' name='perPageBoardNum' value='${pageMaker.cri.perPageBoardNum}'>
												<input type='hidden' name='searchType' value='<c:out value="${pageMaker.cri.searchType}"/>'>
												<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
                                            </form>
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
	
	<%@include file="../includes/footer.html" %>
	<!-- 페이지 이동관련 -->
	<script>
		window.addEventListener('DOMContentLoaded', function(){
			const actionForm=document.querySelector("#actionForm");
			const pageItems = document.querySelectorAll(".page-item a");
			const pageFlag = '<c:out value="${boardType}" />'; //tech,noti,free 등등 게시판 타입
			for(let i=0; i<pageItems.length; i++){
				pageItems[i].addEventListener("click", function(e) {movePage(this); }, false);
			}
			
			function movePage(target){
				event.preventDefault();
				const page=target.getAttribute("href");
				actionForm.querySelector("input[name='page']").value=page;
				actionForm.setAttribute("action","/articles/"+pageFlag);
				actionForm.submit();
			}
		});
	</script>
	<!-- 컨텐츠 이동관련 -->
	<script>
		window.addEventListener('DOMContentLoaded', function(){
			const actionForm=document.querySelector("#actionForm");
			const pageFlag = '<c:out value="${boardType}" />';//tech,noti,free 등등 게시판 타입
			Array.prototype.forEach.call(document.querySelectorAll(".main-tbl tr.content"), function(trs) {
			    trs.addEventListener('click', function() {
			    	moveDetail(this);
			    },false);
			});
			
			function moveDetail(target){
				event.preventDefault();
				const id=target.dataset.id;
				actionForm.setAttribute("action","/articles/"+pageFlag+"/"+id);
				actionForm.submit(); 
			}
		});
	</script>
	<!-- 정렬과 검색관린 기능  -->
    <script>
        let currentOrder="date"; //정렬 (처음에는 날짜순)) [date(날짜순),view(조회순),reply(댓글순)]
        window.onload = function(){
        	//정렬
            const orderSelector=document.querySelector("#orderSelector"); //정렬 a버튼
            const orderPopup=document.querySelector("#a-btn-order-popup");//정렬 선택 팝업

            orderSelector.addEventListener("click",function(){ //'정렬' 클릭하였을 때
                orderPopup.style.display="block";
                event.stopPropagation();//상위 태그로 이벤트 전파 X
            });

            document.addEventListener("click",function(){ //다른곳 클릭하였을 때 열려있는 팝업을 모두 닫는다.
                orderPopup.style.display="none";
            });
            
            //검색
            const searchForm=document.querySelector("#searchForm"); //검색폼
            const searchFormBtn=searchForm.querySelector("button"); //검색버튼
            searchFormBtn.addEventListener("click", ()=> {goSearchHandler(searchForm);} );//검색버튼 클릭 이벤트
            
          	//검색 후 검색조건들을 그대로 세팅
            const searchType='<c:out value="${pageMaker.cri.searchType}"/>';
            const keyword='<c:out value="${pageMaker.cri.keyword}"/>';
            searchForm.querySelector("select option[value='"+searchType+"']").setAttribute("selected","selected"); //검색타입 세팅
            searchForm.querySelector("input[name=keyword]").value=keyword;
        }

        //'정렬 팝업의 li태그' 클릭하였을 때
        function orderItemClickHandler(liThis){
            const orderItem = document.querySelectorAll(".order-item");
            if(liThis.dataset.code==currentOrder){ //같은것을 선택하였다면 그대로 종료
                return ;
            }

            orderItem.forEach(element => {
                if(element.dataset.code==currentOrder){ //기존에 선택되어있던 정렬방식을 찾는다.
                    const iNode = element.querySelector("i"); //i태그를 찾는다.
                    element.removeChild(iNode); //i태그를 지워준다.
                    
                    liThis.insertBefore(iNode, liThis.childNodes[0]);
                    currentOrder=liThis.dataset.code;
                    return ;
                }
            });
        }
        
        //검색버튼 클릭 시 이벤트
        function goSearchHandler(searchForm){
        	const select=searchForm.querySelector("select");
        	const keyword=searchForm.querySelector("input[name=keyword]");
        	
        	console.log(select.options[select.selectedIndex].value);
        	if(select.options[select.selectedIndex].value==""){
        		alert('검색종류를 선택해주세요.');
        		event.preventDefault();
        		return false;
        	}
        	
        	if(keyword.value==""){
        		alert('키워드를 입력해주세요.');
        		event.preventDefault();
        		return false;
        	}
        	//검색버튼을 클릭 하면 무조건 1페이지로 가게한다.
        	searchForm.querySelector("input[name=page]").value=1;
        	searchForm.setAttribute("action","/articles/"+pageFlag);
        	searchForm.submit();
        }
    </script>
</body>
</html>