<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2.2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 파비콘 적용 -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon-32x32.png">
<link rel="/manifest" href="/site.webmanifest">

<style type="text/css">

/* 전체 폰트 적용 */
@font-face {
    font-family: 'paybooc';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
   margin: 0;
   padding: 0;
    font-family: 'paybooc';
}

/* 헤더 메뉴 */
#logo { /* 로고 이미지 */
   height: 70px;
}

#btnLogin:hover{
    background-color:#000;
}

#btnLogin:focus{
    box-shadow:none;
    outline:none;
}

.nav-item {
   padding: 0 10px;
}

#menu { /* 메뉴바 폰트 */
   font-size: 16px;
   font-weight: bold;
}

#menu:hover {
   color: #6cc4dc;
}

.community { /* 커뮤니티 폰트 */
   font-weight: bold;
}

.community a:hover {
   color: #6cc4dc;
}

#menu-wrap {
   padding-top: 38px; /* 로고랑 위치 정렬 */
   padding-left: 10px;
}

#memberNick { /* 회원 닉네임 */
   padding-top: 8px; /* 로고랑 위치 정렬 */
   padding-left: 8px;
   margin: 0 auto;
   font-size: 14px;
   font-weight: 600;
   color: #0000008C;
}


#btnMenu { /* 로그인/회원가입/마이페이지 */
   font-size: 14px;
   color: #6cc4dc;
   padding: 0;
   margin: 0 auto;
}

#btnMenu > .nav-item {
   padding: 0;
}

/* 드롭다운 메뉴 */
.dropdown:hover .dropdown-menu {
    display: flex;
   font-size: 14px;
}

.dropdown-item:hover {
   color: #6cc4dc;
}

</style>


</head>
<body>


<header>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <!-- studyCloud 이미지 -->
                <a href="/mainpage">
                	<img class="navbar-brand name" id="logo" src="/resources/img/Logo.png" />
                </a>
                
                <!-- 토글 -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <!-- 메뉴바 -->
                <div class="collapse navbar-collapse" id="menu-wrap">
                    <ul class="navbar-nav me-auto mb-lg-0">
                        <li class="nav-item"> <a class="nav-link" id="menu" href="/mtboard/list">멘토 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link" id="menu" href="/mntboard/list">멘티 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link" id="menu" href="/sboard/main">스터디 찾기</a> </li>

                        <li class="nav-item dropdown community">
                            <a class="nav-link dropdown menu" id="navbarDropdown menu" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/freeBoard/list">자유게시판</a></li>
                                <li><a class="dropdown-item" href="/mboard/main">번개게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"> <a class="nav-link" id="menu" href="/sRoom/list">스터디 공간 대여</a> </li>
                    </ul>
                    
                    <div>
                       <ul class="navbar-nav me-auto" id="btnMenu">
                       
                          <!-- 비로그인 상태 -->
                          <c:if test="${empty login }">
                          <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                          <li class="nav-item"><a class="nav-link" href="/join">회원가입</a></li>
                          <li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
                          </c:if>
                          
                          <!-- 로그인 상태 -->
                          <c:if test="${not empty login }">
                          <li class="nav-item"><p id="memberNick">${member_nick } 님, 환영합니다.</p></li>
                          <li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
                          <li class="nav-item"><a class="nav-link" href="/login/logout">로그아웃</a></li>
                          </c:if>
                          
                       </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header><!-- header end -->

</body>
</html>