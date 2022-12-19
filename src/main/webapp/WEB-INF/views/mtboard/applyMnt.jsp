<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토링 신청폼</title>
<c:import url="../layout/header.jsp" /> 

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/applyMnt.css?ver=3"> 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

 <!-- 타임피커 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- 플랫피커 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="../resources/js/applyMnt.js?ver4"></script>


<script type="text/javascript">

$(document).ready(function() {
	$("#btnNext").click(function() {
		var stTimepicker = $('#stTimepicker').val()
		var edTimepicker = $('#edTimepicker').val()
		
		var stTime  = stTimepicker.split(":")[0]
		var edTime  = edTimepicker.split(":")[0]
		
		if(stTime > edTime){
			console.log("over")
		}
		
		//location.href = "/mtboard/pay_info"
	})
	
})

</script>

</head>

<body>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content" style="background-color: #e3eff9; padding: 20px" >
      <div class="modal-header" style="border: none;">
        <h2 class="modal-title" id="exampleModalLabel">멘토링 이용안내</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h5 style="margin-bottom: 40px">결제·환불 유의사항</h5><br>

			<div class="refund_txt">멘토링 환불은 멘토링 시작시간 기준으로 진행되며,<br>
				120시간전 취소 시, 전액 환불이 가능합니다.</div>
				<br><br>
					<span>120시간 전 취소 시 : 전액환불</span><br>
					<span>120시간 ~ 24시간 취소시 : 40% 환불</span><br>
				<span>24시간 내 취소 시 : 환불 불가</span><br>
					<br>
      </div>
      </div>
    </div>
  </div>

<main id="main">

<!-- 상단 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
			<h1>☁️ ☁️ ☁️</h1>
	</div>
</div>

<main class="all_content">

<form action="./applyMnt" method="post" enctype="multipart/form-data">

<div class="applyForm">
<h3>신청하기</h3>
<br>
<button type="button" class="notice_btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
🔍︎ 결제 · 환불 규정</button>


<br><br><br>
<input type="hidden" id="mtboardNo" name="mtboardNo" value="${mtboardNo}"/>
<div class="naming">&nbsp;이메일<span class="rq">*</span>
<input class="form-control" type="text" id="memberEmail" value="${email}" readonly="readonly" name="memberEmail" aria-label="default input example" style="margin-top: 5px; font-size: 13px"></div>
<div class="naming">&nbsp;연락처<span class="rq">*</span>
<input class="form-control" type="text" id="memberPhone" name="memberPhone" value="${phone}" readonly="readonly" aria-label="default input example"  style="margin-top: 5px; font-size: 13px"></div>

<!-- 플랫피커 -->
<div class="naming">
&nbsp;<img src="https://ifh.cc/g/DKHHRY.png" style="width: 20px; margin-left: 5px; margin-bottom: 3px;">
일정 선택<span class="rq">*</span>
<input type="text" id="mntDate" name="mntDate" class="form-control" placeholder="날짜를 선택하세요">
</div>


<!-- 타임피커 -->
<div class="naming">
<div class="row">
  <div class="col">
<img src="https://ifh.cc/g/Snad3z.png" style="width: 20px; margin-left: 5px; margin-bottom: 3px;">
&nbsp;시작<span class="rq">*</span> 
<input id="stTimepicker" name="stTime" class="form-control" type="text"  style="width: 300px">
</div>

<div class="col">
<img src="https://ifh.cc/g/Snad3z.png" style="width: 20px; margin-left: 40px; margin-bottom: 3px;">
&nbsp;종료<span class="rq">*</span>
<input id="edTimepicker" name="edTime" class="form-control" type="text" style="width: 300px; float: right;">
</div>
</div>
</div>



<div class="naming">멘토에게 남길 메시지
<textarea name="mntContent" class="form-control" id="exampleFormControlTextarea1" rows="10" style="margin-top: 6px;" placeholder="자유롭게 적어주세요"></textarea>
</div>


<div class="btn-zip">
 <button class="btn btn-primary" id="btnNext">다음</button>
</div>

</div>
</form>
<!-- </form> -->
</main>
</main>


<c:import url="../layout/footer.jsp" /> 
</body>
</html>