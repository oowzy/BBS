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

<script src ="js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
    $("#find_id").click(function(){
       var userName = $("#userName").val();
       var userEmail = $("#userEmail").val();
       
           $.ajax({
          type : "post",
          url : "Find_idServlet",
          data : {"name" : userName, "email" : userEmail},      //id란 이름에 id의 값을 담음
          datatype : "json",
          success: function(data) {
        	 if(data.id!=null)  {
            	 $("#result").text("귀하의 아이디는 " + data.id + "입니다.");
             }
             else { 
            	 $("#result").text("확인 후 다시 입력해주세요");
             }
        	 
        	
          },           // 성공시에는 펑션의 data를 실행한다. //로그인 성공이면 login_check에 1을 실패면 0을.                                            //select count(*) from member where id=? pw=?
          error : function(request,status,error){alert("error!");}       // 에러시에는 이렇게 실행
       });
    });
 });
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
				<div class="jumbotron" style="padding-top: 20px;">
						<h3 style="text-align:center;">아이디찾기</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="이름" id="userName" name="userName" maxlength="20">
						</div>
						
						
						<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일" id="userEmail" name="userEmail" maxlength="20">
						</div>
						
						
						
						<button id = "find_id" type="button" class="btn btn-primary form-control">아이디 찾기</button>
						<br/>
						<br/>
			
						<p id="result" style="font-size: 15px;"></p>
					
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