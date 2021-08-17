<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>MAGAZINE</title>
<style>
.div1 {
	float: right;
}

.div2 {
	float: left;
	text-align: center;
	margin: auto;
	padding: 0px;
}

@font-face {
	font-family: 'SEBANG_Gothic_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

p {
	color: black;
	font-size: 30px;
}
</style>

</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") !=null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default"
		style="background-color: black; border: none; font-family: 'SEBANG_Gothic_Bold';">
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
				<li class="active"><a href="bbssum.jsp" style="color: white;">갤러리</a></li>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp" style="color: white;">로그인</a></li>
				<li><a href="join.jsp" style="color: white;">회원가입</a></li>

			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="memberinfo.jsp" style="color: white;">마이페이지</a></li>
				<li><a href="logoutAction.jsp" style="color: white;">로그아웃</a></li>
			</ul>

			<%
				}
			%>





		</div>
	</nav>
	<div class="container">
		<div class="row">

			<form method="post" action="writeAction.jsp"
				enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="board_title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="board_content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>


					</tbody>

				</table>
				<div class="div2">
					<input type="file" id="image" accept="images/*" onchange="setThumbnail(event);" class="btn btn-primary pull-right" value="첨부파일"
						style="margin-right: 810px" name="file">
				</div>
				<div id="image_container"></div>
				<script> function setThumbnail(event) { 
					var reader = new FileReader(); // 파일 리더 객체 사용 --> 미리보기 기능 구현
					reader.onload = function(event) { 
						var img = document.createElement("img"); 
						img.setAttribute("src", event.target.result); 
						document.querySelector("div#image_container").appendChild(img); }; 
						reader.readAsDataURL(event.target.files[0]); } 
				</script>


				<div class="div1">
					<input type="submit" class="btn btn-primary pull-right"
						value="작성하기">
				</div>
			</form>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>