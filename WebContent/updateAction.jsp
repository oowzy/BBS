<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
	<%@ page import="java.io.PrintWriter" %>
	<%@ page import="java.io.File" %>
	<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
	<%@ page import="com.oreilly.servlet.MultipartRequest" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	
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
		String board_title = multipartRequest.getParameter("Board_title");
		String board_content = multipartRequest.getParameter("Board_content");
		
		out.write("파일명 : "+ fileName + "<br/>");
		out.write("실제파일명 : "+ fileRealName + "<br/>");

		System.out.println("board_title : " + board_title);
		System.out.println("board_content : " + board_content);
		
		
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
		System.out.println(bno);
		System.out.println(userID);
		if(bno==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		
		Bbs bbs = new BbsDAO().getBbs(bno);
		bbs.setFileName(fileName);
		bbs.setFileRealName(fileRealName);
		bbs.setBoard_title(board_title);
		bbs.setBoard_content(board_content);
		if(!userID.equals(bbs.getWrite_id())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없음')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
	
			else{
				if(bbs.getBoard_title()==null || bbs.getBoard_content()==null || bbs.getFileName()==null || bbs.getFileRealName()==null
						|| bbs.getBoard_title().equals("") || bbs.getBoard_content().equals("") || bbs.getFileName().equals("") || bbs.getFileRealName().equals("")) 
					{
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('입력이 안된 사항이 있습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						BbsDAO bbsDAO = new BbsDAO();
						int result = bbsDAO.update(Integer.parseInt(request.getParameter("bno")), bbs.getBoard_title(), bbs.getBoard_content(), bbs.getFileName(), bbs.getFileRealName());
						if(result == -1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글수정에 실패하였습니다.')");
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