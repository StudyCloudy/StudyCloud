<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ include file="../layout/adminHeader.jsp"%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin studyroom</title>

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		
		updateContents();
		
		$("form").submit();
	})
	
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #sRoomInfo에 반영한다
	oEditors.getById["sRoomInfo"].exec("UPDATE_CONTENTS_FIELD", [])

	//스마트 에디터에 작성된 내용을 #sRoomRole에 반영한다
	oEditors2.getById["sRoomRole"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnCancel").click(function() {
		location.href="/admin/studyroom"
	})
})
</script>


<style type="text/css">
/* label{ text-align: center; } */
form { margin: 40px 5px auto;}

.sRoom_insert_btn { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }
.sRoom_insert_btn_cancel { border: 2px solid #6CC4DC; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: #6CC4DC; background-color: white;}
.sRoom_insert_wrap { font-size: 14px; }	  
</style>

</head>
<body>

<form action="/admin/studyroom/update" method="post" enctype="multipart/form-data">
<input type="hidden" name="sRoomNo" value="${param.sRoomNo }">
<main id="main" class="main">
  
<div class="container">
  
	<div class="pagetitle">
		<h1>스터디룸 수정</h1>
	</div>
	
	<section class="dashboard">
	  	<div class="row">
	
	 	<!-- 테이블 -->
		<div class="col-lg-12">
        	
		<div class="mb-3 row form-group">
			<label for="sRoomName" class="col-sm-2 col-form-label">스터디룸 이름</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="sRoomName" name="sRoomName" value="${studyroom.sRoomName }">
		    </div>
		</div>
		    
		<div class="mb-3 row form-group">
			<label for="sRoomAddr" class="col-sm-2 col-form-label">주소</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="sRoomAddr" name="sRoomAddr" value="${studyroom.sRoomAddr }">
		    </div>
		</div>
		
		<div class="mb-3 row input-group">
			<label for="sRoomPrice" class="col-sm-2 col-form-label">가격 (원/시간)</label>
		    <div class="col-sm-4" style="margin-left: 2px;">
		    	<input type="text" class="form-control" id="sRoomPrice" name="sRoomPrice" value="${studyroom.sRoomPrice }">
		    </div>
		    
			<label for="sRoomPeople" class="col-sm-2 col-form-label">인원</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" id="sRoomPeople" name="sRoomPeople" value="${studyroom.sRoomPeople }" style="width: 330px;">
		    </div>
		</div>
				
		<div class="mb-3 row form-group">
		   <label for="sRoomIntro" class="col-sm-2 col-form-label">한줄소개</label>
		    <div class="col-sm-10">
		       <input type="text" class="form-control" id="sRoomIntro" name="sRoomIntro" value="${studyroom.sRoomIntro}">
		    </div>
		</div>
		
		<div class="mb-3 row form-group">
			<label for="sRoomInfo" class="col-sm-2 col-form-label">공간소개</label>
		  	<div class="col-sm-10" >
		  		<textarea class="form-control" id="sRoomInfo" name="sRoomInfo" rows="10">${studyroom.sRoomInfo }</textarea>
		  	</div>
		</div>

		<div class="mb-3 row form-group">
			<label for="sRoomRole" class="col-sm-2 col-form-label">이용&환불규정</label>
		    <div class="col-sm-10">
		  		<textarea class="form-control" id="sRoomRole" name="sRoomRole" rows="10">${studyroom.sRoomRole }</textarea>
		  	</div>
		</div>

		<div class="mb-3 row form-group">
			<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
			<div class="col-sm-10">
				<input class="form-control" type="file" id="file" name="file" style="width: 280px;">
			</div>	
		</div>	

		<div class="text-center" style="margin-top: 70px;">
			<button type="button" id="btnUpdate" class="sRoom_insert_btn">수정</button>
			<button id="btnCancel" class="sRoom_insert_btn_cancel">취소</button>
		</div>

      	</div>
		</div><!-- main row end -->

	</section>

</div><!-- main container end -->
</main><!-- main end -->

</form>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "sRoomInfo",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})

var oEditors2 = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors2,
	elPlaceHolder: "sRoomRole",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})

</script>

</body>
</html>