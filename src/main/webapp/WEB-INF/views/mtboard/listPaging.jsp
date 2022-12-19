<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mtboard/write"
	})
	
})
</script>


<table class="table" id="table">
<thead>
	<tr>
		<th scope="col" style="width: 7%;">No.</th>
		<th scope="col" style="width: 40%;">제목</th>
		<th scope="col" style="width: 15%;">작성자</th>
		<th scope="col" style="width: 20%;">직무</th>
		<th scope="col" style="width: 20%;">경력</th>
		<th scope="col" style="width: 10%;">조회수</th>
		<th scope="col" style="width: 10%;">🤍</th>
		<th scope="col" style="width: 15%;">작성일</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${mtBoardlist }" var="mtboard">
  <tr>
      <td scope="row" class="no">${mtboard.MTBOARD_NO }</td>
      <td>
      <a id="boardno" href="/mtboard/detail?mtboardNo=${mtboard.MTBOARD_NO }">${mtboard.MTBOARD_TITLE }</a>
      <c:if test="${mtboard.MTBOARD_CMCNT  ne 0}">
		<small><b style="color: #ff7760;">[&nbsp;<c:out value="${mtboard.MTBOARD_CMCNT}"/>&nbsp;]</b></small>
	 </c:if>
      </td>
      <td>${mtboard.MEMBER_NICK  }</td>
      <td>${mtboard.JOBDUTY  }</td>
      <td>${mtboard.CAREER  }</td>
      <td>${mtboard.MTBOARD_HIT }</td>
      <td>${mtboard.MARK_CNT }</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mtboard.MTBOARD_DATE }"/>
 </tr>
</c:forEach>
 
</tbody>
</table>

<!-- 현재 권한등급이 잘못되어있음 (수정요청함) 권한 2 -> 멘토여야됨 -->
<c:if test="${authority eq 2 }">
<div><button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button></div>
</c:if>
<nav aria-label="Page navigation example">
	  <ul class="pagination">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
      <a class="page-link" onclick="pageMove(1)" aria-label="Previous">
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
