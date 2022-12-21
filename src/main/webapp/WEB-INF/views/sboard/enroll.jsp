<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 
<meta charset="UTF-8"  name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud☁️</title>
<c:import url="../layout/header.jsp" />

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<script type="text/javascript">

$(document).ready(function(){
	$("#btnEnroll").click(function(){
		$("form").submit();
	})
})

//입력하지 않고 제출할 시
function check() {
	
	var form = document.studyinfo;
	
	if (!form.studyTitle.value){
		alert("제목을 입력해주세요.")
		return false;
	}
	
	if (!form.studyContent.value){
		alert("내용을 입력해주세요.")
		return false;
	}
	
	if (!form.studyTag.value){
		alert("태그를 설정해주세요.")
		return false;
	}
		
	if (!form.studyPeople.value){
		alert("인원을 입력해주세요.")
		return false;
	}
	
	if (!form.studyAddress.value){
		alert("장소를 입력해주세요.")
		return false;
	}
	
	if (!form.studyDate.value){
		alert("날짜를 입력해주세요")
		return false;
	}
	
	if (!form.studyTime.value){
		alert("시간을 입력해주세요.")
		return false;
	}
	
	if (!form.studyNotify.value){
		alert("한 줄 소개 및 공지를 작성해주세요.")
		return false;
	}
	
}

// $(document).ready(function () {
// 	$("#btnEnroll").click(function() {
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

.whole {
	margin: 0 auto;
	margin-top: 4%;
	width: 900px;
/* 	display: flex; */
}

.content {
	margin-left: 30px;
}

#img-detail {
	width : 33px;
	height: 33px;
	filter: invert(46%) sepia(93%) saturate(308%) hue-rotate(153deg) brightness(94%) contrast(87%);
	float: left; 
	margin-left: 10px;
	margin-right: 25px;
}

.form-control {
	width: 80%;
/* 	float: left; */
 	border: 1px solid #E8E8E8; 
 	border: none; 
/* 	color: #E6E6E6; */
	border-radius: 0.7rem;
}

.con-detail {
	margin-bottom: 50px;
}


</style>

</head>
<body>

<div class="header-box">
	스터디를 개설해보세요!<br>
	Publish the Studies!
</div>

<div class="whole">
<form action="/sboard/enroll" method="post" class="enrollform" name="studyinfo" enctype="multipart/form-data" onsubmit="return check()">  
	<div class="content">
	
		<div class="con-detail">
			<div class="title">
				<img src="/resources/se2/img/cloud-solid.svg"  id="img-detail">
				<div class="mb-3">
  					<input type="text" class="form-control" id="studyTitle" name="studyTitle" placeholder="스터디의 제목을 입력하세요.">
				</div>
			</div>
		</div>
		<div class="con-detail">
			<div class="title">
				<img src="/resources/se2/img/pen-solid.svg"  id="img-detail">
				<div class="mb-3">
  					<input type="text" class="form-control" id="studyContent" name="studyContent" placeholder="스터디의 내용을 입력하세요.">
				</div>
			</div>
		</div>
		<div class="con-detail">
			<div class="title">
				<img src="/resources/se2/img/tags-solid.svg"  id="img-detail">
				<div class="mb-3">
  					<input type="text" class="form-control" id="studyTag" name="studyTag" placeholder="태그를 설정하세요">
				</div>
			</div>
		</div>
		<div class="con-detail">
			<div class="">
				<img src="/resources/se2/img/users-solid.svg"  id="img-detail">
				<div class="mb-3">
  					<input type="text" class="form-control" id="studyPeople" name="studyPeople" placeholder="스터디에 참여할 인원을 입력하세요.(숫자로 입력해주세요.)">
				</div>
			</div>
		</div>
		<div class="con-detail">
			<div class="title">
				<img src="/resources/se2/img/location-dot-solid.svg"  id="img-detail">
				<div class="mb-3">
  					<input type="text" class="form-control" id="studyAddress" name="studyAddress" placeholder="스터디 장소를 입력하세요.">
				</div>
			</div>
		</div>
		<div class="con-detail">
			<div class="title">
				<img src="/resources/se2/img/calendar-days-solid.svg"  id="img-detail">
				<div class="mb-3">
  					<input type="date" class="form-control" id="studyDate" name="studyDate" placeholder="스터디 날짜를 입력하세요.">
				</div>
			</div>
		</div>
		<div class="con-detail">
			<div class="title">
				<img src="/resources/se2/img/clock-regular.svg"  id="img-detail">
				<div class="mb-3">
  					<input type="text" class="form-control" id="studyTime" name="studyTime" placeholder="스터디가 진행 될 시간를 입력하세요.">
				</div>
			</div>
		</div>
		<div class="con-detail">
			<div class="title">
				<img src="/resources/se2/img/comment-regular.svg"  id="img-detail">
				<div class="mb-3">
					<textarea class="form-control" id="studyNotify" name="studyNotify" rows="3" placeholder="이 외에 한 줄 소개, 공지하고 싶은 말이 있다면 작성해주세요."></textarea>
				</div>
			</div>
		</div>
		
		<div class="enrollbtn" style="text-align: center;">
<!-- 		<input class="btn btn-primary" type="submit" value="신청하기" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color: #6cc4dc; border: none;"> -->
<!-- 		 <button class="btn btn-primary" type="submit" data-bs-target="staticBackdrop" data-bs-toggle="modal" style="background-color: #6cc4dc; border: none;">신청하기</button> -->
		<button type="button" id="btnConfirm" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color: #6cc4dc; border: none;">등록하기</button> 
		</div>
		
 <!-- 스터디 등록 완료 알림 모달  -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Success!</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        스터디 등록이 성공적으로 완료되었습니다.<br>
<!--         최종 등록 여부는 마이페이지에서 확인하실 수 있습니다. -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnEnroll" style="background-color:#6cc4dc; border: none;">확인</button>
      </div>
    </div>
  </div>
</div>
		
<!-- 	</form>	  -->
	</div>
		</form>
<!-- </div> -->

<br><br><br><br><br>

<c:import url="../layout/footer.jsp" />
</body>
</html>