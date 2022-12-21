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
function getSearchList(){
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
// }

function getSearch() {
	var pageNo = ${paging.curPage };
	var tagword = $("#tagName").val();
	
	if( tagword == "") {
		alert("태그를 입력해주세요.");
		return false;
	}
	
	$.ajax({
		url: "/sboard/searchtag",
		type: "POST",
		data: { "studyTag" : tagword },
		success : function(r){
			console.log('ajax 요청 성공');
			$("#study_tag").html(r);
		}
	})
	
}

function 


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
			<a class="btn btn-primary" href="./enroll" role="button" style="background-color: #6cc4dc; border: none;">스터디 개설하기</a>
		</span>
		<span class="button-op">
			<a class="btn btn-primary" href="./main" role="button" style="background-color: #6cc4dc; border: none;">스터디 찾아보기</a>
		</span>
	</div>
	
	
<div class="container1">
	
	<div class="search-tag" style="padding-left: 30px; margin-bottom: 25px;">
		<form name="search-form" autocomplete="off" class="d-flex" role="search">
	        	<input class="form-control me-2" type="text" name="tagName" id="tagName" placeholder="#태그를 검색해보세요." name="keyword" aria-label="Search">
	        	<button class="btn btn-outline-light" type="submit" onclick="getSearch()">search</button>
	     </form>
	</div>
			<div class="nav-option">
				<!-- 인원 선택 드롭박스 -->
				<div class="dropdown" style="float: left;">
  					<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 30%; background-color: white; color: #3f92b7; border-color: #3f92b7;">
    					인원 선택
 					</button>
  					<ul class="dropdown-menu">
    					<li><a class="dropdown-item" href="#">1명</a></li>
    					<li><a class="dropdown-item" href="#">2명</a></li>
    					<li><a class="dropdown-item" href="#">3~4명</a></li>
    					<li><a class="dropdown-item" href="#">5명 이상</a></li>
  					</ul>
				</div>
				
				<div class="nav-option-sort" style="float: right;">
				<a class="btn btn-primary btn-sm" href="./kakaomap" role="button" style="background-color: #3f92b7; border: none;">내 주변 스터디 찾기</a>
<!-- 				<div class="form-check"> -->
<!-- 	  				<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> -->
<!-- 	  				<label class="form-check-label" for="flexRadioDefault1">최신순</label> -->
<!-- 				</div> -->
			
<!-- 				<div class="form-check"> -->
<!-- 	  				<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> -->
<!-- 	  				<label class="form-check-label" for="flexRadioDefault1">인기순</label> -->
<!-- 				</div> -->
				
			
<!-- 				<div class="form-check"> -->
<!-- 	  				<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> -->
<!-- 	  				<label class="form-check-label" for="flexRadioDefault1">내 주변 스터디 찾기</label> -->
<!-- 				</div> -->
				
				</div>
		
			</div>
		
			<br><br>
		
			<c:forEach items="${slist }" var="studyboard">
			<ul class="sboard-list">
				<li class="study" style="list-style-type:none;">
					<div class="shadow p-3 mb-5 bg-body rounded" style="padding: 5px;">
						<span class="badge">모집중</span>
						<div class="title-and-detail">
							<a href="/sboard/detail?studyNo=${studyboard.STUDY_NO}" style="font-size: 20px; text-decoration: none; color:#60392a; font-weight: normal;">${studyboard.STUDY_TITLE }</div>
							<div class="study-detail" style="font-size: 14px; padding-bottom: 12px;">${studyboard.STUDY_TAG }
						</div>
					</div>
				</li>	
			</ul>
			</c:forEach>

			<c:import url="/WEB-INF/views/sboard/paging.jsp" />
		</div>

		
		<br><br><br><br>

</div>

<c:import url="../layout/footer.jsp" />
</body>
</html>