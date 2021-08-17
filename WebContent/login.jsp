<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/bootstrap.css">

<title>MAGAZINE</title>

<style>


@font-face {
    font-family: 'SEBANG_Gothic_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>

<body>

	<nav class="navbar navbar-default"style="background-color: black; font-family: 'SEBANG_Gothic_Bold'; border : none;">

		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"

				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

				aria-expanded="false">

				<span class="icon-bar"></span>

				<span class="icon-bar"></span>

				<span class="icon-bar"></span>

			</button>

			<div style="padding-top: 10px"><a href="main.jsp"><img src="images/logo.PNG" style="vertical-align: center;"></a></div>

		</div>

		<div class="collapse navbar-collapse"

			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="bbs.jsp"style="color: white">갤러리</a></li>

			</ul>

					

			<ul class="nav navbar-nav navbar-right">
							
							<li class="active"><a href="login.jsp"style="color: white">로그인</a></li>

							<li><a href="join.jsp"style="color: white">회원가입</a></li>

							</ul>

						

					

				</div>

			</nav> 

	

			<div class="container">

				<div class="col-lg-4"></div>

				<div class="col-lg-4">

 				<br/>
 				<br/>
				<div style="text-align: center; padding: 10px"><img src="images/logo.PNG"></div>
				<br/>
				<div class="jumbotron" >
					
					<form method="post" action="loginAction.jsp" style="padding: -0px">

 

						<h3 style="text-align:center;">로그인</h3>

						<div class="form-group">

							<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">

						</div>

						<div class="form-group">

							<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
<br/></div>
<br/>

						<input type="submit" class="btn btn-primary form-control" value="로그인">
						<br/>
						<br/>
						<p style="font-size: 13px; text-align: right;"><a href="findid.jsp">아이디찾기</a>&nbsp;<a style="color: black;">|</a>&nbsp;<a href="findpw.jsp">비밀번호찾기</a></p>
						<br/>
						<p style="font-size: 13px; text-align: center; ">아직 아이디가 없으신가요&nbsp;&nbsp;<a href="join.jsp">회원가입</a></p>
					</form>

					

				</div>

				</div>

			</div>
				    <footer>
                 <br/>
                   <br/>
                     <br/>
                       <br/>
                        <br/>
                         <br/>
                          <br/>
                           <br/>
                            <br/>
                             <br/>
                       
                <div style = "text-align: center; font-size:13px;">
                    Copyright &copy; 3조개발팀/2021
                </div>
      
        </footer>
		

					<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 

					<script	src="js/bootstrap.js"></script>

	</body>

	</html>