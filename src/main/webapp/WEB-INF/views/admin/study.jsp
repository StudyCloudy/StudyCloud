<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin study apply</title>

<style type="text/css">

/* 메인 */
#btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 10px;
}

/* 메인 타이틀 */
.pagetitle h1 { 
   font-size: 24px; 
   margin-bottom: 0;
   font-weight: bold; 
   display: inline;
}

/* 스터디 찾기 페이지 이동 */
#studyLink {
	margin-top: 15px;
	padding: 15px;
	text-decoration: none;
	color: #6cc4dc;
	font-weight: bold;
}

#studyLink:hover {
	color: #3f92b7;
}


/* 테이블 */
.table {
	text-align: center;
	vertical-align: middle;
	margin-top: 20px;
}

.table thead {
    background-color: #aacde5;
}

.table thead th {
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    color: white;
}

.table tbody td {
    padding: 5px;
    margin: 0;
    font-size: 14px;
}

/* 버튼 */
.btnOk {
	width: 50px;
	background-color: #fff;
	color: #6cc4dc;
	padding: 5px;
	border: 1px solid #6cc4dc;
	border-radius: 10px;
}

.btnView {
	width: 50px;
	background-color: #6cc4dc;
	color: #fff;
	padding: 5px;
	border: 1px solid #aacde5;
	border-radius: 10px;
}

/* 모달창 */
.modal-header, .modal-body, .modal-footer {
	background-color:  #e3eff9;
}

.title {
	font-weight: bold;
	font-size: 18px;
}

#btnModal {
	background-color: #6cc4dc;
	border: none;
}

/* 페이징 */
.totalCnt {
	font-size: 14px;
}

</style>

<!-- 신청서 모달 -->
<script type="text/javascript">

const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

</script>


</head>
<body>

<main id="main" class="main">
<form action="/admin/study" method="post">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>스터디 개설 신청 관리</h1>
    	<a href="/sboard/main" id="studyLink">스터디 찾기 ></a>
    </div>

    <section class="adminStudy">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
		    <div class="table-responsive">
				<table class="table">
					<thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">아이디</th>
                            <th scope="col">닉네임</th>
                            <th scope="col">이름</th>
                            <th scope="col">회원등급</th>
                            <th scope="col">관리</th>
                            <th scope="col">신청서</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach items="${list }" var="studyboard">
                       <tr>
                           	<td>${studyboard.studyNo }</td>
							<td>${studyboard.member.memberId }</td>
							<td>${studyboard.member.memberNick }</td>
							<td>${studyboard.member.memberName }</td>
							<td>
								<c:choose>
								<c:when test="${studyboard.member.authority  eq 1}">
									일반
								</c:when>
								
								<c:when test="${studyboard.member.authority  eq 2}">
									멘토
								</c:when>
								
								<c:when test="${studyboard.member.authority  eq 3}">
									스터디장
								</c:when>
								</c:choose>
							</td>
							<td><button type="submit" class="btnOk" name="memberNo" value="${studyboard.member.memberNo }">승인</button></td>
</form>
                            <td><button type="button" class="btnView" id="btnView" data-bs-toggle="modal" data-bs-target="#applyModal${studyboard.studyNo }">신청서</button></td>
							
							<!-- 모달 -->
							<div class="modal fade" id="applyModal${studyboard.studyNo }" tabindex="-1" aria-labelledby="applyModal" aria-hidden="true">
							<div class="modal-dialog modal-dialog modal-dialog-scrollable"> <!-- 모달창 스크롤 -->
							<div class="modal-content">
							  	<div class="modal-header">
							    	<h5 class="modal-title" id="applyModal">${studyboard.member.memberNick } 님의 스터디 신청서</h5>
						  			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
							
								<!-- 모달 내용 -->
								<div class="modal-body">
							  		<p class="title">스터디 목적</p>
							  		<p>${studyboard.studyTitle }</p><hr>
							
									<p class="title">인원</p>
									<p>${studyboard.studyPeople } 명</p><hr>
									
									<p class="title">장소</p>
									<p>${studyboard.studyAddress }</p><hr>
									
									<p class="title">날짜</p>
									<p>${studyboard.studyDate }</p><hr>
									
									<p class="title">시간</p>
									<p>${studyboard.studyTime }</p><hr>
									
									<p class="title">소개글</p>
									<p>${studyboard.studyContent }</p>
						      	</div>
						      	
							    <div class="modal-footer">
							        <button type="button" class="btn btn-primary" id="btnModal" data-bs-dismiss="modal">확인</button>
						      	</div>
						    </div>
						  	</div>
							</div>
		                </tr>
                    </c:forEach>
                   	</tbody>
                </table>

				<!-- 페이징 -->
				<span class="totalCnt">total : ${paging.totalCount }</span>
				<c:import url="/WEB-INF/views/admin/studyPaging.jsp" />

   			</div><!-- 테이블 row end -->
       	</div>
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>