<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>MAGAZINE</title>
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
			
			<div style="text-align: center; padding: 10px">
				<img src="images/logo.PNG">
			</div>
			
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="memberDeleteAction.jsp">
					<h3 style="text-align: center;">회원탈퇴</h3>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="탈퇴하기">
				</form>



			</div>
		</div>
	</div>
	<footer>
		<br /> <br /> <br /> <br />
		<div style="text-align: center; font-size: 13px;">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br /> <br /> Copyright &copy; 3조개발팀/2021
		</div>

	</footer>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>