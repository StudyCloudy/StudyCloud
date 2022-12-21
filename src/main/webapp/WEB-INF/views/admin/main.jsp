<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/b9a24d1314.js" crossorigin="anonymous"></script>

<style type="text/css">

/* 메인 바디 색상 */
body {
  background: #e3eff9;
}

#main {
	margin-top: 60px;
  	padding: 20px 30px;
  	transition: all 0.3s;
}


/* 메인 타이틀 */
.pagetitle {
  margin-bottom: 10px;
}

.pagetitle h1 {
  font-size: 24px;
  margin-bottom: 0;
  font-weight: bold;
}


/* 카드 */
.card {
  margin-bottom: 30px;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
}

.card-header,
.card-footer {
  border-color: #ebeef4;
  background-color: #fff;
  color: #798eb3;
  padding: 15px;
}

.card-title {
  padding: 20px 0 15px 0;
  font-size: 18px;
  font-weight: bold;
  color: #012970;
}

.card-title span { /* TODAY */
  color:  #3f92b7;
  font-size: 18px;
  font-weight: bold;
}

.card-body {
/*   padding: 0 20px 20px 20px; */
  padding: 20px;
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
/*     z-index: 9999; */
    transition: 0.3s;
    visibility: hidden;
    opacity: 0;
  }

/*   .header .search-bar-show { */
/*     top: 60px; */
/*     visibility: visible; */
/*     opacity: 1; */
/*   } */
}

/* 투데이 어플라이 */
.applyWrap {
	align-items: center;
}

.applyCnt {
	font-size: 48px;
	color: black;
	font-weight: 100;
	text-align: center;
	padding-top: 30px;
}

.applyText {
	font-size: 16px;
	color:  #3f92b7;
	font-weight: bold;
	text-align: right;
}

/* 테이블 */
th {
	text-align: center;
}

/* 폰트어썸 reply 아이콘 */
.fa-reply {
	color: #6cc4dc;
}

/* 캘린더 */
.today {
  width: 100%;
  -webkit-box-shadow: 0px 15px 30px -16px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 0px 15px 30px -16px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 15px 30px -16px rgba(0, 0, 0, 0.3); }

.today-piece {
  border-radius: 0.25rem;
  padding: 1.6rem;
  font-size: 1.25em;
  text-align: center;
  background: white; }

.top {
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0; }

.middle {
  border-radius: 0; }

.bottom {
  border-top-right-radius: 0;
  border-top-left-radius: 0; }

.day,
.year {
  font-size: 0.65em;
  font-weight: 500;
  letter-spacing: 0.35em;
  text-transform: uppercase;
  color: white;
/*   background: #52de97; */
  background:  #3f92b7; } /* 캘린더 색상 */

.month {
  padding-top: 1.75rem;
  padding-bottom: 0;
  font-size: 1.5em;
  font-weight: 200; }

.date {
  padding-top: 0;
  padding-bottom: 1.75rem;
  font-size: 3em;
  font-weight: 100;
  color: #000; }

</style>

</head>
<body>

<main id="main" class="main">
  
	<div class="container">
  
    <div class="pagetitle">
    	<h1>Home</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

        <!-- 왼쪽 -->
        <div class="col-lg-8">
        	<div class="row">

	            <!-- 멘토 신청 -->
	            <div class="col-xxl-6 col-md-6">
	              	<div class="card">
	                	<div class="card-body" style="height: 337px;">
	                  		<h5 class="card-title">멘토 신청<span> | TODAY</span></h5>
	                    	<div class="applyWrap">
	                      		<p class="applyCnt">${todayMentoApply }</p>
	                      		<p class="applyText">개의 신청 목록</p>
		                  	</div>
	                	</div>
	              	</div>
	            </div><!-- 멘토 신청 end -->
	            
	            <!-- 스터디 신청 -->
	            <div class="col-xxl-6 col-md-6">
					<div class="card">
	                	<div class="card-body" style="height: 337px;">
		                	<h5 class="card-title">스터디 개설 신청<span> | TODAY</span></h5>
	                    	<div class="applyWrap">
	                      		<p class="applyCnt">${todayStudyApply }</p>
	                      		<p class="applyText">개의 신청 목록</p>
	                    	</div>
		                </div>
	             	</div>
	           	</div><!-- 스터디 신청 end -->
	       	</div><!-- row end -->
		</div>

        <!-- 오른쪽 -->
        <div class="col-lg-4">

			<!-- 캘린더 -->
			<div class="card">
				<div class="card-body">
				    <div class="activity">
						<div class="row justify-content-center">
							<div class="today">
							    <div class="today-piece  top  day"></div>
							    <div class="today-piece  middle  month"></div>
							    <div class="today-piece  middle  date"></div>
							    <div class="today-piece  bottom  year"></div>
							</div>
						</div>	
					</div>
		        </div>
			</div><!-- 캘린더 end -->
		</div>


     	<!-- 테이블 -->
       	<div class="col-lg-12">
        	<div class="row">
				
				<!-- Qna관리 -->
	            <div class="col-6">
	            	<div class="card recent-sales overflow-auto">
	
	            	    <div class="card-body">
	                  	<h5 class="card-title">QnA 관리</h5>
	
	                  		 <table class="table">
						        <thead>
						            <tr>
						                <th scope="col" style="width: 15%">NO</th>
						                <th scope="col" style="width: 65%">제목</th>
						                <th scope="col" style="width: 20%">작성자</th>
						   			 </tr>
								</thead>
								<tbody class="table-group-divider">
								<c:forEach items="${preQna }" var="preview">
								<c:choose>
                       				<c:when test="${preview.SROOMQNA_STEP eq 0 }"> <!-- 문의글일 경우 -->
								    <tr>
								        <th>${preview.SROOMQNA_NO }</th>
								        <td>${preview.SROOMQNA_TITLE }</td>
								        <td class="text-center">${preview.MEMBER_NICK }</td>
									</tr>
									</c:when>
						
	            		           <c:when test="${preview.SROOMQNA_STEP ne 0 }"> <!-- 답변글일 경우 -->
                       				<tr>
			                           	<th class="text-center">${preview.SROOMQNA_NO }</td>
										<td><a><i class="fa-solid fa-reply fa-rotate-180"></i> RE : ${preview.SROOMQNA_TITLE }</a></td>
										<td class="text-center">${preview.MEMBER_NICK }</td>
					               </tr>
					               </c:when>
			                   	</c:choose>
								</c:forEach>
						        </tbody>
						    </table>
	                	</div><!-- card-body end -->
              		</div>
            	</div><!-- Qna관리 -->

	            <!-- 예약 리스트 -->
	            <div class="col-6">
	            	<div class="card top-selling overflow-auto">
	
		                <div class="card-body">
		                	<h5 class="card-title">예약 리스트</h5>
		
		                   <table class="table">
					        <thead>
					            <tr>
					                <th scope="col" style="width: 15%">NO</th>
					                <th scope="col" style="width: 65%">스터디룸</th>
					                <th scope="col" style="width: 20%">예약자</th>
					   			 </tr>
							</thead>
							<tbody class="table-group-divider">
							<c:forEach items="${preReserve }" var="preview">
							    <tr>
							        <th>${preview.RESERVE_NO }</th> <!-- 게시글 번호 -->
							        <td>${preview.SROOM_NAME }</td> <!-- 스터디룸명 -->
							        <td class="text-center">${preview.MEMBER_NAME }</td> <!-- 작성자 이름 -->
								</tr>
					        </c:forEach>
					        </tbody>
					    </table>
		                </div>
					</div>
            	</div><!-- 예약리스트 end-->
      		</div><!-- 테이블 row end -->
       	</div>
	</div><!-- main row end -->
	
	</section>

	</div><!-- main container end -->
</main><!-- main end -->
  
  
<script type="text/javascript">
(function($) {

	"use strict";

function DateTime() {
    function getDaySuffix(a) {
        var b = "" + a,
            c = b.length,
            d = parseInt(b.substring(c-2, c-1)),
            e = parseInt(b.substring(c-1));
        if (c == 2 && d == 1) return "th";
        switch(e) {
            case 1:
                return "st";
                break;
            case 2:
                return "nd";
                break;
            case 3:
                return "rd";
                break;
            default:
                return "th";
                break;
        };
    };

    this.getDoY = function(a) {
        var b = new Date(a.getFullYear(),0,1);
    return Math.ceil((a - b) / 86400000);
    }

    this.date = arguments.length == 0 ? new Date() : new Date(arguments);

    this.weekdays = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
    this.months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
    this.daySuf = new Array( "st", "nd", "rd", "th" );

    this.day = {
        index: {
            week: "0" + this.date.getDay(),
            month: (this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate()
        },
        name: this.weekdays[this.date.getDay()],
        of: {
            week: ((this.date.getDay() < 10) ? "0" + this.date.getDay() : this.date.getDay()) + getDaySuffix(this.date.getDay()),
            month: ((this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate()) + getDaySuffix(this.date.getDate())
        }
    }

    this.month = {
        index: (this.date.getMonth() + 1) < 10 ? "0" + (this.date.getMonth() + 1) : this.date.getMonth() + 1,
        name: this.months[this.date.getMonth()]
    };

    this.year = this.date.getFullYear();

    this.sym = {
        d: {
            d: this.date.getDate(),
            dd: (this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate(),
            ddd: this.weekdays[this.date.getDay()].substring(0, 3),
            dddd: this.weekdays[this.date.getDay()],
            ddddd: ((this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate()) + getDaySuffix(this.date.getDate()),
            m: this.date.getMonth() + 1,
            mm: (this.date.getMonth() + 1) < 10 ? "0" + (this.date.getMonth() + 1) : this.date.getMonth() + 1,
            mmm: this.months[this.date.getMonth()].substring(0, 3),
            mmmm: this.months[this.date.getMonth()],
            yy: (""+this.date.getFullYear()).substr(2, 2),
            yyyy: this.date.getFullYear()
        }
    };

    this.formats = {
        pretty: {
          a: this.sym.d.dddd,
          b: this.sym.d.ddddd,
          c: this.sym.d.mmmm,
          d: this.sym.d.yyyy
        }
    };
};



var dt = new DateTime();
$('.day').text(dt.formats.pretty.a);
$('.date').text(dt.formats.pretty.b);
$('.month').text(dt.formats.pretty.c);
$('.year').text(dt.formats.pretty.d);

})(jQuery);

</script>

</body>
</html>