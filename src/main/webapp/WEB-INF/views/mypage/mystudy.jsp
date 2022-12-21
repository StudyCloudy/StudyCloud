<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<style type="text/css">

.row {
	padding: 40px;
}

.right-bck {
	background-color: #f9f9fa;
	padding: 50px;
}

.registration-right {
	width: 80%;
	padding-top: 50px;
	padding-bottom: 50px
}

.registration-right h2 { 
	color: #323232;
	font-weight: 700;
	margin-bottom: -5%;
	margin-left: 5%;
}

.card {
	border-color: #3F92BC; 
}

.ratings i {
  color: green;
}

.install span {
  font-size: 12px;
}

.col-md-4 {
  margin-top: 27px;
}

.text-1 {
	margin-left: 20px;
}

a {
    color: #3F92B7;
	text-decoration-line: none; 
}

</style>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center right-bck">
				<div class="registration-right">
					<br><br>

					<h2>나의 멘토</h2>
					<div class="container mt-5">
						<div class="row">
								<c:forEach var="mymento" items="${mymento}" varStatus="status">
							<div class="col-md-4">
									<div class="card p-3">
										<div class="d-flex flex-row mb-3">
											<img src="https://i.imgur.com/ccMhxvC.png" width="70">
											<div class="d-flex flex-column ml-2">
												<div class="text-1">
													 <a href="/mtboard/detail?mtboardNo=${mymento._NO }"><span>${mymento.MTBOARD_TITLE }</span></a><br>
													<span class="text-black-50">분야 : ${mymento.FIELD }</span>
													<span class="ratings"><i class="fa fa-star"></i></span>
												</div>
												<i class="fa fa-star"></i><i class="fa fa-star"></i> <i
													class="fa fa-star"></i></span>
											</div>
										</div>
										<h6>${mymento.MTBOARD_CONTENT }</h6>
										<div class="d-flex justify-content-between install mt-3">
											<span class="text-primary">View&nbsp;<i
												class="fa fa-angle-right"></i></span>
										</div>
									</div>
							</div>
								</c:forEach>
<!-- 							<div class="col-md-4"> -->
<!-- 								<div class="card p-3"> -->
<!-- 									<div class="d-flex flex-row mb-3"> -->
<!-- 										<img src="https://i.imgur.com/IpKQiNu.png" width="70"> -->
<!-- 										<div class="d-flex flex-column ml-2"> -->
<!-- 											<div class="text-1"> -->
<!-- 												<span>남궁섬</span><span class="text-black-50"><br>분야 -->
<!-- 													: Java</span><span class="ratings"><i class="fa fa-star"></i> -->
<!-- 											</div> -->
<!-- 											<i class="fa fa-star"></i><i class="fa fa-star"></i> <i -->
<!-- 												class="fa fa-star"></i></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<h6> -->
<!-- 										자바의 아버지.<br>기초부터 탄탄하게 -->
<!-- 									</h6> -->
<!-- 									<div class="d-flex justify-content-between install mt-3"> -->
<!-- 										<span>Installed 1234 times</span><span class="text-primary">View&nbsp;<i -->
<!-- 											class="fa fa-angle-right"></i></span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-4"> -->
							
<!-- 								<div class="card p-3"> -->
<!-- 									<div class="d-flex flex-row mb-3"> -->
<!-- 										<img src="https://img.icons8.com/color/512/test-account.png" -->
<!-- 											width="70"> -->
<!-- 										<div class="d-flex flex-column ml-2"> -->
<!-- 											<div class="text-1"> -->
<!-- 												<span>얌너두너두</span><span class="text-black-50"><br>분야 -->
<!-- 													: 영어회화</span><span class="ratings"><i class="fa fa-star"></i> -->
<!-- 											</div> -->
<!-- 											<i class="fa fa-star"></i><i class="fa fa-star"></i><i -->
<!-- 												class="fa fa-star"></i></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<h6> -->
<!-- 										영어울렁증! <br> 같이 치료해봅시다! -->
<!-- 									</h6> -->
<!-- 									<div class="d-flex justify-content-between install mt-3"> -->
<!-- 										<span>Installed 1234 times</span><span class="text-primary">View&nbsp;<i -->
<!-- 											class="fa fa-angle-right"></i></span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
					<br><br><br>
					
					<h2>나의 스터디</h2>
					<div class="container mt-5">
						<div class="row">
						<c:forEach var="mystudy" items="${mystudy}" varStatus="status">
						
							<div class="col-md-4">
								<div class="card p-3">
									<div class="d-flex flex-row mb-3">
										<img src="https://img.icons8.com/dusk/512/conference-call.png" width="70">
										<div class="d-flex flex-column ml-2">
											<div class="text-1">
											 <a href="/sboard/detail?sboardNo=${mystudy.STUDY_NO }"><span>${mystudy.STUDY_TITLE }</span></a><br>
											 <span class="text-black-50">분야 : ${mystudy.STUDY_TAG }</span>
											 <span class="ratings"><i class="fa fa-star"></i></div>
											<i class="fa fa-star"></i><i class="fa fa-star"></i>
											<i class="fa fa-star"></i></span>
										</div>
									</div>
									<h6>${mystudy.STUDY_CONTENT}</h6>
									<div class="d-flex justify-content-between install mt-3">
										<span class="text-primary">View&nbsp;<i
											class="fa fa-angle-right"></i></span>
									</div>
								</div>
							</div>
							
							</c:forEach>
							
<!-- 							<div class="col-md-4"> -->
<!-- 								<div class="card p-3"> -->
<!-- 									<div class="d-flex flex-row mb-3"> -->
<!-- 										<img src="https://img.icons8.com/dusk/512/conference-call.png" width="70"> -->
<!-- 										<div class="d-flex flex-column ml-2"> -->
<!-- 											<div class="text-1"> -->
<!-- 											<span>영어로 재잘재잘</span><span class="text-black-50"><br>분야 : 영어 / 회화</span><span class="ratings"><i class="fa fa-star"></i></div> -->
<!-- 											<i class="fa fa-star"></i><i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<h6>편하게 영어로 대화하며 회화공부해요!</h6> -->
<!-- 									<div class="d-flex justify-content-between install mt-3"> -->
<!-- 										<span>Installed 1234 times</span><span class="text-primary">View&nbsp;<i -->
<!-- 											class="fa fa-angle-right"></i></span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div><br><br><br>	
					
<!-- 					<h2>나의 온라인스터디</h2> -->
<!-- 					<div class="container mt-5"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-4"> -->
<!-- 								<div class="card p-3"> -->
<!-- 									<div class="d-flex flex-row mb-3"> -->
<!-- 										<img src="https://img.icons8.com/color/512/google-meet.png" width="70"> -->
<!-- 										<div class="d-flex flex-column ml-2"> -->
<!-- 											<div class="text-1"> -->
<!-- 											<span>혼자 공부하면 딴짓 하는 사람들의 모임</span><span class="text-black-50"><br>분야 : 기타</span><span class="ratings"><i class="fa fa-star"></i></div> -->
<!-- 											<i class="fa fa-star"></i><i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<h6>혼자 공부하면 딴 짓만 하시는 분?<br>인증하면서 같이 공부해요~</h6> -->
<!-- 									<div class="d-flex justify-content-between install mt-3"> -->
<!-- 										<span>Installed 1234 times</span><span class="text-primary">View&nbsp;<i -->
<!-- 											class="fa fa-angle-right"></i></span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div>	 -->
				</div>
			</div>
		</div>
	</div>
	<br><br>
</body>

<%@ include file="../layout/footer.jsp"%>

</html>