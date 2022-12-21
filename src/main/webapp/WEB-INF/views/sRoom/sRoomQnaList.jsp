<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<style type="text/css">
.qna_box { display: none; }
#hideBtn { display: none; }
.qnaBtnBox { font-size: 20px; text-align: center; width: 300px; background-color: #aacde5; 
			 height: 50px; line-height: 50px; margin: 0 auto; font-weight: bold;}
.qnaBtnBox a { text-decoration: none; color: white; }		
.secretView { background-color: #e3eff9; font-weight: bold; text-align: center; height: 75px; line-height: 75px; }	 
</style>   
<script type="text/javascript">
$(document).ready(function() {
	moreAndHide()

	// 비밀글 체크여부
	$("input[name=sRoomQnaUpdateSecret]").change(function() {
		if( $(this).is(":checked") ) {
			$(this).val(1);
			console.log($(this).val())
		} else {
			$(this).val(0);
			console.log($(this).val())
		}
	})
})

// qna 수정
function qnaUpdate(qnaNo, sRoomN) {
	var updateTitle = $("#sRoomQnAUpdateTitle").val();
	var updateContent = $("#sRoomQnAUpdateContent").val();
	
	if( updateTitle == "" ) {
		$("#sRoomQnAUpdateTitle").attr("value", updateTitle);
	}
		
	if( !($("input[name=sRoomQnaUpdateSecret]").is(":checked")) ) {
		$("input[name=sRoomQnaUpdateSecret]").val(0);
	} else {
		$("input[name=sRoomQnaUpdateSecret]").val(1);
	}
	var secret = $("input[name=sRoomQnaUpdateSecret]").val();
		
	console.log("수정할 Qna 번호 : " + qnaNo);
	console.log("수정할 Qna 제목 : " + updateTitle);
	console.log("수정할 Qna 내용 : " + updateContent);
	console.log("수정할 Qna 스터디룸 번호 : " + sRoomN);
	
	$.ajax({
		url: "/sRoom/sRoomQnaUpdate",
		type: "POST",
		data: { "sRoomQnaNo" : qnaNo, "sRoomQnaTitle" : updateTitle, "sRoomQnaContent" : updateContent, "sRoomQnaSecret" : secret, "sRoomNo": sRoomN },
		success : function(r) {
			console.log("[댓글 수정] AJAX 요청완료");
			$("#sRoomQnaArea").html(r);
		}
	}) // ajax
	
} // update

function updateModalPopUp(qnaNo, qnaTitle, qnaContent, sRoomN) {
	console.log("수정모달 클릭")
	console.log("qna 번호 : " + qnaNo);
	console.log("qna 제목 : " + qnaTitle);
	console.log("qna 내용 : " + qnaContent);
	console.log("qna 스터디룸 번호 : " + sRoomN);
	
	$("#sRoomQnAUpdateTitle").attr("value", qnaTitle);
	$("#sRoomQnAUpdateContent").text(qnaContent);
	$("#qnaUpdateBtn").attr("onclick", "qnaUpdate(" + qnaNo + "," + sRoomN + ")")
	$(".updateMyModal").css("display", "block"); 
}

// QnA 삭제
function deletesRoomQna(qnaNo, sRoomN) {
	console.log("삭제모달 클릭");
	console.log("qna 번호 : " + qnaNo);
	console.log("qna 스터디룸 번호 : " + sRoomN);
	
	swal({
		title: "작성하신 QnA를 삭제 하시겠습니까?",
		showCancleButton: true,
		confirmButtonColor: "#6cc4dc",
		buttons: ["아니요", "예"]
	}).then(function(isConfirm) {
		if(isConfirm) {
			$.ajax({
				url: "/sRoom/sRoomQnaDelete",
				type: "POST",
				data: { "sRoomQnaNo" : qnaNo, "sRoomNo": sRoomN },
				success : function(r) {
					console.log("[댓글 삭제] AJAX 요청완료");
					$("#sRoomQnaArea").html(r);
				}
			}) // ajax
		} // isConfirm 
	})
	
}
	
function moreAndHide() {
	// 펼치기
	$(".qna_box").slice(0, 2).show();
	$("#moreBtn").click(function(e) {
		e.preventDefault();
		$(".qna_box:hidden").slice(0, 2).slideDown();
		if($(".qna_box:hidden").length == 0){
			$("#moreBtn").hide();
			$("#hideBtn").show();
			
		}
	})
	
	// 접기
	$("#hideBtn").on("click", function(e) {
		e.preventDefault();
		var length = $(".qna_box:hidden").length-2;
		console.log($(".qna_box").length)
		$(".qna_box").slice(2).slideUp();
		$("#hideBtn").hide();
		$("#moreBtn").show();
	})
	
} 	
	
</script>

<div class="infoBox">
	<ul class="Qna_list">
		<li class="qna_hr">
			<c:choose>
				<c:when test="${not empty qnaList }">
					<c:forEach items="${qnaList }" var="qnaList">
						<div class="qna_box" id="qnaCont${qnaList.SROOMQNA_NO }">
							<c:choose>
								<c:when test="${qnaList.AUTHORITY == 3}">
									<div></div>
								</c:when>
								<c:otherwise>
									<span><img src="/upload/${qnaList.FILEUPLOAD_STOR }" class="pimg" onerror="this.src='https://ifh.cc/g/BQ84hH.jpg'"></span>
								</c:otherwise>
							</c:choose>
								<c:choose>
									<c:when test="${qnaList.AUTHORITY == 4}"> <!-- 관리자 답변일 때 -->
										<p class="write_name" style="color: red;"> &nbsp;&nbsp;&nbsp;ㄴ&nbsp;[관리자 답변] ${qnaList.MEMBER_NICK }</p>
									</c:when>
									<c:otherwise>
										<p class="write_name">${qnaList.MEMBER_NICK }</p>
									</c:otherwise>
								</c:choose>
							<input type="hidden" id="mAuthority" value="${qnaList.AUTHORITY }">
							<c:choose>
								<c:when test="${qnaList.SROOMQNA_SECRET eq 1}"> <!-- 비밀글일때 -->
									<c:choose>
										<c:when test="${member_no eq qnaList.MEMBER_NO || member_id eq 'admin'}">
											<p class="qna_cont" style="font-weight: bold;">[ ${qnaList.SROOMQNA_TITLE } ]</p>
											<p class="qna_cont">${qnaList.SROOMQNA_CONTENT }</p>
											<p class="write_date"><fmt:formatDate value="${qnaList.SROOMQNA_DATE }" pattern="yy-MM-dd HH:mm:ss"/></p>
										</c:when>
										<c:otherwise>
											<div class="secretView">🔒 비밀글이 설정된 QnA 입니다.</div>
										</c:otherwise>																
									</c:choose>
								</c:when>
								<c:otherwise> <!-- 비밀글 아닐 때 -->
									<p class="qna_cont" style="font-weight: bold;">[ ${qnaList.SROOMQNA_TITLE } ]</p>
									<p class="qna_cont">${qnaList.SROOMQNA_CONTENT }</p>
									<p class="write_date"><fmt:formatDate value="${qnaList.SROOMQNA_DATE }" pattern="yy-MM-dd HH:mm:ss"/></p>
								</c:otherwise>
							</c:choose>
									
							<c:if test="${member_no eq qnaList.MEMBER_NO}">
							<button class="miniBtn" type="button" onclick="updateModalPopUp(${qnaList.SROOMQNA_NO }, '${qnaList.SROOMQNA_TITLE}', '${qnaList.SROOMQNA_CONTENT }', ${qnaList.SROOM_NO } )">수정</button>
							<button class="miniBtn" type="button" onclick="deletesRoomQna(${qnaList.SROOMQNA_NO }, ${qnaList.SROOM_NO })">삭제</button>
							</c:if>
						</div>
					</c:forEach>							
				</c:when>
				<c:otherwise>
					<div class="qna_box_empty">🔎 등록된 QnaA가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</li>
	</ul>				
</div>
<div class="qnaBtnBox">
	<a href="#" id="moreBtn">더보기</a>
	<a href="#" id="hideBtn">접기</a>
</div>

			
			
				
<!-- The Modal -->
<div id="myModal3" class="modal-custom updateMyModal">

   <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
           	<h1 class="modal-title fs-5" id="exampleModalLabel">QnA 수정하기</h1>
        </div>
        
        <div class="modal-body">
           	<form>
          		<div class="mb-3" id="updateTitle">
            		<div class="popup-text">제목</div>
            		<input type="text" class="form-control" id="sRoomQnAUpdateTitle">
          		</div>
          		<div class="mb-3">
            		<div class="popup-text qnaContent">문의내용</div>
            		<textarea class="form-control" id="sRoomQnAUpdateContent"></textarea>
          		</div>
          		<div class="mb-3">
            		<label class="form-check-label">비밀글 설정</label>            						
            		<input type="checkbox" class="form-check-input" name="sRoomQnaUpdateSecret">
          		</div>
        	</form>	
        </div>
        
         <div class="modal-footer">
        	<button type="button" class="close-modal" id="close">취소</button>
           	<button type="button" class="button" id="qnaUpdateBtn">수정하기</button>
        </div>
    </div>
</div>					
