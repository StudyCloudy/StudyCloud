<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% Object idObject = session.getAttribute("loginid");  
 	boolean isLogin = (idObject != null);  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘티찾기｜게시글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../layout/header.jsp" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="/resources/css/mntBoardView.css?ver=4"> 
<script src="../resources/js/mntBoardView.js?ver=1"></script>

<script type="text/javascript">


function cntMove(pageNo, mntBoardNo) {
	console.log(pageNo);
	$.ajax({
			type: "Get"
		   , url: "/mntboard/commtPage"
		   , data: {
			   curPage: pageNo
			   , mntboardNo: ${param.mntboardNo}
		   }
		   , dataType: "html"
		   , success: function( c ) {
			   $("#commtPage").html(c)
		   }
		})
	}
	
 
$(document).ready(function() {
	
	var isLogin = $('#hiddenIsLogin').val()
	isLogin = $.parseJSON(isLogin);

	var pageNo = ${commtPaging.curPage};
	var mntBoardNo = ${mntViewBoard.MNTBOARD_NO}
	console.log( "현재 페이지 :" + pageNo); // 현재페이지 확인
	console.log("현재 글번호 : " + mntBoardNo); // 현재 게시글번호 확인
	cntMove(1, mntBoardNo);	
	
	
	$("#MntbtnList").click(function() {
		location.href = "/mntboard/list"
	})
	 $("#MntbtnUpdate").click(function() {
			location.href = "/mntboard/update?mntboardNo=${mntViewBoard.MNTBOARD_NO}"
	 })
	$("#MntbtnDelete").click(function() {
		alert('게시글을 삭제하였습니다.')
		location.href = "/mntboard/delete?mntboardNo=${mntViewBoard.MNTBOARD_NO}"
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
				, url: "/mntboard/like"
				, data: {
					"memberNo" : '${member_no}'
					, "mntboardNo": ${param.mntboardNo}
				}
				, dataType: "json"
				, success: function( data ) {
	 				console.log("성공");

					
	 				if(data.result) { //좋아요 성공
						$("#Mheart").css("color", "red");
						alert('좋아요 성공!')
					
					} else { //좋아요 취소 성공
						$("#Mheart").css("color", "");
						alert('좋아요 취소!')
					
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
			
	}); 
				
				
	if('true' == '${like}') {
		$("#Mheart").css("color", "red");
	} else {
		$("#Mheart").css("color", "");
	}
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

<div class="mnt_allwrap">
<div class="mnt_wrap1">


<div class="mnt_title">
	<h2 style="font-weight: 600; margin-bottom: 36px;">${mntViewBoard.MNTBOARD_TITLE }</h2>
</div>
<!-- 공유 -->
<div class="func_btn">
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="share">
<i class="bi bi-share"></i>
</button>

<!-- 좋아요 -->
<button type="button" class="btn_heart btn btn-primary" id="heart">
<i id="Mheart" class="fa fa-heart"></i>
</button>


<!-- 쪽지 -->
<button type="button" class="btn btn-primary" id="msg">
	<i class="bi bi-envelope"></i>
</button>
</div>
<span class="mnt_id">${mntViewBoard.MEMBER_NICK }</span><br>
<span class="write_date"><fmt:formatDate value="${mntViewBoard.MNTBOARD_DATE }"  type="both" dateStyle="default" timeStyle="short"/></span>


<br><br>
<br>

<div>
<button class="select_field">${mntViewBoard.FIELD }</button>
<span class="mnt_hit">조회수 ${mntViewBoard.MNTBOARD_HIT }</span>
</div>

</div> <!-- mnt_wrap1 끝 -->


<%-- <div><a class="filedown" href="/mntboard/download?fileUploadNo=${fileUpload.fileUploadNo}">${fileUpload.fileUploadOri }</a></div> --%>
<!-- 본문 -->
<div class="mnt_wrap2">

		
<hr>

<div class="mnt_content">
${mntViewBoard.MNTBOARD_CONTENT }
<div class="image">
	<img style=" width: 500px; height: 200px;" src="/upload/${fileUpload.fileUploadOri}" alt="mento-attach-img">
</div>
</div>


</div><!-- mnt_wrap2 끝 -->
<hr>	

<div class="mnt_wrap3">
<input type="hidden" id="hiddenIsLogin" value="<%=isLogin %>">
<!-- 댓글 페이징 -->
<div id="commtPage">
<c:import url="/WEB-INF/views/mntboard/commtPage.jsp?ver=3" /> 
</div>


</div><!-- mnt_wrap3 끝 -->


<div class="btn-wrap">
	<button id="MntbtnList" class="btn btn-primary">목록</button>
	<c:if test="${member_no eq mntViewBoard.MEMBER_NO}">
		<button id="MntbtnUpdate" class="btn btn-primary">수정</button>
		<button id="MntbtnDelete" class="btn btn-primary">삭제</button>
	</c:if>	
</div>
</div> <!-- mnt_allwrap 끝 -->
</main> <!-- main 끝 -->

<c:import url="../layout/footer.jsp" /> 

</body>
</html>



