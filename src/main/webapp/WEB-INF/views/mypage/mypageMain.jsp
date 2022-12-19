<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp"%> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<style type="text/css" >

* {
	margin: 0;
	padding: 0;
	}

body {
	min-height: 100vh
	}

.container { 
	margin-top: 80px;
	margin-bottom: 80px;
	position: relative;
	z-index: 100;
	}
	
.card-wrap {
	margin: -4.2%;
	padding: 50px;
}
	
.container .row .card {
	width: 250px;
	height: 300px;
	margin: 30px;
	background: rgba(255, 255, 255, 0.1);
	overflow: hidden;
	backdrop-filter: blur(5px);
	border-top: 1px solid rgba(255, 255, 255, 0.5);
	border-left: 1px solid rgba(255, 255, 255, 0.5);
	border-radius: 15px;
	cursor: pointer;
	text-align: center;
	}

.container .row .card .card-body {
	padding: 1rem 1.2rem;
	color: #323232;
	}
	
.container .row .card .card-body .card-img img { 
	width: 60px;
	height: 60px;
	object-fit: cover;
	transform: translateY(50px);
	transition: 0.5s;
	border-radius: 50%;
	}
	
.container .row .card .card-body .name {
	transform: translateY(50px);
	transition: 0.5s
	}
	
.container .row .card .card-body .testimonial {
	font-size: 0.9rem;
/* 	pointer-events: none; */
	transform: translateY(10px);
	transition: 0.5s;
	opacity: 0 
	}

.container .row .card:hover .card-body .testimonial, .container .row .card:hover .card-body .name, .container .row .card:hover .card-body .card-img img {
	transform: translateY(0px);
	opacity: 1
	}
	
@media(max-width: 991.5px) {

	body::after {
		clip-path: circle(40% at 10% 50%)
		}
	body::before {
		clip-path: circle(50% at right -10%)
		}
	}

a { 
     color: #323232; 
     padding: 0.375rem 0.5rem; 
     font-weight: 400; 
     text-decoration: none; 
 } 

a:hover {
	color: #3F92B7;
}

</style>
</head>


<body>


<div class="container">
    <div class="row">
        <div class="col-lg-4 d-flex justify-content-center card-wrap">
            <div class="card">
                <div class="card-body text-center">
                    <div class="card-img pt-2 pb-3"> <img src="https://img.icons8.com/dusk/512/circled-user-male-skin-type-3.png" alt=""> </div>
                    <div class="name h5">회원 프로필</div><br>
                   <a href="/mypage/edit" class="testimonial">회원 정보 수정</a><br><br>
                   <a href="/message" class="testimonial">내 쪽지함</a><br><br>
                   <a href="/withdrawal" class="testimonial">회원 탈퇴</a>
                    
                </div>
            </div>
        </div>
        <div class="col-lg-4 d-flex justify-content-center card-wrap">
            <div class="card">
                <div class="card-body text-center">
                    <div class="card-img pt-2 pb-3"> <img src="https://img.icons8.com/dusk/512/conference-call.png" alt=""> </div>
                    <div class="name h5"><a href="/mystudy">참여중인 스터디</a></div><br>
                    <div class="testimonial">나의 멘토</div><br>
                    <div href="" class="testimonial">나의 스터디</div><br>
                    <div href="" class="testimonial">온라인 스터디</div><br>
                </div>
            </div>
        </div>
        <div class="col-lg-4 d-flex justify-content-center card-wrap">
            <div class="card">
                <div class="card-body text-center">
                    <div class="card-img pt-2 pb-3"> <img src="https://img.icons8.com/external-sbts2018-outline-color-sbts2018/512/external-wishlist-black-friday-5-sbts2018-outline-color-sbts2018.png" /> </div>
                    <div class="name h5">찜 목록</div><br>
                 	<a href="/wishlist" class="testimonial">위시리스트</a><br><br>
                 	<a href="/likelist" class="testimonial">좋아요</a><br><br>
                    
                </div>
            </div>
        </div>
        <div class="col-lg-4 d-flex justify-content-center card-wrap">
            <div class="card">
                <div class="card-body text-center">
                    <div class="card-img pt-2 pb-3"> <img src="https://img.icons8.com/cotton/512/card-in-use.png" /> </div>
                    <div class="name h5"><a href="/reservationlist">예약 내역 </a></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<%@ include file="../layout/footer.jsp" %>
</html>