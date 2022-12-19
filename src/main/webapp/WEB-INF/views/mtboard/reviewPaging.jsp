<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
var btnModifyReview = document.getElementById("btnModifyReview")
var btnModifyReviewCancel = document.getElementById("btnModifyReviewCancel")
var btnReview = document.getElementById("btnReview")
var btnModifyReview = document.getElementById("btnModifyReview")
var mtboardNo = document.getElementById("mtboardNo")
})

function modify(e, score){
	var classname = e.classList[1]
	classname  = classname.substring(3)
	
	// 리뷰 수정 전용 버튼 보이기
	btnModifyReview.style.display = ''
	btnModifyReviewCancel.style.display = ''
	// 리뷰 등록 전용 버튼 숨기기
	btnReview.style.display = 'none'
	var contentClassName = 'txt'+classname;
	console.log(contentClassName)
	var content = document.getElementsByClassName(contentClassName)[0]
	
	// 리뷰 등록 textarea에 수정할 댓글값 할당	
	$('#reviewContents').val(content.innerText)

	// 리뷰 스코어에 수정할 댓글 스코어 나타내기
	$('input[type=radio]')
	$(":radio[name='reviewStar'][value='" + score + "']").attr('checked', true);
	
	// 리뷰 등록 버튼 엘리먼트에 수정할 댓글의 시퀀스를 할당
	btnModifyReview.setAttribute('name',classname)
}

function deleteReview(e){
	var classname = e.classList[1]
	classname  = classname.substring(3)
	var mtboardNoData = mtboardNo.value
	console.log(mtboardNoData)
	var cf = window.confirm('삭제하시겠습니까?')
	if(cf){
		location.href='/mtboard/deleteReview?reviewNo='+classname+"&mtboardNo="+mtboardNoData
	}
}

function cancel(){
	// 리뷰 수정 전용 버튼 숨기기
	btnModifyReview.style.display = 'none'
	btnModifyReviewCancel.style.display = 'none'
	// 리뷰 등록 전용 버튼 보이기
	btnReview.style.display = ''
}

function submitModify(e){
	var no =  e.name 
	console.log(no)
	 
	var form = $('#mt_review')
	form.attr("action", "/mtboard/updateReview")
	form.append($('<input/>', {type: 'hidden', name: 'no', value:no }));	
	form.submit();
}



</script>    
 
<!-- 댓글작성 -->

<c:if test="${isBuyer}">
<form class="mb-3" name="mt_review" id="mt_review" method="post" action="/mtboard/writeReview">
	<input type="hidden" id="mtboardNo" name="mtboardNo" value="${mtViewBoard.MTBOARD_NO}">
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" name="reviewContents" id="reviewContents"
				  placeholder="후기를 입력해주세요"></textarea>
	</div>
	
	 <button class="btn btn-primary" id="btnReview">등록 </button>
	 <button type="button" class="btn btn-primary" style="display:none" onclick="submitModify(this)" id="btnModifyReview">수정 등록 </button>
	 <button type="button" class="btn btn-primary" style="display:none" id="btnModifyReviewCancel" onclick="cancel()">수정 취소 </button>
	 
</form>		
</c:if>
<br><br>	
<h6>후기 (<span class="reply_cnt" style="font-weight: bold;"> ${CntReview } </span>)</h6>

		 
<c:choose>
	<c:when test="${not empty reviewList }">    
    <c:forEach items="${reviewList}" var="review">
    <ul class="reply_content_ul">
	<li>
		<div class="comment_wrap">
		<div class="reply_top">
			<span class="id_span">${review.NICKNAME}</span>
			<span class="date_span"><fmt:formatDate pattern="yyyy-MM-ddㅤHH:mm" value="${review.MTREVIEW_DATE }"/></span>
		
			<span class="rating_span">★<span class="rating_value_span">${review.MTREVIEW_SCORE}</span></span>
			<c:if test="${loginNo != null && loginNo == review.MEMBER_NO}">
				<a class="update_reply_btn btn${review.MTREVIEW_NO}" onclick="modify(this, '${review.MTREVIEW_SCORE}')">수정</a>
				<a class="delete_reply_btn btn${review.MTREVIEW_NO}" onclick="deleteReview(this)">삭제</a>
			</c:if>
		
		</div>
			<div class="reply_bottom">
			<div class="reply_bottom_txt txt${review.MTREVIEW_NO}">
			${review.MTREVIEW_CONTENT}
			</div>
			</div>
		</div>
		</li>
	</ul>
	</c:forEach>		

<div class="repy_pageInfo_div">
	<ul class="pageMaker" id="pageMaker">

<c:choose>
<c:when test="${commtPaging.startPage ne 1 }">
<li class="pageMaker_btn prev">
<a onclick="cntMove(${commtPaging.startPage - commtPaging.pageCount })">이전</a>
</li></c:when>
</c:choose>

<c:forEach begin="${commtPaging.startPage }" end="${commtPaging.endPage }" var="i">
<c:if test="${commtPaging.curPage eq i }">
<li class="pageMaker_btn" id="page_btn">
<a onclick="cntMove(${i })">${i }</a></li>
</c:if>

<c:if test="${commtPaging.curPage ne i }">
<li class="pageMaker_btn" id="page_btn">
<a onclick="cntMove(${i })">${i }</a>
</li>
</c:if>
</c:forEach>

<c:choose>
	<c:when test="${commtPaging.endPage ne commtPaging.totalPage }">
<li class="pageMaker_btn next">
<a onclick="cntMove(${commtPaging.startPage + commtPaging.pageCount })">다음</a>
</li>
</c:when>							
</c:choose>

</ul>
</div>
</c:when>
<c:otherwise>
		<textarea class="Empty" id="reviewContents" style="font-size: 17px;" disabled >멘토링 신청 후 리뷰 작성이 가능합니다.😄</textarea>
	</c:otherwise>
</c:choose>	