<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud☁️</title>
<c:import url="../layout/header.jsp" />

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<script type="text/javascript">
// 	$.ajax({
// 		type: 'GET',
// 		url : "/sboard/getSearchList",
// 		data : $("form[name=search-form]").serialize(),
// 		success : function(result){
// 			//테이블 초기화
// 			$('#sboard-list > tbody').empty();
// 			if(result.length>=1){
// 				result.forEach(function(item){
// 					str='<ul>'
// 					str += "<a href = '/sboard/detail?studyNo=" + studyboard.STUDY_NO + "'>" + "</a>";
// // 					str+="<td><a href = '/sboard/detail?studyNo=" + studyboard.STUDY_NO + "'>"  + "</a></td>";
// 					str+="<div>"+studyboard.STUDY_TAG +"</div>";
// 					str+="</ul>"
// 					$('#boardtable').append(str);
//         		})				 
// 			}
// 		}
// 	})
//
// $(document).ready(function(){
// 	$("#btnSearch").click(function(){
// 		location.href = "/sboard/studySearch?keyword=${keyword }"
// 		$("form").submit();
// 	})
// })


</script>

<style type="text/css">


.header-box {
	color: white;
	height: 200%;
	background-color: #aacde5;
	text-align: center;
	padding: 60px;
/* 	margin: 20%; */
}

.container1{
	margin: 0 auto;
	width: 950px;
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
	--bs-btn-hover-bg: #3f92b7;
}

.sboard-list {
	margin: 0 auto;
	width: 100%;
	height: 10%;
}

.study {
	width: 100%;
	height: 50%;
}

.study-info {
	border: 1px solid #aacde5;
	border-radius: .7rem;
	height: 100px;
	padding-top: 1%;
	box-shadow: 2px 2px light grey;
	margin-top: 3%;
	
}

.badge {
/* 	margin: 20px; */
	float: left;
 	margin-left: 21px;
	margin-right: 31px;
	margin-bottom: 30px;
	margin-top: 26px;
/*  	background-color: #3f92b7;  */
 	background-color: #aacde5; 
/* 	.bg-{color} : #e3eff9; */
}


.title-and-detail {
/*  	float: left; */
/* 	margin-right: 70%; */
/* 	padding-left: 2%; */
	padding-bottom: 1%;
 	margin-top: 5px; 
}

:root {
	--bs-border-radius: 0.7rem;
 	--bs-body-color: #60392a; 
	--bs-body-bg-rgb: 250,250,250;
}

/* img, svg { */
/* /*     vertical-align: text-right; */ */
/*     float: right; */
/* } */

.nav-option {
	width: 100px;
}

.icon {
	float: right;
}

.form-check {
	float: right;
/* 	float: right; */
/* 	margin: 20px; */
	padding-right: 30px;
	padding-top: 7px;
}

.pagination {
	justify-content: center;
	--bs-pagination-color:  #6cc4dc;
}

.shadow {
    box-shadow: 0 .5rem 1rem rgba(0,0,0,.084)!important;
}

h4, h6 {
	color: #636363;
}

.p-3 {
	padding-left: 5%;
}

 .form-control { 
 	width: 80%; 
/* /* 	float: left; */ */
 } 

/* .d-flex { */
/* 	width: 800px; */
/* 	float: right; */
/* } */

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
		다양한 스터디를 만들고 참여해보세요!<br>
		Publish And Join the Studies!
	</div>
	
	<div class="button-menu">
		<span class="button-op">
			<a class="btn btn-primary" href="./enroll" role="button" style="background-color: #6cc4dc; border: none;">스터디 개설하기🎯</a>
		</span>
		<span class="button-op">
			<a class="btn btn-primary" href="./main" role="button" style="background-color: #6cc4dc; border: none;">스터디 찾아보기☁️</a>
		</span>
	</div>
	
	<br>
	
<form action="/sboard/search" method="get" name="search-form" autocomplete="off" class="d-flex" role="search">
<div class="container1">
	
	<div class="search-tag" style="padding-left: 30px; margin-bottom: 25px;">
			<div class="nav-option" style="float: left;">
				<select class="form-select" aria-label="Default select example" name="category" id="category" style="color: #3f92b7; width: 100%;">
					<option value="study_tag">#태그</option>
					<option value="study_title">제목</option>
				</select>
		
			</div>
			<div class="input-group" id="searchForm">
		  		<input type="text" class="form-control" aria-describedby="btnSearch" name="keyword">
		  		<button class="btn" type="submit" id="btnSearch" style="color: white;">Search</button>
			</div>
	</div>
	    
		
			<br>
			
			<ul class="sboard-list">
				<li class="study" style="list-style-type:none;">
			<c:forEach items="${searchResult }" var="studyboard">
					<div class="shadow p-3 mb-5 bg-body rounded" style="padding: 5px;">
						<span class="badge">모집중</span>
						<div class="title-and-detail">
							<a href="/sboard/detail?studyNo=${studyboard.STUDY_NO}" style="font-size: 20px; text-decoration: none; color:#60392a; font-weight: normal;">${studyboard.STUDY_TITLE }</div>
							<div class="study-detail" style="font-size: 14px; padding-bottom: 12px;">${studyboard.STUDY_TAG }
						</div>
					</div>
			</c:forEach>
				</li>	
			</ul>
		</div>


 </form><!-- form end 끝 -->
		
		<br><br><br><br>
</div>
<br><br><br><br>
			<c:import url="/WEB-INF/views/sboard/paging.jsp" />

<c:import url="../layout/footer.jsp" />
</body>
</html>