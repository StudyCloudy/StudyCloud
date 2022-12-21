<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../layout/header.jsp" /> 
<link rel="stylesheet" href="/resources/css/mtBoardWrite.css">   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		
		//작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})
	
	$("#btnCancle").click(function() {
		location.href = "/mtboard/list"
	})
	
	if( ${empty FileUpload} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	 $("#deleteFile").click(function() {
		$("#newFile").toggle()
		
		$("#originFile").toggleClass("through")
	})  
	
})

function updateContents() {
	oEditors.getById["mtboardContent"].exec("UPDATE_CONTENTS_FIELD", []) }
</script>



<!-- content 전체 wrap -->
<main id="main">
<!-- 상단 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
			<h1>☁️ ☁️ ☁️</h1>
	</div>
</div>

<main class="all_content">
<form action="./update" method="post" enctype="multipart/form-data">
<input type="hidden" name="mtboardNo" value="${param.mtboardNo }">

<div id="write_form">
<p class="form_txt">정보 수정</p>
<br><br><br><br>


<!-- 스크롤바 -->
<div class="scroll_scope">

<h6 style="font-weight: bold; padding-bottom: 20px">&nbsp;기본 정보</h6>

<div class="form-group">
<label for="name">&nbsp;닉네임<span class="rq">*</span></label>
<input class="form-control" id="memberNick" name="memberNick" value="${updateBoard.MEMBER_NICK}" type="text" style="margin-top: 3px; font-size: 13px" disabled>
</div>

<div class="form-group">
<label for="field">&nbsp;분야<span class="rq">*</span></label>
<input class="form-control"  id="field" name="field" value="${updateBoard.FIELD }"style="margin-top: 3px; font-size: 13px" disabled/>
</div>

<br><br><br>
<h6 style="font-weight: bold; padding-bottom: 20px">&nbsp;멘토링 정보</h6>

<div class="form-group">
<label for="jobduty">&nbsp;직무<span class="rq">*</span></label>
<input id="jobDuty" name="jobDuty" class="form-control" value="${updateBoard.JOBDUTY }" style="margin-top: 3px; font-size: 13px" disabled>
</div>

<div class="form-group">
<label for="career">&nbsp;경력<span class="rq">*</span></label>
<input id="career" name="career" class="form-control" value="${updateBoard.CAREER }" style="margin-top: 3px; font-size: 13px" disabled>
</div>

<div class="form-group">
<label for="co">&nbsp;현직</label>
<input class="form-control" type="text" id="coName" name="coName" value="${updateBoard.CO_NAME }" placeholder="현재 근무하는 회사명을 적어주세요" style="margin-top: 3px; font-size: 13px"></div>

<div class="form-group">
<label for="price">&nbsp;가격<span class="rq">*</span></label>
<p>&nbsp;(원 / 5000원이상)</p>
<input class="form-control" type="text" id="mtPrice" name="mtPrice" value="${updateBoard.MT_PRICE }" placeholder="ex. 10,000원"  style="margin-top: 3px; font-size: 13px"></div>

<br>

<div class="form-group">
<label for="title">&nbsp;제목<span class="rq">*</span></label>
<input class="form-control" type="text" id="mtboardTitle" name="mtboardTitle" value="${updateBoard.MTBOARD_TITLE }" style="margin-top: 5px; font-size: 13px"></div>

<div class="form-group">
<label for="content">소개글을 작성 해주세요<span class="rq">*</span></label>
<textarea id="mtboardContent" name="mtboardContent" rows="11" style="width: 100%" >${updateBoard.MTBOARD_CONTENT }</textarea>
</div>


<div class="form-group">
	<div id="fileBox">

		<div id="originFile">
			<a href="/mtboard/download?fileUploadNo=${fileUpload.fileUploadNo }">${fileUpload.fileUploadOri }</a>
			<img id="img_container" style="width:200px"/>
		</div>

		<div id="newFile">
			<label for="file">새 첨부파일</label><br>
			<input type="file" id="file" name="file" onchange="readURL(this)">
			<img id="img_container" style="width:0px"/>
		</div>

	</div>
</div>
<br>

</div><!-- 스크롤바 -->

<div class="btn-zip">
<button id="btnCancle" class="btn btn-primary">취소</button>
 <button class="btn btn-primary" id="btnUpdate">수정</button>
</div>

</div><!-- write_form 끝 -->
</form>



<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "mtboardContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})


function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('img_container').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('img_container').src = "";
  }
}

</script>



</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>