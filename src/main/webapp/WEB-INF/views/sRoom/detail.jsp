<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/ca40b4f408.js"></script>

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- TimePicker -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- flatPickr -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- 카카오맵 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fd53e5f5c7d4e395ac101da53469ee2&libraries=services,clusterer,drawing"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 카카오 sdk -->

<link rel="stylesheet" href="../resources/css/sRoomDetail.css?ver=2">
<script defer src="../resources/js/sRoomDetail.js?ver=1"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	// 좋아요 검증
	var hnum = ${markCount};
	if( hnum > 0 ) {
		console.log(hnum);
		$("#mark").attr("src", "https://ifh.cc/g/6qDnPA.png");
	} else {
		console.log(hnum);
		$("#mark").attr("src", "https://ifh.cc/g/tyOqod.png");
	}
	
	// 좋아요 클릭
	$("#marks").on("click", function() {
		var heart = $("#marks");
		var srno = ${sRoomView.SROOM_NO};
			
		if(${empty login }) {
			alert("로그인이 필요한 서비스입니다.")	
			return false;
		}
		
		$.ajax({
			url: "/sRoom/sRoomMark",
			type: "POST",
			data : { "sRoomNo" : srno },
			success : function(res) {
				console.log("[찜하기] 전송성공");
				heart.prop("name", res);
				if(res==1) {
					$("#mark").attr("src", "https://ifh.cc/g/6qDnPA.png");
					swal("스터디룸을 찜하셨습니다!", "마이페이지에서 찜한 스터디룸을 확인하실 수 있습니다.");
				} else {
					$("#mark").attr("src", "https://ifh.cc/g/tyOqod.png");
					swal("찜하기를 취소하셨습니다.");
				}
				
				
				
			} // success
			
		}) // ajax
		
	}) // mark
	
	
	 
	// 비밀글 체크박스 이벤트
	$("input[name=sRoomQnaSecret]").change(function() {
		if( $(this).is(":checked") ) {
			$(this).val(1);
			console.log($(this).val())
		} else {
			$(this).val(0);
			console.log($(this).val())
		}
	})
			
	// QnA 등록
	$("#qnaWriteBtn").on("click", function() {
				
		var title = $("#sRoomQnATitle").val(); // 제목
		var qnaContent = $("#sRoomQnAContent").val(); // 내용
		
		if( !($("input[name=sRoomQnaSecret]").is(":checked")) ) {
			$("input[name=sRoomQnaSecret]").val(0); 
		} // 비밀글
		
		var secret = $("input[name=sRoomQnaSecret]").val(); // 비밀글 체크여부
		var sRoom_No = ${sRoomView.SROOM_NO}; // 스터디룸 번호
		
		console.log("QnA 제목 : " + title);
		console.log("QnA 내용 : " + qnaContent);
		console.log("비밀글 여부 : " +secret);
		console.log("sRoom_No : " +sRoom_No);
		
		if( (title=="") || (qnaContent=="") ) {
// 		if( (title=="") || (qnaContent="") ) {
			alert("제목과 문의내용 모두 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url: "/sRoom/qnaInsert",
			type: "post",
			data: {
				"sRoomQnATitle" : title
				, "sRoomQnAContent": qnaContent
				, "sRoomQnaSecret" : secret
				, sRoomNo : sRoom_No
			},
			success : function(r){
				console.log('[QnA 등록] AJAX 요청 성공');
				
				$("#sRoomQnATitle").val(''); // 제목 비우기
				$("#sRoomQnAContent").val(''); // 내용 비우기
				$(".modal-custom").css("display", "none"); // 모달창 닫기
				$("#sRoomQnaArea").html(r);
				
			} 
		})
	}) // QNA
	
	// 리뷰쓰기
	$("#sRooomReviewBtn").on("click", function() {
		var score = $(":input:radio[name='reviewStar']:checked").val();
		var reviewcontent = $("#sRoomReviewContent").val();		
		var roomno = ${sRoomView.SROOM_NO};
		
		console.log(score);
		console.log(typeof score);
		console.log(reviewcontent);
		console.log(roomno);
		
		if( (score == "") || (reviewcontent == "") ) {
			alert("별점과 리뷰내용을 작성해주세요.")
			return false;
		}
		
		$.ajax({ // 리뷰 갯수로 사전검증
			url: "/sRoom/ReviewCount",
			type: "POST",
			data: { sRoomNo : roomno },
			success: function(cnt) {
				console.log("검증결과 : " + cnt);
				if ( cnt == 0) { // 카운트가 0이면 리뷰등록 실행
					$.ajax({
						url: "/sRoom/reviewInsert",
						type: "POST",
						data: { "sRoomReviewScore" : score, "sRoomReviewContent" : reviewcontent, sRoomNo : roomno },
						success : function(res){
							console.log('[리뷰 등록] AJAX 요청 성공');
							$(":input:radio[name='reviewStar']").prop("checked", false);
							$("#sRoomReviewContent").val('');		
							$(".modal-custom").css("display", "none");
							$("#sRoomRevArea").html(res);
						} 
					}) // ajax
				} else { // 카운트가 1 이상이면 false
					alert("이미 리뷰를 작성하셨습니다.");
					$(":input:radio[name='reviewStar']").prop("checked", false);
					$("#sRoomReviewContent").val('');		
					$(".modal-custom").css("display", "none");
					return false;
				} //if & else
					
			} // 사전검증 success
		}) // 사전검증 ajax
		
	}) // 리뷰쓰기 end
	
	//인원선택
	var priceArea = ${sRoomView.SROOM_PRICE}
	$(".plus").on("click", function() {
		/* var count = $(this).parent('input[type=number]').val(); */
		var count = parseInt($(".quantity").val());
		console.log( typeof count);
		count = count + 1;
		$(".quantity").val(count);
		console.log($(".quantity").val());
		
		var duration = $("#timeDuration").val();
			if(duration != "") {
			// 이용시간 * 인원수 * 가격 계산
			var timeNum = parseInt(duration.slice(1,2));
			$(".price-input-box").val(priceArea * count * timeNum);
		} else {
			$(".price-input-box").val(priceArea * count * 1);
		}
	})
	
 	$(".down").on("click", function() {
		var count = parseInt($(".quantity").val());
		console.log( typeof count);
		var minPeople = ${sRoomView.SROOM_PEOPLE};
		var duration = $("#timeDuration").val();
		var timeNum = parseInt(duration.slice(1,2));
		count = count - 1;
		if(count < minPeople) {
			alert("최소인원 이하는 선택하실 수 없습니다.")
			if( duration == "") {
				$(".price-input-box").val(priceArea * minPeople);
				$(".quantity").val(minPeople);
				return false;
			} else {
				$(".price-input-box").val(priceArea * minPeople * timeNum);
				$(".quantity").val(minPeople);
				return false;
			}
		}
		$(".quantity").val(count);
		console.log($(".quantity").val());
		$(".price-input-box").val(priceArea * count);
		
		if(duration != "") {
			// 이용시간 * 인원수 * 가격 계산
			$(".price-input-box").val(priceArea * count * timeNum);
		} else {
			$(".price-input-box").val(priceArea * count * 1);
		}
	
	}) 
	
	$(".detail-reserve-button").on("click", function() {
		var stime = $("#reserveStime").val();
		var etime = $("#reserveEtime").val();
		var rdate = $("#clickedDate").val();
		
		if( (stime=="") || (etime=="") || (rdate=="") ) {
			alert("날짜/시간을 모두 선택해주세요.");
			return false;
		}
		
	})
	
	
	
}) // jQuery end

function revInsert() {
	var score = $(":input:radio[name='reviewStar']:checked").val();
	var reviewcontent = $("#sRoomReviewContent").val();		
	var roomno = ${sRoomView.SROOM_NO};
	console.log(score);
	console.log(typeof score);
	console.log(reviewcontent);
	console.log(roomno);
	
	$.ajax({ // 리뷰 갯수로 사전검증
		url: "/sRoom/ReviewCount",
		type: "POST",
		data: { sRoomNo : roomno },
		success: function(cnt) {
			console.log("검증결과 : " + cnt);
			if ( cnt == 0) { // 카운트가 0이면 리뷰등록 실행
				$.ajax({
					url: "/sRoom/reviewInsert",
					type: "POST",
					data: { "sRoomReviewScore" : score, "sRoomReviewContent" : reviewcontent, sRoomNo : roomno },
					success : function(res){
						console.log('[리뷰 등록] AJAX 요청 성공');
						$(":input:radio[name='reviewStar']").prop("checked", false);
						$("#sRoomReviewContent").val('');		
						$(".modal-custom").css("display", "none");
						$("#sRoomRevArea").html(res);
					} 
				}) // ajax
			} else { // 카운트가 1 이상이면 false
				alert("이미 리뷰를 작성하셨습니다.");
				$(":input:radio[name='reviewStar']").prop("checked", false);
				$("#sRoomReviewContent").val('');		
				$(".modal-custom").css("display", "none");
				return false;
			} //if & else
				
		} // 사전검증 success
	}) // 사전검증 ajax
}

</script>
</head>


<body>
	<div class="content">
		<div class="detail-wrap">
			<div class="left">
				<h2>💠 ${sRoomView.SROOM_NAME}</h2>
				<h5 style="margin-top: 25px; font-weight: bold; color: #3f92b7;">🔵
					${sRoomView.SROOM_INTRO}</h5>
				<img src="/upload/${sRoomView.FILEUPLOAD_STOR }" class="img-fluid"
					alt="...">
				<div id="sRoom-menu-wrap">
					<ul class="sRoom-menu-ul">
						<li><a href="#sec1" id="move">공간소개</a></li>
						<li><a href="#sec2" id="move">이용&환불규정</a></li>
						<li><a href="#sec3" id="move">오시는길</a></li>
						<li><a href="#sec4" id="move">QnA</a></li>
						<li><a href="#sec5" id="move">리뷰</a></li>
					</ul>
				</div>

				<div class="sec-1 scroll" id="sec1">
					<h3>💠 스터디룸 소개</h3>
					<div class="infoBox">${sRoomView.SROOM_INFO }</div>
				</div>

				<div class="sec-2 scroll" id="sec2">
					<h3>❕ 이용&환불규정</h3>
					<div class="infoBox">${sRoomView.SROOM_ROLE }</div>
				</div>

				<div class="sec-3 scroll" id="sec3">
					<div class="qna">
						<h3 class="qna_h3">🚖 오시는길</h3>
					</div>
					<div class="infoBox">
						<div id="map"
							style="width: 100%; height: 400px; margin-top: 30px;"></div>
						<div class="mapInfoDiv">
							<h4>${sRoomView.SROOM_NAME}</h4>
							<p class="s-addr" id="s-addr">${sRoomView.SROOM_ADDR}</p>
							<button class="map-btn" id="map-btn">길찾기</button>
						</div>
					</div>
				</div>

				<div class="sec-4 scroll" id="sec4">
					<!-- Trigger/Open The Modal -->
					<div class="qna">
						<h3 class="qna_h3">❔ QnA</h3>
						<c:choose>
							<c:when test="${not empty login}">
								<button class="modal-custom-button" id="qna_write_btn" href="#myModal1">QnA 작성</button>
							</c:when>
							<c:otherwise>
								<div class="modal-custom-button" style="background-color: #aacde5; font-weight: bold;">
									로그인 후에 QnA를 작성하실 수 있습니다.
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<!------------------- QnA 작성 모달창  -------------------------->
					<div id="myModal1" class="modal-custom">

						<!-- Modal content -->
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel" style="margin: 0 auto; font-weight: bold;">QnA 작성하기 ✍</h1>
							</div>
							<hr>

							<div class="modal-body">
								<form>
									<div class="mb-3">
										<div class="popup-text">제목</div>
										<input type="text" class="form-control" id="sRoomQnATitle">
									</div>
									<div class="mb-3">
										<div class="popup-text">문의내용</div>
										<textarea class="form-control" id="sRoomQnAContent"></textarea>
									</div>
									<div class="mb-3">
										<label class="form-check-label">비밀글 설정</label> 
										<input type="checkbox" class="form-check-input" name="sRoomQnaSecret">
									</div>
								</form>
							</div>

							<div class="modal-footer">
								<button type="button" class="close-modal" id="close">취소</button>
								<button type="button" class="button" id="qnaWriteBtn">작성하기</button>
							</div>
						</div>
					</div>


					<div id="sRoomQnaArea">
						<c:import url="/WEB-INF/views/sRoom/sRoomQnaList.jsp" />
					</div>
				</div>
				<!-- qna  -->

				<div class="sec-5 scroll" id="sec5">
					<div class="qna">
						<h3 class="qna_h3">💬 리뷰</h3>
						<c:choose>
							<c:when test="${not empty login}">
								<c:choose>
									<c:when test="${payInfo > 0}">
										<button class="modal-custom-button" href="#myModal2">리뷰쓰기</button>
									</c:when>
									<c:otherwise>
										<div class="modal-custom-button" style="background-color: #aacde5; font-weight: bold; color: #FFFF00;">
											해당 스터디룸의 예약내역이 없습니다.
										</div>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<div class="modal-custom-button" style="background-color: #aacde5; font-weight: bold;">
									로그인 후에 리뷰를 작성하실 수 있습니다.
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<!-- The Modal -->
					<div id="myModal2" class="modal-custom rev">

						<!-- Modal content -->
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel" style="margin: 0 auto; font-weight: bold;">리뷰 작성하기 ⭐</h1>
							</div>
							<hr>
							<div class="modal-body">
								<form>
									<div class="mb-3">
										<div class="mb-3" id="myform">
											<fieldset>
												<legend class="popup-text" style="text-align: center;">별점을 매겨주세요</legend>
												<input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label> 
												<input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label> 
												<input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
												<input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label> 
												<input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
											</fieldset>
										</div>
									</div>
									<div class="mb-3">
										<div class="popup-text">리뷰 남기기</div>
										<textarea class="form-control" id="sRoomReviewContent"></textarea>
									</div>
								</form>
							</div>

							<div class="modal-footer revfooter">
								<button type="button" class="close-modal" id="close">취소</button>
								<button type="button" id="sRooomReviewBtn" class="button">작성하기</button>
							</div>
						</div>
					</div>
					<!-- modal -->
					<div id="sRoomRevArea">
						<c:import url="/WEB-INF/views/sRoom/sRoomReviewList.jsp" />
					</div>
				</div>
				<!-- review -->
			</div>
			<!-- left -->


			<div class="right">
				<div class="sRoomBtn">
					<button class="detail-button" type="button" id="marks">
						<img id="mark" src="https://ifh.cc/g/tyOqod.png"> 찜하기
					</button>
					<button class="detail-button-share">🔗 공유하기</button>
					<div class="shareModal hidden">
						<div class="bg"></div>
						<div class="modalBox">
							<div class="shareSpace">
								<a class="shareIcon" id="kakaoShareBtn">
									<img src="https://ifh.cc/g/kfhxzw.png" border="0">&nbsp;&nbsp;카카오톡 공유하기
								</a>
							</div>
							<div class="shareSpace">
								<a class="shareIcon" id="twitterShareBtn">
									<img src="https://ifh.cc/g/VxDANH.png" border="0">&nbsp;&nbsp;트위터 공유하기
								</a>
							</div>
							<div class="shareSpace" style="margin: 25px 25px 5px 25px;">
								<a href="#" class="shareIcon" id="urlShareBtn" title="복사">
									<img src="https://ifh.cc/g/yWfbMz.png" border="0">&nbsp;&nbsp;URL 복사하기
								</a>
							</div>
							<div class="shareSpace-copied-msg" id="urlCopiedMsg">
								<img src="https://ifh.cc/g/rOZoRQ.png">&nbsp;URL이 복사되었습니다.
							</div>
							<button class="share-closeBtn">닫기</button>
						</div>
						<!-- box -->
					</div>
				</div>

				<div class="detail-resrve-info">
					<div class="detail-right-info">
						<h5>${sRoomView.SROOM_NAME}</h5>
						<p class="s-addr" id="s-addr">${sRoomView.SROOM_ADDR}</p>
					</div>
					<div class="detail-right-info">
						<input type="hidden" id="originalPrice" value="${sRoomView.SROOM_PRICE}"> 
						<input type="hidden" id="originalPeople" value="${sRoomView.SROOM_PEOPLE}">
						<h5>${sRoomView.SROOM_PRICE}원/시간</h5>
						<p class="s-addr" id="s-addr">최소인원 : ${sRoomView.SROOM_PEOPLE}명</p>
					</div>
					<div class="detail-right-info">
						<h5>이용날짜 📅</h5>
					</div>
					<div class="detail-right-calendar">
						<input type="text" id="sRoomSelectDate" class="sRoom-cal" placeholder="예약날짜를 선택하세요.">
					</div>

					<div class="detail-right-info">
						<div class="detail-right-time" style="margin-top: 15px;">
							<h5>이용 시간 🕙</h5>
						</div>

						<div class="detail-right-time-select">
							<input id="sTimepicker" class="time-select" type="text" placeholder="시작시간을 선택하세요." value=""> 
							<input id="eTimepicker" class="time-select" type="text" placeholder="시작시간을 선택하세요." value="">
						</div>

						<div class="detail-right-time">
							<div class="detail-right-info">
								<h5>예약정보 확인 ✔️</h5>
							</div>

							<form action="/sRoom/reserve" method="get">
								<div class="detail-clicked-info-wrap">
									<div class="detail-clicked-info-wrap">
										<input type="text" name="reserveDate" id="clickedDate" value="" class="sRoom-clicked-info" readonly>
										<!-- 날짜 -->
										<input type="text" id="clickedStartTime" value="" class="sRoom-clicked-info-time" readonly>
										<!-- 시간 -->
										<input type="text" id="timeDuration" class="sRoom-timeDuration" value="" style="width: 53px;" readonly>
										<!-- 몇시간인지 -->
									</div>
								</div>
								<div class="detail-right-time">
									<div class="detail-right-info">
										<h5>이용 인원 👨‍👧‍👧</h5>
									</div>
								</div>
								<div class="detail-right-people-select">
									<div id="menu2">
										<div class="list-member">
											<div class="number-input">
												<button class="down" type="button" id="down"></button>
												<input class="quantity" id="pNum" min="1" name="reservePeople" value="${sRoomView.SROOM_PEOPLE}" type="number">
												<button class="plus" type="button" id="plus"></button>
											</div>
										</div>
									</div>
								</div>

								<div class="detail-right-time">
									<div class="detail-right-info">
										<h4>가격</h4>
									</div>
									<input type="text" placeholder="날짜/인원을 선택해주세요." name="reservePrice" class="price-input-box" id="price-input-box" readonly>
								</div>

								<input type="hidden" id="sAddr" value="${sRoomView.SROOM_ADDR}">
								<input type="hidden" id="sName" name="sRoomName" value="${sRoomView.SROOM_NAME}"> 
								<input type="hidden" name="sRoomNo" value="${sRoomView.SROOM_NO}"> 
								<input type="hidden" name="reserveStime" id="reserveStime" value="">
								<input type="hidden" name="reserveEtime" id="reserveEtime" value="">

								<div>
									<button class="detail-reserve-button">예약하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- right -->
		</div>
		<!-- detail-wrap -->
	</div>
	<!-- content -->
</body>
</html>