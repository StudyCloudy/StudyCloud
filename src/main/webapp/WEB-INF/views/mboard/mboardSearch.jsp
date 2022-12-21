<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud</title>
<c:import url="../layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script type="text/javascript">

// document.querySelectorAll('.btn').forEach(buttonElement => {
// 	  const button = bootstrap.Button.getOrCreateInstance(buttonElement)
// 	  button.toggle()
// 	})

$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mboard/write"
	})
})

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		location.href = "/mboard/update"
	})
})

	
	
</script>

<style type="text/css">

.whole {
/* 	margin: 0 auto; */
/* 	width: 1100px; */
}
 .header-box { 
 	color: white; 
 	height: 200%; 
 	background-color: #aacde5; 
 	text-align: center; 
 	padding: 60px; 
/*  	margin: 20%;   */
/* 	margin: 0 auto; */
/* 	text-align:center; */
/* 	background-color: #e3eff9; */
 } 

.container1{
	margin: 0 auto;
 	width: 1000px; 
}

.nav-m {
	padding-bottom: 5px;
}

.button-menu {
	margin: 0 auto;
	width: 1100px;
	text-align: center;
	padding: 30px;
}

.button-op {
	padding: 40px;
	color: #6cc4dc;
	--bs-btn-border-radius: .5rem;
}

.btn {
	background-color:  #6cc4dc;
	border: none;
	--bs-btn-hover-bg: #3f92b7;
}

/* .table { */
/* 	border-top: 2px; */
/* 	background-color: #aacde5; */
/* } */

table {
	table-layout: fixed;
}

tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
    border-width: 0;
}

th {
	color: #ffffff;
	text-align: center;
}

.table-head {
 	background-color: #aacde5;
}

.table-primary {
	text-align: center;
}

 td:nth-child(2) {
 	text-align: center;
 }

.d-flex {
	float: right;
	padding-bottom: 7px;
}

.form-control {
	width: 300px;
}

.form-check {
	float: left;
/* 	margin: 20px; */
	padding-right: 30px;
}

.pagination {
	justify-content: center;
	--bs-pagination-color:  #6cc4dc;
}

hr {
	margin: 0 auto;
	width: 1100px;
}

.btn-check {
	color: #6cc4dc
}

.btn-group {
	padding-top: 5px;
	float: right;
}

/* img { */
/* 	object-fit: contain; */
/* 	margin: 0 auto; */
/* 	height: 10%; */
/* } */

td {
	text-align: center;
}

a:hover {
	color: #3780A1;
}

.form-control { 
 	width: 80%; 
/* /* 	float: left; */ */
 } 
 
 .form-select { 
/* 	margin: 0 auto; */
/* 	width: 109px; */
/* 	margin-left: 32px; */
 	border-color:  #3f92b7;
 	float: left;
	
 } 
 
 .input-group {
	width: 40%;
	float: right;
}

</style>

</head>
<body>

<div class="whole">

	<div class="header-box">
<!-- 		<img src="/resources/se2/img/mboard_sign.jpg"> -->
		실시간 번개 스터디에 참여해보세요!⚡<br>
		Join the Flash-Gathering!
	</div>
	
	<div class="button-menu">
		<span class="button-op">
			<button type="button" class="btn btn-primary active" data-bs-toggle="button" aria-pressed="true" style="background-color:  #6cc4dc;">자유게시판💭</button>
		</span>
		<span class="button-op">
			<button type="button" class="btn btn-primary active" data-bs-toggle="button" aria-pressed="true" style="background-color:  #6cc4dc;">번개게시판⚡</button>
		</span>
	</div>
	
	<br><br>
	<form action="/mboard/search" method="get">	
	<div class="container1">
		<div class="nav-m">
<!-- 			<div class="form-check"> -->
<!-- 	  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> -->
<!-- 	  			<label class="form-check-label" for="flexRadioDefault1">최신순</label> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-check"> -->
<!-- 	  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> -->
<!-- 	  			<label class="form-check-label" for="flexRadioDefault1">인기순</label> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-check"> -->
<!-- 	  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> -->
<!-- 	  			<label class="form-check-label" for="flexRadioDefault1">댓글많은순</label> -->
<!-- 			</div> -->
			
			<div class="input-group" style="float: left; width:10%; margin-left: 49%;">
			<select class="form-select" id="category" name="category" style="color: #3f92b7; width: 100%;">
	    		<option value="mboard_title">제목</option>
	    		<option value="mboard_content">내용</option>
	    		<option value="mboard_date">날짜</option>
	    		<option value="member_nick">작성자</option>
			</select>
			</div>
			
			<div class="input-group" id="searchForm">
<!-- 			<form class="d-flex" role="search"> -->
	        	<input class="form-control me-2" type="text" placeholder="검색어를 입력해주세요" name="keyword" aria-label="Search">
	        	<button class="btn btn-outline-light" id="btnSearch" type="submit">Search</button>
<!-- 	     	</form> -->
	     	</div>
     	</div>
     	
     	<br><br>
     	
     	<div class="mboard">
		<table class="table">
			<thead class="table-head">
				<tr>
					<th scope="col" style="width: 15%;">글번호</th>
					<th scope="col" style="width: 45%;">제목</th>
					<th scope="col" style="width: 20%;">작성자</th>
					<th scope="col" style="width: 10%;">조회수</th>
					<th scope="col" style="width: 15%;">작성일</th>
				</tr>
			</thead>
			
			<tbody>
  				<c:forEach items="${searchResult }" var="mboard">  
					<tr>
						<td>${mboard.MBOARD_NO}</td>
						<td><a href="/mboard/detail?mBoardNo=${mboard.MBOARD_NO}" style="text-decoration: none; color: #367E9E;">${mboard.MBOARD_TITLE}</a></td>
						<td>${mboard.MEMBER_NICK }</td>
						<td>${mboard.MBOARD_HIT }</td>
						<td><fmt:formatDate value="${mboard.MBOARD_DATE }" pattern="yy-MM-dd"/></td>
					</tr>
  				</c:forEach>  
			</tbody>
		</table>
		
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  			<button type="button" class="btn btn-primary" id="btnWrite"
        			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem; ">
  			등록하기
			</button>
<!--   			<button type="button" class="btn btn-primary" id="btnUpdate" -->
<!--         			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"> -->
<!--   			수정하기 -->
<!-- 			</button> -->
<!--   			<button type="button" class="btn btn-primary" id="btnDelete" -->
<!--         			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"> -->
<!--   			삭제하기 -->
<!-- 			</button> -->
<!--   			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="on"> -->
<!--   			<label class="btn btn-outline-light" for="btnradio2">수정하기</label> -->

<!--   			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="on"> -->
<!--   			<label class="btn btn-outline-light" for="btnradio3">삭제하기</label> -->
		</div>
		</div>
		
		<br><br><br><br><br>
		<c:import url="/WEB-INF/views/mboard/paging.jsp" />


	</div><!-- container 끝 -->
	</form>
</div><!-- whole 끝 -->




<c:import url="../layout/footer.jsp" />
</body>
</html>