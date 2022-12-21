<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin login</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2.2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">

/* 전체 폰트 적용 */
@font-face {
    font-family: 'paybooc';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	margin: 0;
	padding: 0;
    font-family: 'paybooc';
}

body {
	background-color: #e3eff9;
}

.Login {
	margin-top: 150px;
}

.card {
	height: auto;
}
.card-signin {
  border: 0;
  border-radius: 0rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
  margin-top: 20px;
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin {
  font-size: 80%;
  border-radius: 0rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: 50px;
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-control:focus {
    box-shadow: 10px 0px 0px 0px #ffffff !important;
}

#btnLogin {
	background-color: #6cc4dc;
	border: none;
	width: 100%;
	margin-top: 20px;

}

#Logo {
	height: 50px;
	align-items: center;
	justify-content: center;
	margin-top: 20px;
}

.logoWrap {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	position: absolute;
	top: -50px;
	left: calc(50% - 50px)
}

/* 메인페이지 이동 링크 */
.mainLink {
	text-decoration: none;
	font-size: 14px;
	color: #6cc4dc;
	float: right;
	margin-top: 10px;
}

.mainLink:hover {
	color: #3f92b7;
}
	
</style>

</head>
<body>

<section class="Login">

<form action="/login/admin" method="post">
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
			<div class="logoWrap">
	            <img src="/resources/img/LoginLogo.png" id="Logo">
			</div>
          	<div class="text-center">
	          	<h5 class="card-title">Login</h5>
          	</div>
            
              <div class="form-label-group">
                <input type="text" id="memberId" class="form-control" name="memberId" required>
                <label for="memberId">ID</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="memberPw" class="form-control" name="memberPw" required>
                <label for="memberPw">Password</label>
              </div>

			<div class="d-flex justify-content-center">
              <button class="btn btn-lg btn-primary" id="btnLogin" type="submit">Sign in</button>
			</div>
			
			<div class="d-flex">
              <a href="/mainpage" class="mainLink">메인페이지로 ></a>
			</div>
			
          </div>
        </div>
      </div>
    </div>
  </div>

</form>

</section>

</body>
</html>