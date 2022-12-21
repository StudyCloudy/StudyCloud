<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

 #main { 
 	margin-top: 60px; 
   	padding: 20px 30px; 
   	transition: all 0.3s; 
} 

 @media (max-width: 1199px) { 
   #main { 
     padding: 20px; 
   } 
 } 

 /* 메인 타이틀 */
 .pagetitle { */
   margin-bottom: 10px; 
 } 

 .pagetitle h1 { 
   font-size: 24px; 
   margin-bottom: 0; 
 } 

/* 헤더 */
.header {
	display: flex;
	align-items: center;
}

.container-fluid {
	padding-left: 0;
}

.logo {
	display: flex;
	align-items: center;
}

.logo img {
  max-height: 50px;
  margin-right: 6px;
}

#logo {
  max-height: 60px;
  margin-right: 6px;
}

.header { /* 헤더 지우면안댐 */
  height: 60px;
  box-shadow: 0px 2px 20px rgba(1, 41, 112, 0.1);
  background-color: #fff; /* 헤더 색상 */
  padding-top: 5px;
}

@media (max-width: 1199px) { /* 지우면 안댐 */
  .header .search-bar {
    position: fixed;
    top: 50px;
    left: 0;
    right: 0;
    padding: 20px;
    box-shadow: 0px 0px 15px 0px rgba(1, 41, 112, 0.1);
    background: white;
  }

}

.header .search-form { /* 지우며ㅑㄴ안댐 */
  width: 100%;
}

.header .search-form button { /* 지우면안댐 */
  border: 0;
  padding: 0;
  margin-left: -30px;
  background: none;
}

/* 버튼 */
#btnLogout {
	background-color: #6cc4dc;
	border-radius: 10px;
	color: white;
	padding: 5px;
	margin-top: 20px;
	border: none;
}


/* 사이드바 */
.sidebar {
  position: fixed;
  top: 60px; /* 헤더에서 내려오는 정도 */
  left: 0;
  bottom: 0;
  width: 300px;
  transition: all 0.3s;
  padding: 20px;
  scrollbar-width: thin;
  scrollbar-color: #aab7cf transparent;
  box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
  background-color: #fff;
}

@media (max-width: 1199px) {
  .sidebar {
    left: -300px;
  }
}

.sidebar::-webkit-scrollbar {
  width: 5px;
  height: 8px;
  background-color: #fff;
}

@media (min-width: 1200px) {

  #main,
  #footer {
    margin-left: 300px;
  }
}

@media (max-width: 1199px) {
  .toggle-sidebar .sidebar {
    left: 0;
  }
}

@media (min-width: 1200px) {

  .toggle-sidebar #main,
  .toggle-sidebar #footer {
    margin-left: 0;
  }

  .toggle-sidebar .sidebar {
    left: -300px;
  }
}

.sidebar-nav {
  padding: 0;
  margin: 0;
  list-style: none;
}

/* 사이드바 폰트 */
#sidebarMenu {
  padding: 0;
  margin: 0;
  margin: 10px;
  list-style: none;
  cursor: pointer;
}

#sidebarMenu > a {
	display: flex;
	align-items: center;
	padding: 10px 15px;
	font-size: 16px;
	font-weight: bold;
/*   z-index: 9999; */
  
}

#sidebarMenu > a:hover { /* 메뉴 hover시 */
	color:  #6cc4dc;
}

.sidebar-nav .nav-link.collapsed {
/*   color: #012970; */
/*   background: #fff; */
}

.sidebar-nav .nav-content {
  padding: 5px 0 0 0;
  margin: 0;
  list-style: none;
}

#memberNick {
	margin: 0 auto;
	padding-top: 20px;
}

#menu-wrap {
   padding-left: 10px;
}

#welcome {
	padding-left: 100px;
}


/* 메인페이지 이동 링크 */
#mainLink {
	text-decoration: none;
	color: #6cc4dc;
}

#mainLink:hover {
	color: #3f92b7;
}

</style>

<script type="text/javascript">
/* 페이지 이동 */
$(document).ready(function() {
	$("#btnMento").click(function() {
		location.href = "/admin/mento"
	})
})

$(document).ready(function() {
	$("#btnStudy").click(function() {
		location.href = "/admin/study"
	})
})

$(document).ready(function() {
	$("#btnStudyroom").click(function() {
		location.href = "/admin/studyroom"
	})
})

$(document).ready(function() {
	$("#btnQna").click(function() {
		location.href = "/admin/qna"
	})
})

$(document).ready(function() {
	$("#btnReserve").click(function() {
		location.href = "/admin/reserve"
	})
})

$(document).ready(function() {
	$("#btnMember").click(function() {
		location.href = "/admin/member"
	})
})

</script>

</head>
<body>

<header class="header fixed-top" id="header">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <!-- studyCloud 이미지 -->
                <a href="/admin/main">
                	<img class="navbar-brand name" id="logo" src="/resources/img/Logo.png" />
                </a>

                <!-- 메뉴바 -->
                <div class="collapse navbar-collapse" id="menu-wrap">
                    <ul class="navbar-nav me-auto mb-lg-0">
                        <li class="nav-item" id="welcome">
                        	${member_nick } 님 안녕하세요
                        </li>
                    </ul>
                    
                    <div>
                       <ul class="navbar-nav me-auto" id="btnMenu">
                          <li class="nav-item"><a class="nav-link" href="/mainpage" id="mainLink">메인페이지로 > </a></li>
                          <li class="nav-item"><a class="nav-link" href="/admin/logout">로그아웃</a></li>
                       </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header><!-- header end -->
<!-- 사이드바 -->
<section id="sidebar" class="sidebar">

	<div class="container">
		
		<ul class="sidebar-nav" id="sidebar-nav">
		
			<li class="nav-item" id="sidebarMenu">
				<a href="/admin/main" class="nav-link" >
				  <span>홈</span>
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnMento" class="nav-link collapsed" data-bs-toggle="collapse">
				  멘토 등록
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnStudy" class="nav-link collapsed" data-bs-toggle="collapse">
				  스터디 등록
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnStudyroom" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>스터디룸 등록</span>
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnQna" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>QnA 관리</span>
				</a>
			</li>

			<li class="nav-item" id="sidebarMenu">
				<a id="btnReserve" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>예약 관리</span>
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnMember" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>회원 관리</span>
				</a>
			</li>
			
		</ul>
  
	</div><!-- container end -->

</section>

</body>
</html>