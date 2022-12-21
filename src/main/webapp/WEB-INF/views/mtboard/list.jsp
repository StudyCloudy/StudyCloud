<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토찾기</title>
<c:import url="../layout/header.jsp" /> 

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/mntBoardList.css?ver=3"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<script type="text/javascript">
	var sort = "mtboard_no";
	var page = 1;

	var keyword;
	var type;
	var field;

	// 기본값으로 리스트 불러오기(최신순으로 1페이지 리스트)
	getList()

	
	function pageMove(page_no) {
		// 전역변수에 인자 값을 할당
		page = page_no
		
		// 페이지에 맞는 리스트 불러오기 
		getList()
	}

	function pageSort(e){
		// 전역변수에 인자 값을 할당
		sort = e
		
		// 소팅된 리스트 불러오기
		getList()
	}
	
	
	function pageField(e){
		// 전역변수에 인자 값을 할당
		field = e.target.value
		
		// 분야별 리스트 불러오기
		getList()
	}

	function search(e){
		var searchTypeSel = $('#searchTypeSel').val();
		var kword = $('#keyword').val();
		type = searchTypeSel
		keyword = kword
		
		var isExistType = (type !== undefined && type.length > 0)
		var isExistKeyword = (keyword !== undefined && keyword.length > 0)
		
		console.log(isExistKeyword)
		console.log(isExistType)
		
		// 검색 결과 리스트 불러오기
		if(isExistType && isExistKeyword){
			getList()
		}else if (!isExistType){
			alert("검색 조건을 선택하세요!");
		}else if(!isExistKeyword) {
			alert("검색어를 입력하세요!");
		}
		
	}

	function getList(){
		var param = {
				curPage : page,
				sort : sort,
				field: field,
				keyword: keyword,
				type: type
		}
		console.log(param)
		$.ajax({
			type: "Get"
		   , url: "/mtboard/listPaging"
		   , data: param
		   , dataType: "html"
		   , success: function( p ) {
			   $("#listPaging").html(p)
		   }
			
		})
	}
	
	function setSearchTypeSelect(){
		var $searchTypeSel = $('#searchTypeSel');
		var $keyword = $('#keyword');
		
		//검색 버튼이 눌리면
		$('#searchBtn').on('click',function(){
			var searchTypeVal = $searchTypeSel.val();
			var keywordVal = $keyword.val();
			
			if(!searchTypeVal){
				alert("검색 조건을 선택하세요!");
				return;
			}else if(!keywordVal){
				alert("검색어를 입력하세요!");
				return;
			}
			
		})
	}
	
 
  	$('.field_reset').click(function(){
 		page = undefiend;
		sort  = undefiend;
		field = undefiend;
		keyword = undefiend;
		type = undefiend;
		getList()
 	}) 
 	
 	
 $(document).ready(function() {	
	 $("#mtApplyBtn").click(function() {
			console.log("클릭됨");
		var authority = ${authority}	
			
		if(authority == 2){
			alert('이미 등록된 멘토입니다.')
				} else{
					location.href="/mtboard/mentoApply"
				}
			})
	});
</script>



<!-- content 전체 wrap -->
<main id="main">

<!-- 상단 멘토지원 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
	
			<strong class="mentoring_txt">
				📚 당신의 지식을 함께 공유해 볼 수 있어요! 📚
			</strong><br><br>
		<a class="btn btn-primary" type="button" id="mtApplyBtn">멘토 지원하기</a>
	</div>
</div>

<main class="all_content">
<strong style=" margin-left: 211px; font-size: 20px; color: #aacde5;" >🔍 멘토찾기</strong>
<div class="content-container">


	<!-- 왼쪽 정렬 항목-->
	<div class="left_sort">
  
    <div class="field">
    <table class="field_tb">   
    <tr>
    <th style="background-color: #aacde5;" ><i class="fa-solid fa-caret-down"></i> 분야 별 보기 <i class="fa-solid fa-caret-down"></i></th>
    </tr>
     
   <tr> 
  	<td>
  	<input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" value="개발 · 프로그래밍"  onclick="pageField(event)">
	<label class="btn btn-secondary" for="option1" >개발 · 프로그래밍</label>
	</td>
	</tr>
	
    <tr> 
  	<td>
  	<input type="radio" class="btn-check" name="options" id="option2" autocomplete="off" value="어학 · 외국어"  onclick="pageField(event)">
	<label class="btn btn-secondary" for="option2" >어학 · 외국어</label>
	</td>
	</tr>
	
	<tr>
	<td>
	<input type="radio" class="btn-check" name="options" id="option3" autocomplete="off" value="직무 · 마케팅" onclick="pageField(event)">
	<label class="btn btn-secondary" for="option3">직무 · 마케팅</label>
	</td>
	</tr>
	
	<tr>
	<td>
	<input type="radio" class="btn-check" name="options" id="option4" autocomplete="off" value="커리어" onclick="pageField(event)">
	<label class="btn btn-secondary" for="option4">커리어</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="radio" class="btn-check" name="options" id="option5" autocomplete="off" value="기타" onclick="pageField(event)">
	<label class="btn btn-secondary" for="option5">기타</label>
	</td>
	</tr>
	
	</table>
	</div>
	
	
	<a href="/mtboard/list" class="field_reset">
	<i class="fa-solid fa-arrow-rotate-right"></i>
	초기화 
	</a>
	</div> <!-- 왼쪽정렬 항목 끝 -->
	
	


<div class="right_sort">
<div class="container_rdo">

<div class="radio_bt">	
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked  onclick="pageSort('mtboard_no')">
  <label class="form-check-label" for="flexRadioDefault1">최신순</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" onclick="pageSort('mtboard_cmcnt')">
  <label class="form-check-label" for="flexRadioDefault2">후기 많은 순</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" onclick="pageSort('mark_cnt')" >
  <label class="form-check-label" for="flexRadioDefault2">찜하기순</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4" onclick="pageSort('mtboard_hit')" >
  <label class="form-check-label" for="flexRadioDefault2">조회수순</label>
</div>
</div>

  

<div id="listPaging">
<c:import url="/WEB-INF/views/mtboard/listPaging.jsp?ver=3" />
</div>

</div><!-- .글목록container -->
</div> <!-- right -->

	<!-- <!-- 검색바 -->
  <div class="searchContainer">
    <form class="search" role="search">
	<select class="form-select" id="searchTypeSel" name="searchType" >
		<option value="">검색조건</option>
		<option value="mtboard_title">제목</option>
		<option value="mtboard_content">내용</option>
		<option value="member_nick">작성자</option>
		<option value="tc">제목+내용</option>
	</select>
      <input class="form-control me-2"  type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" aria-label="Search"
      onfocus="this.placeholder=''" onblur="this.placeholder='검색어를 입력하세요'">
      <button type="button" class="btn searchBtn" onclick="search(this)">☁️</button>
    </form>
</div> <!-- container --> 


</div>
</main>
</main>
<c:import url="../layout/footer.jsp" />  
</body>
</html>