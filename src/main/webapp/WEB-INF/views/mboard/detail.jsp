<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud☁️</title>
<c:import url="../layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<script type="text/javascript">

//글자 수 제한 
$(document).ready(function() {
	$('.commentbox').keyup(function () {
		var content = $(this).val();
		$('#counter').html("("+content.length+"/ 최대 200자"+")");  //글자수 실시간 카운트
		
		if (content.length > 200) {
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0,200));
			$('#counter').html("(200 / 최대 200자)");
		}
	});
});

</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnMain").click(function() {
		location.href = "/mboard/main"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/mboard/update?mBoardNo=${detailMboard.MBOARD_NO }"
	})
	
	$("#btnDelete").click(function() {
		alert("번개글을 삭제하시겠습니까?")
		location.href = "/mboard/delete?mBoardNo=${detailMboard.MBOARD_NO }"
	})
})

</script>


<!-- 좋아요 기능 js -->
<script type="text/javascript">
$(document).ready(function() {
	
// 	좋아요 여부 확인
// 	var markcase = ${likecnt };
	
// 	if( markcase > 0) {
// 		console.log(markcase);
// 		$("#mLike").attr("src", "/resources/se2/img/thumbs-up-regular.svg");
// 	} else {
// 		console.log(markcase);
// 		$("#mLike").attr("src", "/resources/se2/img/thumbs-up-solid.svg");
// 	}
	
	$("#mLikebtn").on("click", function() {
		var heart = $("#mLikebtn");
		var no = ${detailMboard.MBOARD_NO };
		
		if(${empty login}) {
			alert("로그인 후 이용해주세요.")
			return false;
		}
	
		$.ajax({
			url: "/mboard/mboardLike"
			, type : "POST"
			, data : { "mboardNo" : no }
			, success : function(res) {
				heart.prop("name", res);
				if(res==1) {
					$("#mLike").attr("src", "/resources/se2/img/thumbs-up-regular.svg");
				} else {
					$("#mLike").attr("src", "/resources/se2/img/thumbs-up-solid.svg");
					alert("번개 게시글 좋아요 등록 완료!")
				}
			}
			
		})
	})
})

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

.whole1{
	margin: 0 auto;
	width: 950px;
/* 	border-bottom: 0.5px solid #aacde5; */
/* 	padding-bottom: 8px; */
}

.title {
	margin-top: 5%;
	padding-bottom: 15px;
	font-family: Pretendard;
	
}

.nav-detail {
/* 	padding-top: 5px; */
	text-decoration: none;
	height: 30px;
	border-bottom: 0.5px solid rgba(0,0,0,.1);
	padding-bottom: 40px;
	
}

.nav-info-detail {
	float: left;
	padding-right: 13px;;
	border-right: 1px solid rgba(0,0,0,.1);
	padding-left: 13px;
	font-size: 13px;
	color: 1px solid #aacde5;
}

.content {
	padding-top: 30px;
	padding-bottom: 10px;
}

.button-ms {
	float: right;
	margin-bottom: 40px;
/* 	background-color: #aacde5; */
}


.container2 {
	background-color: #f8f9fa;
	height: 500px;
	border-top: #f1f3f5;
	display: flex;
}	

.comment {
	margin: 0 auto;
	width: 950px;
	background-color: #f8f9fa;
	font-family: Pretendard;
	
}

.whole2 {
	margin-top: 4%;
	background-color: #e3eff9;
/* 	height: 500px; */
	border-top: 1px solid #f1f3f5;
}	

.container2 {
	margin: 0 auto;
	width: 900px;
	margin-top: 20px;
	padding-left: 3px;
	padding-right: 3px;
	background-color: #e3eff9;
}


.commentbox {
	border-color: #dad6d6;
	$box-shadow:  0 .5rem 1rem rgba($black, .15);
}

textarea {
	resize: none;
	border: none;
	box-shadow: 1px 1px 7px #CFCFCF;
/* 	border-radius: 0.5rem; */
	background-color: #FAFAFA;
	
}

textarea:focus {
	outline: none;
	outline-color: 2px solid #aacde5;
}

:root {
	--bs-body-color: #60392a; 
}

.btn {
	background-color:  #6cc4dc;
	border: none;
}

#mLike {
	filter: invert(46%) sepia(93%) saturate(308%) hue-rotate(153deg) brightness(94%) contrast(87%);
}

</style>

</head>
<body>
<div class="header-box">
		실시간 번개 스터디에 참여해보세요!⚡<br>
		Join the Flash-Gathering!
</div>
	
	
<section class="whole1">
	
		<div class="title">
			<h1>${detailMboard.MBOARD_TITLE }</h1>
			<div class="button-ms" style="margin-top: 13px;">
<!-- 				<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#sendmessageModal" data-bs-whatever="yubin kim">✉️쪽지 보내기</button> -->
<!-- 				<button type="button" class="btn btn-primary btn-sm" style="background-color: #6cc4dc; border: none;">✉️쪽지 보내기</button> -->
			</div>
<!-- 쪽지보내기 모달  -->
<div class="modal fade" id="sendmessageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">쪽지</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">보내기</button>
      </div>
    </div>
  </div>
</div>			
			
		</div>
		
		
		<div class="nav-detail">
			<div class="nav-info-detail" style="padding-left: 0px; font-weight: bolder;">${detailMboard.MEMBER_NICK }</div>
			<div class="nav-info-detail"><fmt:formatDate value="${detailMboard.MBOARD_DATE }" pattern="yy-MM-dd HH:mm:ss"/></div>
			<div class="nav-info-detail">조회수 ${detailMboard.MBOARD_HIT }</div>
			<div class="nav-info-detail" style="border-right: none;">like ${detailMboard.MBOARD_LIKECNT }</div>
			
			<div class="thumbs_icon">
				<div class="button" type="button" id="mLikebtn" name="mLikebtn">
					<img src="/resources/se2/img/thumbs-up-regular.svg" id="mLike" name="mlike" style="width: 25px; height: 25px;float: right; margin-right: 12px;">
				</div>
			</div>
		</div>
		
		<div class="content">
			${detailMboard.MBOARD_CONTENT }
		</div>
		<br><br><br><br><br>
		<hr>
		<div class="file">
		<div class="filesection">🖇️첨부파일🖇️</div>
				<a href="/mboard/download?fileUploadNo=${fileUpload.fileUploadNo }">${fileUpload.fileUploadOri }</a>
		</div>
		
		<div class="go-button" style="float:right;">
			<button type="button" id="btnMain" class="btn btn-primary" style="background-color: #6cc4dc; border: none;">목록</button>
	
			<c:if test="${memberNo eq detailMboard.MEMBER_NO }">
					<button type="button" id="btnUpdate" class="btn btn-primary" style="background-color: #6cc4dc; border: none;">수정</button>
					<button type="button" id="btnDelete" class="btn btn-danger" style="background-color: #6cc4dc; border: none;">삭제</button>
			</c:if>
		</div>
</section>

<!-- 댓글 부분 -->
<section class="whole2"> 
 		<div class="container2"> 
 			<div class="mb-3">
 				
 				<div class="comment-box">
 					<form name="commentInsertForm" method="post" enctype="multipart/form-data">				
 					<div class="comtitle"><h3 style="color: #C1C2C2">Comments</h3></div>
 					<div class="cominput">
 						<textarea class="commentbox" name="com-content"  style="width: 894px; height: 200px;"></textarea>
 					
 					<div class="com2">
 						<div class="com-btn" style="float: right;">
 							<button type="button" class="btn btn-primary btn-sm" style="background-color: #6cc4dc; border: none;">댓글 등록</button>
 						</div>
 						
 						<span style="color: #aaa; font-size: 14px;" id="counter">(0 / 최대 200자)</span>
 					</div>
 					</div>
 					</form>
 				</div>
 				
 			</div>
 		</div> 
</section>
		
	




<c:import url="../layout/footer.jsp" />
</body>
</html>