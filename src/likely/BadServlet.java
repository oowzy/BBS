package likely;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bbs.BbsDAO;
import user.UserDAO;
@WebServlet("/BadServlet")


public class BadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection conn;
	
	
	@SuppressWarnings("unlikely-arg-type")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		String bno2 = request.getParameter("bno");
		System.out.println("bno2 : " + bno2);
		int bno = Integer.parseInt(bno2);
		
		LikelyDAO ld = new LikelyDAO();
		String userIP = ld.getClientIP(request);
		BbsDAO bbs = new BbsDAO();
		
		int result5 = bbs.count_bad(bno) + 1;
		
		int retNumber = -1;
		
		try {
		if(ld.like(id, bno2, userIP)==1) {
			retNumber = 1;
			if(retNumber==1) {
			bbs.bad(bno2);
			}
		
		}else {
			retNumber = 0;
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
			// ajax 요청이 들어온 클라이언트 쪽으로 JSON 데이터 (login_check)를 발송
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();

			JSONObject obj = new JSONObject();
			obj.put("like_check", retNumber);
			obj.put("new_bad_number", result5);
			out.print(obj);
	}

}
