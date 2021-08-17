<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>MAGAZINE</title>
<script type="text/javascript">

	function checkLogin() {
		var idRegExp = /^[a-zA-z0-9]{4,12}$/;
		var regexp = /^\d{3}-\d{3,4}-\d{4}$/;
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		
		var form = document.udForm;
         if (form.userPassword.value == "") {
			alert("비밀번호를 입력해주세요");
			form.userPassword.focus();
			return false;
		}
		else if(!reg.test(form.userPassword.value)) {
			 alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
	          form.userPassword.focus();
	          return false;
	        }
		else if(!regexp.test(form.userPhone.value)) {
	          alert('휴대폰 번호의 형식은 010-1234-5678 입니다');
	          form.userPhone.focus();
	          return false;
	        }

		else if (form.userEmail.value == ""||form.userName.value == "") {
			alert("입력안된 사항이 있습니다.");
			return false;
		}
		return true;
	}
</script>
</head>
<style>
@font-face {
	font-family: 'SEBANG_Gothic_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

a {
	font-family: 'SEBANG_Gothic_Bold';
}
</style>
<body>
	<nav class="navbar navbar-default"
		style="background-color: black; border: none;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div style="padding-top: 10px">
				<a href="main.jsp"><img src="images/logo.PNG"
					style="vertical-align: center;"></a>
			</div>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="bbs.jsp" style="color: white;">갤러리</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">

				<li><a href="logoutAction.jsp" style="color: white;">로그아웃</a></li>
			</ul>
			

		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<br/><br/>
			<div style="text-align: center; padding: 10px">
				<img src="images/logo.PNG">
			</div>
			<br/>
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="memberUpdateAction.jsp"name = "udForm">
					<h3 style="text-align: center;">회원정보</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;"></div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일"
							name="userEmail" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="번호"
							name="userPhone" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="수정하기"onclick="return checkLogin()"> <br /> <br />

				</form>



			</div>
		</div>
	</div>
	<footer>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<div style="text-align: center; font-size: 13px;">Copyright
			&copy; 3조개발팀/2021</div>
	</footer>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>