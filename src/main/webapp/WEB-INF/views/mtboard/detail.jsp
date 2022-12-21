<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% Object idObject = session.getAttribute("loginid");  
 	boolean isLogin = (idObject != null);  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토찾기｜게시글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../layout/header.jsp" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="/resources/css/mtBoardDetail.css?ver=1"> 
<script src="../resources/js/mntBoardView.js?ver=1"></script>

<script type="text/javascript">


	$(document).ready(function() {
		function modify(e){
			console.log(e)
		}
		
		var isLogin = $('#hiddenIsLogin').val()
		isLogin = $.parseJSON(isLogin);
		
		$("#MtbtnList").click(function() {
			location.href = "/mtboard/list"
		})
		 $("#MtbtnUpdate").click(function() {
				location.href = "/mtboard/update?mtboardNo=${mtViewBoard.MTBOARD_NO}"
		 })
		$("#MtbtnDelete").click(function() {
			alert('게시글을 삭제하였습니다.')
			location.href = "/mtboard/delete?mtboardNo=${mtViewBoard.MTBOARD_NO}"
		}) 
		
		/* 쪽지 보내기 */
		$("#msg").click(function(){
			if(isLogin){
				// 쪽지보내기 로직 구현
			}else{
				alert('로그인 이후 이용해주세요.')
			}
		})
		
		/* 좋아요 버튼 */
		$(".btn_heart").click(function() {
			console.log("클릭됨");
			
			if(isLogin){
				$.ajax({
					type: "get"
					, url: "/mtboard/mark"
					, data: {
						"memberNo" : '${member_no}'
						, "mtboardNo": ${param.mtboardNo}
					}
					, dataType: "json"
					, success: function( data ) {
		 				console.log("성공");

						
		 				if(data.result) { //좋아요 성공
							$("#Mheart").css("color", "red");
							alert('찜하기 성공! \n찜한 멘토는 마이페이지에서 확인 가능합니다.')
						
						} else { //좋아요 취소 성공
							$("#Mheart").css("color", "");
							alert('찜하기 취소!')
						
						}
						
					}
					, error: function() {
						alert('다시 시도해주세요.')
						console.log("실패");
					
					}
				})	
			} else {
				alert('로그인 이후 이용해주세요.')
			}
		}); //$(".btn_heart").click(function() end
				
				
	if('true' == '${mark}') {
		$("#Mheart").css("color", "red");
	} else {
		$("#Mheart").css("color", "");
	}
		
	// 신청하기 버튼 클릭시 로그인 여부 체크
	$('#applyBtn').click(function (){
		 if(isLogin){ // string value값에 따라 boolean으로 형변환
			location.href="/mtboard/applyMnt?mtboardNo="+${mtViewBoard.MTBOARD_NO}
			 
		}else{
			alert('로그인 이후 이용해주세요.')
		} 
		 
		})
})	

</script>
</head>
<body>


 <!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="background-color: #e3eff9; padding: 20px 26px 15px 41px;" >
      <div class="modal-header" style="border: none; font-size: 20px; padding-bottom: 35px">☁️ 공유하기 ☁️
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="color: white"></button>
      </div>
      
      <div class="modal-body">
      <button type="button" class="btn btn-secondary" id="link_btn" onclick="copyUrl()">
 		<i class="bi bi-link-45deg"></i>
	 </button> 링크 공유
 		
   <button type="button" id="kakao_btn" onClick="sendLinkCustom();" value="Custom">
      <img id="kakao_img" alt="카톡공유" src="https://ifh.cc/g/tqp2a6.png" style="border: none;">
      카카오톡 공유
      </button>
      </div>
    </div>
  </div>
</div> 



<!-- content 전체 wrap -->
<main id="main">

<!-- 상단 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
			<h1>☁️ ☁️ ☁️</h1>
	</div>
</div>


<div class="mt_allwrap">


<div class="mt_wrap1">

<div class="mt_hit">조회수 ${mtViewBoard.MTBOARD_HIT }</div>
<div class="mt_title">
	<h2 style="font-weight: 600; margin-bottom: 36px;">${mtViewBoard.MTBOARD_TITLE }</h2>
</div>


<!-- 공유 -->
<div class="func_btn">
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="share">
<i class="bi bi-share"></i>
</button>

<!-- 찜하기 -->
<button type="button" class="btn_heart btn btn-primary" id="heart">
<i id="Mheart" class="fa fa-heart"></i> 
</button>

<!-- 쪽지 -->
<button type="button" class="btn btn-primary" id="msg">
	<i class="bi bi-envelope"></i>
</button>
</div>

<p class="mt_id">${mtViewBoard.MEMBER_NICK }</p>

<table class="info_table">
<tr>
	<td class="info_name" scope="row">직무</td>
	<td>${mtViewBoard.JOBDUTY }</td>
</tr>
<tr>
	<td class="info_name" scope="row">경력</td>
	<td>${mtViewBoard.CAREER }</td>
</tr>
<tr>
	<td class="info_name" scope="row">현직</td>
	<td>${mtViewBoard.CO_NAME }</td>
</tr>
</table>

<div class="mt_time">1시간 / ${mtViewBoard.MT_PRICE } 원</div>
<br>
<button class="select_field">${mtViewBoard.FIELD }</button>
<span class="write_date"><fmt:formatDate value="${mtViewBoard.MTBOARD_DATE }" type="both" dateStyle="default" timeStyle="short"/></span>
<hr>
</div> <!-- mt_wrap1 끝 -->
<div style="float: right;"><a class="filedown" style="font-size: 12px;" href="/mtboard/download?fileUploadNo=${fileUpload.fileUploadNo}">${fileUpload.fileUploadOri }</a></div>


<!-- 본문 -->
<div class="mt_wrap2">

<div class="mt_content">
${mtViewBoard.MTBOARD_CONTENT }
</div>
<div class="image">
	<img style=" width: 500px; height: 200px;" src="/upload/${fileUpload.fileUploadOri}" alt="mento-attach-img">
</div>


<a class="btn btn-primary" id="applyBtn"  type="button" style="float: right; font-size: 15px;">
신청하기</a> 
</div><!-- mt_wrap2 끝 -->
<hr>
<div class="mt_wrap3">
<input type="hidden" id="hiddenIsLogin" value="<%=isLogin %>">
	

<!-- 리뷰 -->	
<div class="reviewPaging">
<c:import url="/WEB-INF/views/mtboard/reviewPaging.jsp" />
</div>


<div class="text-center" style="margin-top: 241px">
	<button id="MtbtnList" class="btn btn-primary">목록</button>
	<c:if test="${member_no eq mtViewBoard.MEMBER_NO}">
		<button id="MtbtnUpdate" class="btn btn-primary">수정</button>
		<button id="MtbtnDelete" class="btn btn-primary">삭제</button>
	</c:if>	
</div>

</div><!-- mt_wrap3 끝 -->


</div> <!-- mt_allwrap 끝 -->
</main> <!-- main 끝 -->

<c:import url="../layout/footer.jsp" /> 

</body>
</html>















