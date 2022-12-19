<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mntboard/write"
	})
})


</script>


<table class="table" id="table">
<thead>
	<tr>
		<th scope="col" style="width: 7%;">No.</th>
		<th scope="col" style="width: 40%;">제목</th>
		<th scope="col" style="width: 15%;">작성자</th>
		<th scope="col" style="width: 10%;">조회수</th>
		<th scope="col" style="width: 10%;">🤍</th>
		<th scope="col" style="width: 15%;">작성일</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${mntBoardlist }" var="mntboard">
  <tr>
      <td scope="row" class="no">${mntboard.MNTBOARD_NO }</td>
      <td>
      <a id="boardno" href="/mntboard/view?mntboardNo=${mntboard.MNTBOARD_NO }">${mntboard.MNTBOARD_TITLE }</a>
      <c:if test="${mntboard.MNTBOARD_CMCNT  ne 0}">
		<small><b style="color: #ff7760;">[&nbsp;<c:out value="${mntboard.MNTBOARD_CMCNT}"/>&nbsp;]</b></small>
	 </c:if>
      </td>
      <td>${mntboard.MEMBER_NICK  }</td>
      <td>${mntboard.MNTBOARD_HIT }</td>
      <td>${mntboard.LIKE_CNT }</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mntboard.MNTBOARD_DATE }"/>
 </tr>
</c:forEach>
 
</tbody>
</table>

<c:if test="${not empty sessionScope.loginid }">
<div><button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button></div>
</c:if>

<nav aria-label="Page navigation example">
	  <ul class="pagination">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
      <a class="page-link" onclick="pageMove(1)" aria-폼전송label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item"><a class="page-link" onclick="pageMove(${paging.startPage - paging.pageCount })">{i}</a></li>
	</c:when>
	<%--  <c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>  --%>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	 <c:if test="${paging.curPage > 1 }">
		<li class="page-item"><a class="page-link" onclick="pageMove(${paging.curPage - 1 })">&lt;</a></li>
	</c:if> 
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active page-item"><a class="page-link" onclick="pageMove(${i })">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a class="page-link" onclick="pageMove(${i })">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	 <c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="pageMove(${paging.curPage + 1 })">&gt;</a></li>
	</c:if> 
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="pageMove(${paging.startPage + paging.pageCount })">&raquo;</a></li>
	</c:when>
	 <%-- <c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when> --%>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="pageMove(${paging.totalPage })" aria-label="Next">
        <span aria-hidden="true">&raquo;</span></a></li>	
	</c:if>
	
  </ul>
</nav>
