<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<script type="text/javascript">

$(document).ready(function(e){
	$('#withdrawal').submit(function(e){
		e.preventDefault()
		
		//패스워드 입력 확인
		if($('#memberPw').val() == ''){
			alert("패스워드를 입력해 주세요.");
			$('#memberPw').focus();
			return;
		}else if($('#passwdCheck').val() == ''){
			alert("패스워드를 입력해 주세요.");
			$('#passwdCheck').focus();
			return;
		}
		
		//입력한 패스워드가 같인지 체크
		if($('#passwdCheck').val() != $('#memberPw').val()){
			alert("패스워드가 일치하지 않습니다.");
			$('#passwdCheck').focus();
			return;
		}
		
		var result = confirm('정말 탈퇴 하시겠습니까?');
		
		if(result){
			$.ajax({
				url: "${pageContext.request.contextPath}/withdrawal",
				type: "POST",
				data: {
					memberPw: $('#memberPw').val()
				},
				dataType: "text",
				success: function(data){
					if(data=="success"){
						alert("탈퇴되었습니다");
						window.location.href = '/login/logout'
					}else if (data == "disaccord"){
						alert("입력하신 비밀번호와 회원정보가 일치하지 않습니다.");
					} else {
						alert("오류가 발생하였습니다.");
					}
				},
				error: function(){
					alert("서버 에러.");
				}
			});
		}
	
	});
});


</script>

<style type="text/css">

.padding {
	padding: 10rem !important
}

body {
	background-color: #f9f9fa
}

/* card css */

.card {
	border: 0;
	border-radius: 0px;
	margin-bottom: 30px;
	width: 50%;
	-webkit-box-shadow: 0 2px 3px rgba(0, 0, 0, 0.03);
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.03);
	-webkit-transition: .5s;
	transition: .5s;
}

.card-title {
	font-family: Roboto, sans-serif;
	font-weight: 300;
	line-height: 5;
	margin-bottom: 0;
	padding: 15px 20px;
	border-bottom: 1px solid rgba(77, 82, 89, 0.07);
	margin: 0 auto;
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
	line-height: 2.5;
	text-align: center;
}

/* card 내부 */

.message {
	font-size: 10pt;
}

.fw-400 {
	font-weight: 400 !important;
}

.col-md-6 {
	flex: 0 0 auto;
	width: 150%;
	margin-left: 50%;
}


.form-pw {
	width: 350px;
	color: #323232;
	font-size: 10pt;
	font-weight: 540;
}


.form-group {
	padding: 12px;
}

.form-group-id {
	height: 72px;
}

.form-control {
	border-color: #ebebeb;
	border-radius: 2px;
	color: #8b95a5;
	padding: 1px 1px;
	font-size: 12px;
	line-height: inherit;
	-webkit-transition: 0.2s linear;
	transition: 0.2s linear;
	width: 50%;
	margin: 0 auto;
}

.card-body>*:last-child {
	margin-bottom: 0;
}

.form-control:focus {
	border-color: #6CC4DC;
	color: #4d5259;
	-webkit-box-shadow: 0 0 0 0.1rem rgba(51, 202, 187, 0.15);
	box-shadow: 0 0 0 0.1rem rgba(51, 202, 187, 0.15);
}


/* button css */

#withdrawalBtn {
	width: 50%;
	padding: 12px;
	margin-bottom: 10px;
}

#btnchk {
	width: 10%;
	padding: 6px;
	display: inline;
	margin-left: 430px;
	margin-top: -85px;
}

.btn-primary {
	background-color: #6CC4DC;
	border-color: #6CC4DC;
	color: #fff;
}

.btn-bold {
	font-family: Roboto, sans-serif;
	text-transform: uppercase;
	font-weight: 500;
	font-size: 12px;
}

.btn-primary:hover {
	background-color: #3F92B7;
	border-color: #3F92B7;
	color: #fff;
}

#btn:hover {
	cursor: pointer;
}
</style>
</head>

<body>

	<div class="page-content page-container" id="page-content">
		<div class="padding">
			<div class="row container d-flex justify-content-center">
				<div class="col-md-6 col-lg-4">
					<form class="card" action="/withdrawal" name="withdrawal" id="withdrawal" method="post"> 
						<h4 class="card-title fw-400">회원탈퇴</h4>
						<br><br><br>

						<div class="card-body">
						
						<h6>탈퇴안내</h6><br>
						<div class="message">사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
							탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 <br> 신중하게 선택하시기 바랍니다.</div><br>

							<div class="form-group">
								<input class="form-control" type="password" id="memberPw" placeholder=" 비밀번호 입력"><br>
								<input class="form-control" type="password" id="passwdCheck" placeholder=" 비밀번호 확인">
							</div>
							<br>


							<!-- 버튼 -->

							<div class=buts>
								<button class="btn btn-bold btn-primary" id="withdrawalBtn">탈퇴하기</button>
							</div><br><br>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../layout/footer.jsp"%>
</html>