<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin reservation list</title>

<style type="text/css">

/* 메인 타이틀 */
 .pagetitle > h1 { 
   font-size: 24px; 
   margin-bottom: 20px;
   font-weight: bold;
   display: inline-block;
}

/* 필터 검색 부분 */
.filter {
	margin-top: 20px;
}

/* 검색 창 */
.input-group {
	width:40%;
	float: right;
}

#searchForm {
 	width: 70%;
}

#keyword {
	width: 20%;
/* 	float: right; */
	height: 28px;
}

#btnSearch {
/* 	float: right; */
	padding: 5px;
	background-color: #6cc4dc;
	border: none;
	color: white;
	font-size: 14px;
}

/* 데이트 피커 */
.date > input {
	max-width: 200px;
}

#search {
	width: 55px;
	height: 50px;
	background-color: #6cc4de;
	border: none;
	color: #fff;
	border-radius: 10px;
}

.btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

/* 테이블 */
.table {
	text-align: center;
	vertical-align: middle;
}

.table thead {
    background-color: #aacde5;
}

.table thead th {
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    color: white;
}

.table tbody td {
    padding: 10px;
    margin: 0;
    font-size: 14px;
}

/* 페이징 */
.totalCnt {
	font-size: 14px;
}

#titleHome {
	cursor: pointer;
}

</style>

<script type="text/javascript">

/* 예약리스트 클릭시 예약관리 메인페이지로 새로고침 */
$(document).ready(function() {
	$("#titleHome").click(function() {
		location.href = "/admin/reserve"
	})
})

</script>

</head>
<body>

<form action="/admin/reserve/search" method="get">

<main id="main" class="main">
<div class="container">
  
    <div class="pagetitle">
    	<h1 id="titleHome">예약 리스트</h1>
    	
				
		<!-- 검색창 -->
    	<div class="input-group">
			<select class="form-select" id="category" name="category">
		        <option value="sroom_name">스터디룸명</option>
		        <option value="member_name">예약자</option>
			</select>
			<div class="input-group" id="searchForm">
			  	<input type="text" class="form-control" aria-describedby="btnSearch" name="keyword">
			  	<button class="btn" type="submit" id="btnSearch">검색</button>
			</div>
        </div>
    </div>
    

	<!-- 테이블 -->
    <section class="adminReserve">
       	<div class="col-lg-12">
      	<div class="row">
		    <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">스터디룸 명</th>
                            <th scope="col">예약자</th>
                            <th scope="col">휴대폰 번호</th>
                            <th scope="col">예약일시</th>
                            <th scope="col">예약인원</th>
                            <th scope="col">관리</th>
                        </tr>
                    </thead>
                    <tbody class="reserveList" id="reserveList">
                    <c:forEach items="${list }" var="reserve">
                        <tr>
                            <td>${reserve.RESERVE_NO }</td>
                            <td>${reserve.SROOM_NAME }</td>
                            <td>${reserve.MEMBER_NAME }</td>
                            <td>${reserve.MEMBER_PHONE }</td>
                            <td>${reserve.RESERVE_DATE }</td>
                            <td>${reserve.RESERVE_PEOPLE } 명</td>
	                        <td>
	                        	<a href="/admin/reserve/view?reserveNo=${reserve.RESERVE_NO }">상세보기</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

				<!-- 페이징 -->
				<span class="totalCnt">total : ${paging.totalCount }</span>
	     		<c:import url="/WEB-INF/views/admin/reservePaging.jsp" />

            </div>
       	</div>
       	
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->

</main><!-- main end -->

</form>

</body>
</html>