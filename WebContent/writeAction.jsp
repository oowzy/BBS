<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="bbs.BbsDAO" %>
	<%@ page import="java.io.PrintWriter" %>
	<%@ page import="java.io.File" %>
	<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
	<%@ page import="com.oreilly.servlet.MultipartRequest" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
	
	<jsp:setProperty name="bbs" property="board_title"/>
	<jsp:setProperty name="bbs" property="board_content"/>
	
	
	
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 
	<title>JSP 게시판 웹 사이트</title>
	</head>
	<body>
		<%	
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 500;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding,
						new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		
		
		
		
		
		out.write("파일명 : "+ fileName + "<br/>");
		out.write("실제파일명 : "+ fileRealName + "<br/>");
		
		
			String userID = null;
			
		bbs.setFileName(fileName);
		bbs.setFileRealName(fileRealName);
		String board_title = multipartRequest.getParameter("board_title");
		String board_content = multipartRequest.getParameter("board_content");
		bbs.setBoard_title(board_title);
		bbs.setBoard_content(board_content);
		System.out.println("board_title : " + board_title);
		System.out.println("board_content : " + board_content);
			if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			}
			if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			}else{
				
				if(bbs.getBoard_title()==null || bbs.getBoard_content()==null) 
					{
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('입력이 안된 사항이 있습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						
					BbsDAO bbsDAO = new BbsDAO();
					
						
						int result = bbsDAO.write(bbs.getBoard_title(), userID, bbs.getBoard_content(), bbs.getFileName(), bbs.getFileRealName());
						if(result == -1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패하였습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}	
						else{
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href = 'bbs.jsp'");
							script.println("</script>");
						}
						
						
					
			}
			
		%>
		</body>
		</html>