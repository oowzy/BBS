<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Scanner"%>

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
	float: middle;
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

.asd {
	transition: all 0.4s linear;
}

.asd:hover {
	transform: scale(1.27);
}
</style>


</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
			int pageNumber = 1;
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
		BbsDAO dao = new BbsDAO();
		int page1 = 1;
		int total = dao.getTotal() - 1;
		int pg = (total / 16) + 1;
		BbsDAO bbsDAO = new BbsDAO();
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

	<div style="text-align: right; margin-right: 6%;">
		<a href="bbs.jsp"><button type="button" class="btn btn-default"
				aria-label="left Align" style="height: 28px;">
				<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
			</button></a>
	</div>	



	<div style="text-align: center;">
		<div class="container">
			<%
					   ArrayList<Bbs> list = bbsDAO.getSumList(pageNumber);
					
						for (int i = 0; i < list.size(); i++) {
					%>
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail" style="float: left;">
					<a
						href="view.jsp?bno=<%=list.get(i).getBno()%>&cnt_view=<%=list.get(i).getCnt_view()%>">
						<img src="upload\<%=list.get(i).getFileRealName()%>"
						style="height: 300px; width: 250px;" class="asd">
					</a>
					<div class="caption">
						<h5>
							<a
								href="view.jsp?bno=<%=list.get(i).getBno()%>&cnt_view=<%=list.get(i).getCnt_view()%>">
								<b><%=list.get(i).getBoard_title()%></b>
							</a>
						</h5>
						<p>
							<b><%=list.get(i).getWrite_id()%></b>
						</p>
						<p><%=list.get(i).getMake_date()%>&nbsp;&nbsp;&nbsp;&nbsp;<%=list.get(i).getCnt_view()%></p>
						<p class="glyphicon glyphicon-thumbs-up" aria-hidden="true">
							&nbsp;<%=list.get(i).getCnt_good() %></p>
						&nbsp;
						<p class="glyphicon glyphicon-thumbs-down" aria-hidden="true">
							&nbsp;<%=list.get(i).getCnt_bad() %></p>

					</div>
				</div>
			</div>

			<%
						}
					%>
		</div>
	</div>
	<table style="margin-left: 42%;">
		<tr>
			<td style="width: 350px; text-align: left;">
				<div style="width: 300px; text-align: center;">
					<form action="Findbbssum.jsp">
						<div class="form-group" style="width: 90%; float: left;">

							<input type="text" class="form-control" name="board_title"
								placeholder="검색하기" maxlength="20" style="height: 28px;">
						</div>


						<div style="padding-left: 5px; width: 10%; float: left;">
							<button type="submit" class="btn btn-default"
								aria-label="Left Align" style="height: 28px;">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>

						</div>
					</form>
				</div>
			</td>
			<td style="width: 20px;">

				<ul class="nav navbar-nav">
					<li class="dropdown" style="text-align: right;"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false"><%=pageNumber%><span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<%
				for (int i = 1; i <= pg; i++) {
			%>
							<li><a href="bbssum.jsp?pageNumber=<%=i%>"><%=i%></a></li>
							<%
			
				}
			%>
						</ul></li>
				</ul>
			</td>
			<td style="width: 200px; text-align: right;">
				<div class="div1" style="">
					<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
				</div>
			</td>
		</tr>
	</table>
	<footer>
		<br /> <br /> <br /> <br />
		<div style="text-align: center; font-size: 13px;">Copyright
			&copy; 3조개발팀/2021</div>

	</footer>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>