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
</head>
<body>
	<%@include file="includes/mainMenu.html" %>
	<%@include file="includes/mainBanner.html" %>
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
                                    <div class="col-xs-12 col-md-6">
                                        <div class="main-widget-wrapper">
                                            <div class="main-content-title">
                                                <h4>공지사항</h4>
                                                <a href="#" class="more">더보기</a>
                                            </div>
                                            <div id="main-notice">
                                                <ul class="pure-list">
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                              		  사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <div class="main-widget-wrapper">
                                            <div class="main-content-title">
                                                <h4>뉴스/팁</h4>
                                                <a href="#" class="more">더보기</a>
                                            </div>
                                            <div id="main-notice">
                                                <ul class="pure-list">
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                              		  사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <div class="main-widget-wrapper">
                                            <div class="main-content-title">
                                                <h4>자유게시판</h4>
                                                <a href="/articles/free" class="more">더보기</a>
                                            </div>
                                            <div id="main-notice">
                                                <ul class="pure-list">
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                                	사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                              		  사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <div class="main-widget-wrapper">
                                            <div class="main-content-title">
                                                <h4>기술정리</h4>
                                                <a href="/articles/tech" class="more">더보기</a>
                                            </div>
                                            <div id="main-notice">
                                                <ul class="pure-list">
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                              		  사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                                		사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                    <a href="#">
                                                        <p class="list-title">
                                                            <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                            <span class="date">2019-06-19</span>
                                                        </p>
                                                    </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <p class="list-title">
                                                                <span class="title-arrow"></span>
                                                               		 사이트 정보 등록에 경고로 변경...
                                                                <span class="date">2019-06-19</span>
                                                            </p>
                                                        </a> 
                                                    </li>
                                                </ul>
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
	<%@include file="includes/footer.html" %>
</body>
</html>