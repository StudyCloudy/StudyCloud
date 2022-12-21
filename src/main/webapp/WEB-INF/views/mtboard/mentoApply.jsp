<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 지원하기</title>
<c:import url="../layout/header.jsp" />  

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/mentoApply.css">   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content" style="background-color: #e3eff9; padding: 20px" >
      <div class="modal-header" style="border: none;">
        <h3 class="modal-title" id="exampleModalLabel">지원하기</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        안녕하세요.<br>
        저희 StudyCloud 멘토에 지원해주셔서 감사합니다.
        <br><br><br>
        StudyCloud 만의 특화된 매칭 시스템을 경험 해보세요! <br><br>
        1:1 매칭을 통해 다양한 지식공유와 <br>편한 시간대를 설정 해수업을 진행 할 수 있어요 <i class="fa-regular fa-face-smile"></i>
        <br><br><br><br><br><br><br>
      </div>
      <div class="modal-footer" style="background-color: #e3eff9;">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <a class="btn btn-primary" href ="/mtboard/applyMt" type="button">다음</a>
      </div>
    </div>
  </div>
</div>




<!-- content 전체 wrap -->
<main id="main">

<!-- 상단 멘토지원 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
		<p class="mentoring_txt">
			☁️ 나누고 싶은 지식을 가진 누구나 멘토가 될 수 있어요! ☁️<br>
			자신만의 노하우를 널리 알려주세요
		</p>
		
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
 		멘토 지원하기
		</button>
	</div>
</div>

<main class="all_content">


<p class="reason">지금 바로 멘토 신청해야 하는 이유</p>

<ul class="select_list">
  <li class="select_item">
  	<h1>☁️</h1>
  	<h6>Study Cloud만의 특화된 연결 플랫폼</h6>
  	<p>타 사이트와 차별화된 Study Cloud만의 멘티와의 매칭을 경험 해보세요</p>
  </li>
  <li class="select_item">
  	<h1>☁️</h1>
  	<h6>수수료 걱정없는 보장된 정산 시스템</h6>
  	<p>수수료는 저희가 부담합니다<br>걱정 말고 도전하세요</p>
  </li>
  <li class="select_item">
  	<h1>☁️</h1>
  	<h6>누구나 멘토가 될 수 있는 방법</h6>
  	<p>지식과 열정이 있다면<br>누구나 멘토가 될 수 있습니다</p>
  </li>
  <li class="select_item">
  	<h1>☁️</h1>
  	<h6>자신이 더 발전할 수 있는 기회</h6>
  	<p>쌓아온 지식을 나누며<br>자신의 더 나은 발전도 가능합니다</p>
  </li>
</ul>



<p class="reason">자주 묻는 질문</p>

<div class="fq">
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Q. 멘토링이 어떤건지 궁금해요
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        ☁️ 멘토와 멘티의 1:1 약속을 잡아 매칭 시켜주는 기능입니다
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Q. 멘토가 되려면 어떻게 해야하나요?
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
     	☁️ 로그인 후, 상단의 멘토 지원하기 버튼을 클릭해 해당 양식에 맞게 작성하여 제출하면 됩니다
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Q. 멘티와 어떻게 매칭 되는지 궁금해요
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      ☁️ 멘토가 된 후, 글작성을 하고 자신이 필요한 지식 공유글을 본 멘티가 신청서를 제출하면 멘토가 승낙 후, 매칭이 성사됩니다
      </div>
    </div>
  </div>
</div>
</div>















</main> <!-- all_content 끝 -->



</main>
<c:import url="../layout/footer.jsp" />  
</body>
</html>