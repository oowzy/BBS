package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("unlikely-arg-type")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		
		UserDAO user = new UserDAO();
		
		
		int retNumber = -1;
		try {
			System.out.println(user.idcheck(id));
		if(user.idcheck(id)==1) {
			retNumber = 1;
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
			obj.put("login_check", retNumber);
			out.print(obj);
	
	}

}
