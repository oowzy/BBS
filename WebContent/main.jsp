<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>MAGAZINE</title>
		<style>
		.carousel-control{
		background : none !important;
		}
		
		a.carousel-control{
		opacity:100;
		color : black;
		}
		
			img { display: block; margin: 0px auto; }
			
			@font-face {
    font-family: 'SEBANG_Gothic_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
			body{
    font-family: 'SEBANG_Gothic_Bold';
			}
			
			p{
			color:black;
			font-size : 30px;
			}
			
			
		</style>
</head>
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		BbsDAO bbs = new BbsDAO();
	%>
	<nav class="navbar navbar-default" style="background-color: black; border:none;"> 
		<div class="navbar-header" > 	
			
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
			
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			<div style="padding-top: 10px"><a href="main.jsp"><img src="images/logo.PNG" style="vertical-align: center;"></a></div>
			
			
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<form action="Findbbs.jsp">
			<ul class="nav navbar-nav">
				
				<li><a href="bbssum.jsp" style="color:white;">갤러리</a></li>
				<li><div class="form-group" style="padding-top : 10px;">
							
							<input type="text" class="form-control" name="board_title" placeholder="검색하기" maxlength="20" style="height: 28px;">
							
				</div></li>
				
				<li style="padding-top : 10px; padding-left: 5px"><button type="submit" class="btn btn-default" aria-label="Left Align" style="height: 28px;" >
  							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
					</li>
					
			</ul>
			</form>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
						<li ><a href="login.jsp" style="color:white;">로그인</a></li>
						<li ><a href="join.jsp" style="color:white;">회원가입</a></li>
					</ul>
				
			<%
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
			            <li><a href="memberinfo.jsp"style="color:white;">마이페이지</a></li>
						<li><a href="logoutAction.jsp"style="color:white;">로그아웃</a></li>
					</ul>
				
			<%
				}
			%>
		</div>
	</nav>


	<div class="container" style="background-color: white">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" >
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div style="padding-top: 10px"><img src="images/logo.PNG" style="vertical-align: center;"></div>
			<br/>
			
			<div class="carousel-inner">
			
				<div class="item active" style = "text-align: center">
				    <p>조회수 1위</p>
					<img src="upload\<%=bbs.getViewMax().getFileRealName()%>" style="width:620px; height:760px;">
				</div>
				<div class="item"style = "text-align: center">
				<p>좋아요 1위</p>
					<img src="upload\<%=bbs.getGoodMax().getFileRealName()%>" style="width:620px; height:760px;">
				</div>
				<div class="item"style = "text-align: center">
				<p>싫어요 1위</p>
					<img src="upload\<%=bbs.getBadMax().getFileRealName()%>" style="width:620px; height:760px;">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev" style="background-color:white">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next" style="background-color:white">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
		    <footer>
                 <br/>
                   <br/>
                     <br/>
                       <br/>
                <div style = "text-align: center; font-size:13px;">
                    Copyright &copy; 3조개발팀/2021
                </div>
        </footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>