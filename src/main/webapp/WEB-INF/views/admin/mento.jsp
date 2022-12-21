<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Mento Apply</title>

<style type="text/css">

/* 메인 */
.btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

 /* 메인 타이틀 */
.pagetitle h1 { 
   font-size: 24px; 
   margin-bottom: 0;
   font-weight: bold; 
   display: inline;
}

/* 멘토 찾기 페이지 이동 */
#mentoLink {
	margin-top: 15px;
	padding: 15px;
	text-decoration: none;
	color: #6cc4dc;
	font-weight: bold;
}

#mentoLink:hover {
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


<script type="text/javascript">

<!-- 신청서 모달 -->
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

</script>


</head>
<body>


<main id="main" class="main">
<form action="/admin/mento" method="post">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>멘토 신청 관리</h1>
    	<a href="/mtboard/list" id="mentoLink">멘토 찾기 ></a>
    </div>

    <section class="adminMento">
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
                   	<c:forEach items="${list }" var="applymt">
                       <tr>
                           	<td>${applymt.applymtNo }</td>
							<td>${applymt.member.memberId }</td>
							<td>${applymt.member.memberNick }</td>
							<td>${applymt.member.memberName }</td>
							<td>
								<c:choose>
								<c:when test="${applymt.member.authority eq 1}">
									일반
								</c:when>
								
								<c:when test="${applymt.member.authority eq 2}">
									멘토
								</c:when>
								
								<c:when test="${applymt.member.authority eq 3}">
									스터디장
								</c:when>
								</c:choose>
							</td>
							<td><button type="submit" class="btnOk" name="memberNo" value="${applymt.member.memberNo }">승인</button></td>
</form>
                            <td><button type="button" class="btnView" id="btnView" data-bs-toggle="modal" data-bs-target="#applyModal${applymt.applymtNo }">신청서</button></td>
							
							<!-- 모달 -->
							<div class="modal fade" id="applyModal${applymt.applymtNo }" tabindex="-1" aria-labelledby="applyModal" aria-hidden="true">
							<div class="modal-dialog modal-dialog modal-dialog-scrollable"> <!-- 모달창 스크롤 -->
							<div class="modal-content">
							  	<div class="modal-header">
							    	<h5 class="modal-title" id="applyModal">${applymt.member.memberNick } 님의 멘토 신청서</h5>
						  			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
							
								<!-- 모달 내용 -->
								<div class="modal-body">
							  		<p class="title">Study Cloud 아이디</p>
							  		<p>${applymt.member.memberId }</p><hr>
							
									<p class="title">이메일</p>
									<p>${applymt.member.memberEmail}</p><hr>
									
									<p class="title">이름</p>
									<p>${applymt.member.memberName }</p><hr>
									
									<p class="title">연락처</p>
									<p>${applymt.member.memberPhone }</p><hr>
									
									<p class="title">희망분야</p>
									<p>${applymt.field }</p><hr>
									
									<p class="title">소개글</p>
									<p>${applymt.applymtContent }</p>
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
				<div class="clearfix"></div>
				<c:import url="/WEB-INF/views/admin/mentoPaging.jsp" />

   			</div><!-- 테이블 row end -->
       	</div>
		</div><!-- main row end -->
	</section>




</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>