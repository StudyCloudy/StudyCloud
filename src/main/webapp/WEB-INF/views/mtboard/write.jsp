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
<script src="../resources/js/mtBoardWrite.js?ver=3"></script>
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
	oEditors.getById["mtboardContent"].exec("UPDATE_CONTENTS_FIELD", [])
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
<p class="form_txt">멘토링 소개</p>
<br><br><br><br>


<!-- 스크롤바 -->
<div class="scroll_scope">

<h6 style="font-weight: bold; padding-bottom: 20px">&nbsp;기본 정보</h6>

<div class="form-group">
<label for="id">&nbsp;아이디<span class="rq">*</span></label>
<input class="form-control" id="loginId" name="loginId" value="${login_id}" type="text" style="margin-top: 3px; font-size: 13px" readonly="readonly">
</div>

<div class="form-group">
<label for="name">&nbsp;닉네임<span class="rq">*</span></label>
<input class="form-control" id="memberNick" name="memberNick" value="${member_nick}" type="text" style="margin-top: 3px; font-size: 13px" readonly="readonly">
</div>

<div class="form-group">
<label for="field">&nbsp;분야<span class="rq">*</span></label>
<select class="form-select"  id="field" name="field" style="margin-top: 3px; font-size: 13px">
  <option selected >선택</option>
  <option>개발 · 프로그래밍</option>
  <option>직무 · 마케팅</option>
  <option>커리어</option>
  <option>기타</option>
</select>
</div>

<br><br><br>
<h6 style="font-weight: bold; padding-bottom: 20px">&nbsp;멘토링 정보</h6>

<div class="form-group">
<label for="jobgroup">&nbsp;직군<span class="rq">*</span></label>
<select class="form-select form-select-sm" id="jobGroup" name="jobGroup" onchange="selectChange(this)">
  <option>선택</option>
  <option value="1">개발</option>
  <option value="2">디자인</option>
  <option value="3">마케팅</option>
  <option value="4">경영/인사</option>
</select>
</div>

<div class="form-group">
<label for="jobduty">&nbsp;직무<span class="rq">*</span></label>
<select id="jobDuty" name="jobDuty" class="form-select form-select-sm">
 	<option>선택</option>
</select>
</div>

<div class="form-group">
<label for="career">&nbsp;경력<span class="rq">*</span></label>
<select id="career" name="career" class="form-select form-select-sm">
  <option>선택</option>
  <option>신입 (1년이하)</option>
  <option>주니어 (1~3년)</option>
  <option>미들 (4~8년)</option>
  <option>시니어 (9년이상)</option>
</select>
</div>

<div class="form-group">
<label for="co">&nbsp;현직</label>
<input class="form-control" type="text" id="coName" name="coName" placeholder="현재 근무하는 회사명을 적어주세요"  style="margin-top: 3px; font-size: 13px"></div>

<div class="form-group">
<label for="price">&nbsp;가격<span class="rq">*</span></label>
<p>&nbsp;(원 / 5000원이상)</p>
<input class="form-control" type="text" id="mtPrice" name="mtPrice" placeholder="ex. 10,000원"  style="margin-top: 3px; font-size: 13px"></div>

<br>

<div class="form-group">
<label for="title">&nbsp;제목<span class="rq">*</span></label>
<input class="form-control" type="text" id="mtboardTitle" name="mtboardTitle" placeholder="제목을 입력해주세요"  style="margin-top: 5px; font-size: 13px"></div>

<div class="form-group">
<label for="content">소개글을 작성 해주세요<span class="rq">*</span></label>
<textarea id="mtboardContent" name="mtboardContent" rows="11" style="width: 100%" ></textarea>
</div>


<div class="form-group">
	<label for="file"></label>
	<input type="file" id="file" name="file">
</div>
<br><br><br>

</div><!-- 스크롤바 -->

<div class="btn-zip">
<input type="reset" id="cancel" class="btn btn-primary" value="취소">
 <button class="btn btn-primary" id="btnWrite">등록</button>
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

</script>



</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>