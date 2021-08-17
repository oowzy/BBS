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
		int pg = (total / 12) + 1;
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
	<div style="text-align: right; margin-right: 5%;">
		<a href="bbssum.jsp"><button type="button" class="btn btn-default"
				aria-label="left Align" style="height: 28px;">
				<span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
			</button></a>
	</div>

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="300px;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="60px;"><p class="glyphicon glyphicon-thumbs-up"></p></th>
													<th style="background-color: #eeeeee; text-align: center;"
							width="60px;"><p class="glyphicon glyphicon-thumbs-down"></p></th>
													<th style="background-color: #eeeeee; text-align: center;"
							width="60px;">조회수</th>

					</tr>
				</thead>
				<tbody>

					<%
					   ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr style="cursor:pointer;" onClick="location.href='view.jsp?bno=<%=list.get(i).getBno()%>&cnt_view=<%=list.get(i).getCnt_view()%>'"onMouseOver='this.style.backgroundColor="lightgray"' onMouseOut='this.style.backgroundColor=""' >
						<td><%=list.get(i).getBno()%></td>
						<td><%=list.get(i).getBoard_title()%></td>
						<td><%=list.get(i).getWrite_id()%></td>
						<td><%=list.get(i).getMake_date()%></td>
						<td><%=list.get(i).getCnt_good()%></td>
						<td><%=list.get(i).getCnt_bad()%></td>
						<td><%=list.get(i).getCnt_view()%></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>

		</div>
		<div class="div1">
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
		<div style="text-align: center;">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=pageNumber%><span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<%
				for (int i = 1; i <= pg; i++) {
			%>
						<li><a href="bbs.jsp?pageNumber=<%=i%>"><%=i%></a></li>
						<%
			
				}
			%>
					</ul></li>
			</ul>
		</div>
		<div style="width: 300px; text-align: center; margin-left: 35%">
	<form action="Findbbs.jsp">
	<div class="form-group" style=" width: 90%; float: left;">

		<input type="text" class="form-control" name="board_title" placeholder="검색하기" maxlength="20" style="height: 28px;">
	</div>
	
	
	<div style="padding-left: 5px; width:10%; float: left;" >
		<button type="submit" class="btn btn-default" aria-label="Left Align"
			style="height: 28px;">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</button>
		
	</div>
	</form>
		</div>
	</div>
	<footer>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br />

		<div style="text-align: center; font-size: 13px;">Copyright
			&copy; 3조개발팀/2021</div>

	</footer>


	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>