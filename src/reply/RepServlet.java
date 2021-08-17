package reply;

import java.io.IOException;

import java.io.PrintWriter;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.json.simple.JSONObject;

import bbs.BbsDAO;
import user.UserDAO;

@WebServlet("/RepServlet")

public class RepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection conn;

	@SuppressWarnings("unlikely-arg-type")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		ReplyDAO replyDAO = new ReplyDAO();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = formatter.format(new java.util.Date());
		try {
			if (replyDAO.Repwrite(id, bno, content) == 1) {
					replyDAO.getRepList(bno);
					date = today;
				}
			else if(replyDAO.Repwrite(id, bno, content) != 1) { 
				out.println("s");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ajax 요청이 들어온 클라이언트 쪽으로 JSON 데이터 (login_check)를 발송
		response.setContentType("application/json");
		
		JSONObject obj = new JSONObject();
		obj.put("content", content);
		obj.put("id", id);
		obj.put("date", date);

		out.print(obj);
	}
}