<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>MAGAZINE</title>
<style>

.div1{
	float:right;
}

.div2{
	float:left;
	text-align: center;
	margin:auto;
	padding : 0px;
	}
@font-face {
	font-family: 'SEBANG_Gothic_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") !=null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bno=0;
		if(request.getParameter("bno")!=null){
			bno=Integer.parseInt(request.getParameter("bno"));
		}
		if(bno==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bno);
		if(!userID.equals(bbs.getWrite_id())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없음')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
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
				<li class="active"><a href="bbs.jsp" style="color: white;">갤러리</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="memberinfo.jsp" style="color: white;">마이페이지</a></li>
				<li><a href="logoutAction.jsp" style="color: white;">로그아웃</a></li>
			</ul>
			
					
				</div>
			</nav> 
				<div class="container">
					<div class="row">
					
						<form method="post" action="updateAction.jsp?bno=<%= bno%>" enctype="multipart/form-data">
						<table class="table table-striped" style = "text-align:center; border:1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2" style="background-color : #eeeeee; text-align: center;">게시판 수정 양식</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" placeholder="글 제목" name="Board_title" maxlength="50" value="<%=bbs.getBoard_title() %>"></td>
									</tr>
									<tr>
									<td><textarea class="form-control" placeholder="글 내용" name="Board_content" maxlength="2048" style="height: 350px;" ><%=bbs.getBoard_content() %></textarea></td>
									</tr>
									
									
							</tbody>
							
						</table>
						<div class="div2">
						<input type="file" name ="file" class="btn btn-primary pull-right" value="첨부파일" style="margin-right:810px">
						</div>
						<div class="div1">
						<input type="submit" class="btn btn-primary pull-right" value="작성하기">
						</div>


	</form>
     
					</div>
				</div>	
				
				
				<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
				<script	src="js/bootstrap.js"></script>
	</body>
	</html>