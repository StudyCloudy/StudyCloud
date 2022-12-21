<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>

<!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/b9a24d1314.js" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>admin QnA List</title>

<style type="text/css">

/* 폰트어썸 */
.fa,.fab,.fad,.fal,.far,.fas{
	font-weight: 900 !important;
}

/* 메인 타이틀 */
.pagetitle h1 { 
   font-size: 24px; 
   margin-bottom: 0;
   font-weight: bold; 
}
 
/* 테이블 */
.table {
	vertical-align: middle;
	margin-top: 20px;
}

.table thead {
    background-color: #aacde5;
}

.table thead th {
	text-align: center;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    color: white;
}

.table tbody td {
    padding: 10px;
    margin: 0;
    font-size: 14px;
}

a {
	text-decoration: none;
	color: #212529;
}

/* 폰트어썸 reply 아이콘 */
.fa-reply {
	color: #6cc4dc;
}

/* 페이징 */
.totalCnt {
	font-size: 14px;
}

</style>

</head>
<body>

<main id="main" class="main">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>QnA 관리</h1>
    </div>

    <section class="adminQna">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
		    <div class="table-responsive">
				<table class="table">
					<thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">스터디룸 명</th>
                            <th scope="col">제목</th>
                            <th scope="col">아이디</th>
                            <th scope="col">닉네임</th>
                            <th scope="col">등록일</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach items="${qna }" var="qna">
                   	<c:choose>
                       <c:when test="${qna.SROOMQNA_STEP eq 0 }"> <!-- 문의글일 경우 -->
                       <tr>
                           	<td class="text-center">${qna.SROOMQNA_NO }</td>
                           	<td><a href="/sRoom/detail?sRoomNo=${qna.SROOM_NO }">${qna.SROOM_NAME }</a></td>
							<td><a href="/admin/qna/view?sRoomQnaNo=${qna.SROOMQNA_NO }&sRoomNo=${qna.SROOM_NO }">${qna.SROOMQNA_TITLE }</a></td>
							<td class="text-center">${qna.MEMBER_ID }</td>
							<td class="text-center">${qna.MEMBER_NICK }</td>
							<td class="text-center"><fmt:formatDate value="${qna.SROOMQNA_DATE }" pattern="yy-MM-dd" /></td>
		               </tr>
		               </c:when>
                       <c:when test="${qna.SROOMQNA_STEP ne 0 }"> <!-- 답변글일 경우 -->
                       <tr>
                           	<td class="text-center">${qna.SROOMQNA_NO }</td>
                           	<td><a href="/sRoom/detail?sRoomNo=${qna.SROOM_NO }">${qna.SROOM_NAME }</a></td>
							<td><a href="/admin/qna/view?sRoomQnaNo=${qna.SROOMQNA_NO }&sRoomNo=${qna.SROOM_NO }">
									<i class="fa-solid fa-reply fa-rotate-180"></i>RE : ${qna.SROOMQNA_TITLE }</a></td>
							<td class="text-center">${qna.MEMBER_ID }</td>
							<td class="text-center">${qna.MEMBER_NICK }</td>
							<td class="text-center"><fmt:formatDate value="${qna.SROOMQNA_DATE }" pattern="yy-MM-dd" /></td>
		               </tr>
		               </c:when>
                   	</c:choose>
                    </c:forEach>
                   	</tbody>
                </table>

				<!-- 페이징 -->
				<span class="totalCnt">total : ${paging.totalCount }</span>
	      		<c:import url="/WEB-INF/views/admin/qnaPaging.jsp" />

   			</div><!-- 테이블 row end -->
       	</div>
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>