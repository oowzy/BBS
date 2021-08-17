<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src ="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>
	<script>
	$(function(){
		$("#id_check").click(function(){
			var id2 = $("#userID").val();
			
			$.ajax({
				type : "post",
				url : "LoginServlet",
				data : {"id" : id2},		//id란 이름에 id의 값을 담음
				datatype : "json",
				success: function(data) { 
					if(data.login_check==1){
						$("#check_font").text("사용중인 아이디입니다");
					}else{
						$("#check_font").text("영문,숫자를 이용할 수 있습니다");
					}
				},
							// 성공시에는 펑션의 data를 실행한다. //로그인 성공이면 login_check에 1을 실패면 0을. 
																						//select count(*) from member where id=? pw=?
				error : function(request,status,error){alert("error!");} 		// 에러시에는 이렇게 실행
			});
		});
	});
	</script>
	<script>
	function checkLogin() {
		var idRegExp = /^[a-zA-z0-9]{4,12}$/;
		var regexp = /^\d{3}-\d{3,4}-\d{4}$/;
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		
		var form = document.joinForm;
		if(form.userID.value=="") {
			alert("아이디를 입력해주세요");
			form.userID.focus();
			return false;
		} else if (form.userPassword.value == "") {
			alert("비밀번호를 입력해주세요");
			form.userPassword.focus();
			return false;
		}
		else if(!idRegExp.test(form.userID.value)) {
	          alert('ID는 8~12 영문자 또는 숫자가 포함되어야합니다.');
	          form.userID.focus();
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
<body>
	<nav class="navbar navbar-default" style="background-color: black; border:none; font-family: 'SEBANG_Gothic_Bold';">
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
				<li><a href="bbs.jsp" style="color:white;">갤러리</a></li>
			</ul>
					
			<ul class="nav navbar-nav navbar-right">
							<li><a href="login.jsp" style="color:white;">로그인</a></li>
							<li class="active"><a href="join.jsp" style="color:white;">회원가입</a></li>
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
				<div class="jumbotron" style="padding-top: 20px;">
						<div class="form-group">
						</div>
					<form method="post" action="joinAction.jsp"name="joinForm">
						<h3 style="text-align:center;">회원가입 화면</h3>
							<input type="text" class="form-control" placeholder="아이디" id = "userID" name="userID" maxlength="20">
							<button id="id_check" type="button" class="btn btn-primary" style="margin-top: 13px; margin-bottom:13px; display: inline-block;">중복체크</button>
							&nbsp;
							<p id="check_font" style="font-size: 15px; display: inline-block;"></p>
				
						<div class="form-group">
							<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						</div>
						<div class="form-group" style="text-align: center;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary">
									<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
								</label>
							</div>
						</div>
						
						<input type="text"  name="userEmail"id="str_email01"class="form-control"placeholder="이메일"> 
						
						<br/>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="번호" name="userPhone" maxlength="20">
						</div>
						<input type="submit" class="btn btn-primary form-control" value="회원가입"onclick="return checkLogin()">
						
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
                         
                <div style = "text-align: center; font-size:13px;">
                    Copyright &copy; 3조개발팀/2021
                </div>
      
        </footer>
					<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
					<script	src="js/bootstrap.js"></script>
	</body>
	</html>