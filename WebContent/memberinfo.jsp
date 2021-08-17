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
			<br/> <br/>
			<div style="text-align: center; padding: 10px">
				<img src="images/logo.PNG">
			</div>
			<br/>
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">마이페이지</h3>
					<br />
					<div class="form-group">

						<button type="button" onclick="location.href='mybbssum.jsp' "
							class="btn btn-primary form-control">작성글보기</button>
						<br /> <br />
						<button type="button" onclick="location.href='memberud.jsp' "
							class="btn btn-primary form-control">회원정보수정</button>
						<br /> <br />
						<button type="button" onclick="location.href='memberdelete.jsp' "
							class="btn btn-primary form-control">탈퇴하기</button>
					</div>

				</form>



			</div>
		</div>
	</div>
	<footer>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br />

		<div style="text-align: center; font-size: 13px;">Copyright
			&copy; 3조개발팀/2021</div>

	</footer>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>