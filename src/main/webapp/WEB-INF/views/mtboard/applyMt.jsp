<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 지원폼</title>
<c:import url="../layout/header.jsp" /> 

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/applyMt.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){ 
    $("#apply_btn").on('click',function(){ // 제출 버튼 이벤트 지정
        $.ajax({
            url: "/mtboard/applyMt", // 목적지
            type: "POST", // HTTP Method
            data: $("#applyMt").serialize(), // 전송 데이터
            success: function(data){ // 성공 시 실행
                alert('제출이 완료되었습니다. 지원해주셔서 감사합니다.');
                location.href = "/mtboard/list";
            }, error: function(data) {
				alert('다시 시도해주세요.')
				console.log("실패"); 
            }	
			
        })
    })
    
})

</script>
</head>
<body>

<main id="main">

<!-- 상단 멘토지원 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
		<p class="mentoring_txt">
			☁️ 나누고 싶은 지식을 가진 누구나 멘토가 될 수 있어요! ☁️<br>
			자신만의 노하우를 널리 알려주세요
		</p>
		<a class="btn btn-primary" href="/mtboard/mentoApply" type="button">멘토 지원하기</a>
	</div>
</div>

<main class="all_content">
<div class="applyForm">
<form id="applyMt" class="applyMt" name="applyMt" >
<div class="naming">Study Cloud 아이디
<input class="form-control" type="text" aria-label="default input example" style="margin-top: 5px; font-size: 13px" value="${login_id}" readonly="readonly"></div>
<div class="naming">이메일
<input class="form-control" type="text" aria-label="default input example" style="margin-top: 5px; font-size: 13px" value="${member_email}" readonly="readonly"></div>
<div class="naming">이름
<input class="form-control" type="text" aria-label="default input example" style="margin-top: 5px; font-size: 13px" value="${member_name}" readonly="readonly"></div>
<div class="naming">연락처
<input class="form-control" type="text" aria-label="default input example" style="margin-top: 5px; font-size: 13px" value="${member_phone}" readonly="readonly"></div>

<div class="naming">분야
<select class="form-select" aria-label="Default select example" id="field" name="field" style="margin-top: 5px; font-size: 13px">
  <option>개발 · 프로그래밍</option>
  <option>어학 · 외국어</option>
  <option>직무 · 마케팅</option>
  <option>커리어</option>
  <option>기타</option>
</select>
</div>

<div class="naming">간단한 자기소개 글을 작성해주세요
<textarea class="form-control" id="applymtContent" name="applymtContent" rows="10" style="margin-top: 6px;"></textarea>

<button type="button" class="btn btn-primary" id="apply_btn">제출하기</button>
</div>
</form>

</div>
</main>
</main>

<c:import url="../layout/footer.jsp" /> 
</body>
</html>