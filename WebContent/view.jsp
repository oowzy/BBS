<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="reply.ReplyDAO"%>
<%@ page import="reply.Reply"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<script src ="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>

<title>3조 사이트</title>
<style>
@font-face {
    font-family: 'SEBANG_Gothic_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.div1 {
	float: right;
}

.div2 {
	float: left;
	text-align: center;
	margin: auto;
	padding: 0px;
}
</style>
<%
	Reply reply = new Reply();
 String date = reply.getRep_date();
 
%>
<script>
$(function(){
    $("#button_reply").click(function(){
    	<%
    	String today = null;
    	%>
       var content = $("#rep_content").val();
       var id2 = '<%=(String)session.getAttribute("userID")%>';
       var bno = '<%=request.getParameter("bno") %>';
       var date = 1;
           $.ajax({
          type : "post",
          url : "RepServlet",
          data : {"id" : id2, "bno" : bno, "content" : content, "date" : date},      //id란 이름에 id의 값을 담음
          datatype : "json",
          success: function(data) {
        	 if(data.id==id2)  {
            	 alert('작성완료');
            	 var str = "<tr style=\"'\"onMouseOver='this.style.backgroundColor=\"lightgray\"' onMouseOut='this.style.backgroundColor=\"\"'><td>"+data.id+"</td><td>"+data.content+"</td>" +
 	 			"<td style=\"width: 10%;\">"+data.date+"</td></tr>";
 	 $("#amu").append(str);
             }
             else { 
            	 alert('로그인을 하세요.');
             }
        	 
        	
          },           // 성공시에는 펑션의 data를 실행한다. //로그인 성공이면 login_check에 1을 실패면 0을.                                            //select count(*) from member where id=? pw=?
          error : function(request,status,error){alert("로그인을 하세요.");}       // 에러시에는 이렇게 실행
       });
    });
 });
</script>

<script>
	$(function(){
		$("#btn_like").click(function(){
			
			var id2 = '<%=(String)session.getAttribute("userID")%>';
			var bno = '<%=request.getParameter("bno") %>';
				
			
			$.ajax({
				type : "post",
				url : "LikelyServlet",
				data : {"id" : id2, "bno" : bno},		//id란 이름에 id의 값을 담음
				datatype : "json",
				success: function(data) { 
					if(data.like_check==1) {
						$("#btn_like>span").html("&nbsp;" +data.new_like_number);
						alert('반영되었습니다.');
					}else{
						alert('이미 반영되었습니다.');
					}
				},
							// 성공시에는 펑션의 data를 실행한다. //로그인 성공이면 login_check에 1을 실패면 0을. 
																						//select count(*) from member where id=? pw=?
				error : function(request,status,error){alert("error!");} 		// 에러시에는 이렇게 실행
			});
		});
	});
	
	
	
	
	$(function(){
		$("#btn_bad").click(function(){
			var id2 = '<%=(String)session.getAttribute("userID")%>';
			var bno = '<%=request.getParameter("bno") %>';
			
			
			$.ajax({
				type : "post",
				url : "BadServlet",
				data : {"id" : id2, "bno" : bno},		//id란 이름에 id의 값을 담음
				datatype : "json",
				success: function(data) { 
					if(data.like_check==1) {
						$("#btn_bad>span").html("&nbsp;" +data.new_bad_number);
						alert('반영되었습니다.');
					}else{
						alert('이미 반영되었습니다.');
					}
				},
							// 성공시에는 펑션의 data를 실행한다. //로그인 성공이면 login_check에 1을 실패면 0을. 
																						//select count(*) from member where id=? pw=?
				error : function(request,status,error){alert("error!");} 		// 에러시에는 이렇게 실행
			});
		});
	});
	</script>
</head>
<body>
	<%
	    
		String userID = null;
		if(session.getAttribute("userID") !=null){
			userID = (String)session.getAttribute("userID");
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
		int cnt_view=Integer.parseInt(request.getParameter("cnt_view"));

		Bbs bbs = new BbsDAO().getBbs(bno);
		%>
	<script>
	
	<%
	BbsDAO bbs2 = new BbsDAO();
	
	
	ReplyDAO dao = new ReplyDAO();

	

	ReplyDAO replyDAO = new ReplyDAO();
	
	%>
			<%=bbs2.hitcount(bno, cnt_view)%>
	</script>
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
				<li><a href="memberud.jsp" style="color: white;">회원정보</a></li>
				<li><a href="logoutAction.jsp" style="color: white;">로그아웃</a></li>
			</ul>

			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판
							글보기</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=bbs.getBoard_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "</br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getWrite_id() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getMake_date() %></td>
					</tr>
					
					
					<tr>
						<td>조회수</td>
					  <td colspan="2"><%=cnt_view+1%></td>
					</tr>
					<tr>
						<td colspan="2"><img src="upload\<%=bbs.getFileRealName()%>" width="550px" height="690px"><br/>
						<%=bbs.getBoard_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "</br>") %></td>
					</tr>
					
				
						
						
				
					<tr>
						<td colspan="2">
						<button id ="btn_like" style="background-color: white; border: none;"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">&nbsp;<%=bbs.getCnt_good() %></span></button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button id ="btn_bad" style="background-color: white; border: none;"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">&nbsp;<%=bbs.getCnt_bad() %></span></button>
					</tr>
				</tbody>

			</table>
			<a href="bbs.jsp" class="btn btn-primary"
				style="float: right; margin-left: 5px;">목록</a>
			<%
							if(userID !=null && userID.equals(bbs.getWrite_id())){
							%>
			<a href="update.jsp?bno=<%= bno%>" class="btn btn-primary"
				style="float: right; margin-left: 5px;">수정</a> <a
				href="deleteAction.jsp?bno=<%= bno%>" class="btn btn-primary"
				style="float: right;">삭제</a>

			<%
							}
						%>

		</div>
			<table class="table table-striped">
	

					<%
					   ArrayList<Reply> list = replyDAO.getRepList(bno);
					
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr style="'"onMouseOver='this.style.backgroundColor="lightgray"' onMouseOut='this.style.backgroundColor=""'>
						<td><%=list.get(i).getRep_id()%></td>
						<td><%=list.get(i).getRep_content()%></td>
						<td id="da" style="width: 10%;"><%=list.get(i).getRep_date()%></td>
					</tr>
					<%
						}
					%>
				<tbody id="amu">
				
				</tbody>
				</table >
				
				<div class="row">

			<form method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">댓글쓰기
							</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea id="rep_content" class="form-control" placeholder="글 내용"
									name="rep_content" maxlength="2048" style="height: 50px;"></textarea></td>
						</tr>


					</tbody>
					
				</table>
				
				<div class="div1">
					<button type="button" class="btn btn-primary pull-right" id="button_reply">작성하기</button>
						
				</div>
			</form>
		</div>
	</div>
	<footer>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />

		<div style="text-align: center; font-size: 13px;">Copyright
			&copy; 3조개발팀/2021</div>

	</footer>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>