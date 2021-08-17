<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update action page</title>
</head>
<body>
	<%
	String userID = null;
	User user = new User();
	if(session.getAttribute("userID")!=null);{
	user.setUserID((String)session.getAttribute("userID"));
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} 
	String userName = null;
	if (request.getParameter("userPassword") != null) {
		//userName = Integer.parseInt(request.getParameter("bbsID"));
		
		user.setUserPassword(request.getParameter("userPassword"));
	}
	
	if (!userID.equals(user.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		//script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		if(request.getParameter("userPassword") == null 
				|| request.getParameter("userPassword").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.memberDelete(user);
			
			System.out.println("delete for result int : " + result);
			if (result==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else{
				System.out.println("delete user href");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('정삭적으로 삭제되었습니다')");
				script.println("location.href = 'logoutAction.jsp'");
				script.println("</script>");
			}
		}
	}
	%>	
</body>
</html>