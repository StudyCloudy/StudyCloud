<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../layout/header.jsp" /> 
<link rel="stylesheet" href="/resources/css/mtBoardWrite.css">   
<script src="../resources/js/mtBoardWrite.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		//작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})
	
	$("#btnCancle").click(function() {
		location.href = "/mntboard/list"
	})
	
})

function updateContents() {
	// 작성된 내용을 #content에 반영
	oEditors.getById["mntboardContent"].exec("UPDATE_CONTENTS_FIELD", [])
}
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

<form action="./write" method="post" enctype="multipart/form-data">

<div id="write_form">
<br><br><br><br>


<div class="form-group">
 <label for="title">&nbsp;닉네임<span class="rq">*</span></label>
<input class="form-control" type="text" id="memberNick" name="memberNick" value="${member_nick}" style="margin-top: 5px; font-size: 13px" readonly="readonly"></div>

<div class="form-group">
<label for="title">&nbsp;제목<span class="rq">*</span></label>
<input class="form-control" type="text" id="mntboardTitle" name="mntboardTitle" placeholder="제목을 입력해주세요"  style="margin-top: 5px; font-size: 13px"></div>

<div class="form-group">
<label for="field">&nbsp;분야<span class="rq">*</span></label>
<select class="form-select"  id="field" name="field" style="margin-top: 3px; font-size: 13px">
  <option selected>선택</option>
  <option>개발 · 프로그래밍</option>
  <option>어학 · 외국어</option>
  <option>직무 · 마케팅</option>
  <option>커리어</option>
  <option>기타</option>
</select>
</div>




<div class="form-group">
<label for="content">본문<span class="rq">*</span></label>
<textarea id="mntboardContent" name="mntboardContent" rows="11" style="width: 100%"></textarea>
</div>


<div class="form-group">
	<label for="file"></label>
	<input type="file" id="file" name="file">
</div>
<br>


<div class="btn-zip">
 <input type="reset" id="btnCancle" class="btn btn-primary" value="취소">
 <button class="btn btn-primary" id="btnWrite">등록</button>
</div>

</div><!-- write_form 끝 -->

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "mntboardContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})


</script>
</form>


</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>