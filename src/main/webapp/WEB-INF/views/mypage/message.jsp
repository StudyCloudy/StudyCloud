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
	padding: 70px;
}

.right-bck {
	background-color: #f9f9fa;
}

.registration-right {
	width: 80%;
	padding-top: 50px;
	padding-bottom: 50px
}

.registration-right h2 { 
	color: #232323;
	font-weight: 700;
	padding-bottom: 20px
}

.registration .btn { 
	width: 100%
}

.fa, .fas, .fab { 
	font-family: "Font Awesome 5 Free";
	font-weight: 900
}

.far {
	font-family: "Font Awesome 5 Free";
	font-weight: 400
}

.event-list .card { 
	background-color: #E3EFF9s;
	padding: 18px;
	margin-bottom: 3px
}

.event-list img {
	width: 77px;
	height: 77px
}

.event-list h4 {
	color: #c0bfc9;
	font-size: 16px
}

.event-list .card-title span { 
	padding-left: 5px;
	padding-right: 20px;
	font-size: 12px;
	font-weight: 700
}

.event-list .card-text {
	color: #232323;
	font-weight: 500;
	font-size: 16px
}

.event-list .card-body {
	padding: 0 20px;
	margin: 0 0 10px 0
}

.event-list .card-title svg {
	color: #ffffff
}

</style>

</head>
<body>

<div class="container-fluid">
    <div class="row">
			<div class="col-md-12 d-flex justify-content-center right-bck">
				<div class="registration-right">
					<br>
					<br>

					<h2>받은 쪽지함</h2>
					<div class="event-list">
						<c:forEach var="message" items="${list}" varStatus="status">

							<div class="card flex-row">
								<img class="card-img-left img-fluid"
									src="${pageContext.request.contextPath}/resources/${message.FILEUPLOAD_STOR } "
									alt="studyroom-img" class="cart-product-imitation">
								<!--                     <div class="card flex-row"><img class="card-img-left img-fluid" src="https://img.icons8.com/color/512/test-account.png" /> -->
								<div class="card-body">
									<h4 class="card-title h5 h4-sm">
										<i class="fas fa-caret-right" aria-hidden="true"></i><span>${message.SEND_DATE}</span><i
											class="fas fa-caret-right" aria-hidden="true"></i>
									</h4>
									<p class="card-text">${message.MS_CONTENT}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<br> <br>
			<div class="col-md-12 d-flex justify-content-center right-bck">
				<div class="registration-right">
					<h2>보낸 쪽지함</h2>
					<div class="event-list">
						<c:forEach var="message" items="${list}" varStatus="status">

							<div class="card flex-row">
								<img class="card-img-left img-fluid"
									src="${pageContext.request.contextPath}/resources/${message.FILEUPLOAD_STOR } "
									alt="studyroom-img" class="cart-product-imitation">
								<!--                     <div class="card flex-row"><img class="card-img-left img-fluid" src="https://img.icons8.com/color/512/test-account.png" /> -->
								<div class="card-body">
									<h4 class="card-title h5 h4-sm">
										<i class="fas fa-caret-right" aria-hidden="true"></i><span>${message.SEND_DATE}</span><i
											class="fas fa-caret-right" aria-hidden="true"></i>
									</h4>
									<p class="card-text">${message.MS_CONTENT}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
    
    
</div>

</body>

<%@ include file="../layout/footer.jsp"%>

</html>