package user;

 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/Find_pwServlet")

public class Find_pwServlet extends HttpServlet {

   private static final long serialVersionUID = 1L;

  

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      
      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String id1 = "projects";
      String pw1 = "1234";

      Connection conn = null;
      PreparedStatement pstmt;
      ResultSet rs;
     
      try {
         Class.forName(driver);
         conn = DriverManager.getConnection(url, id1, pw1);
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }

      String id = request.getParameter("userID");
      String name = request.getParameter("name");
      String email = request.getParameter("email");
      
      User user = new User();

      
      String pw = null;
		String sql = "select pw from member where id=? and name =? and email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("pw");
				user.setUserPassword(pw);
			}
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}

		
				  
		response.setContentType("application/json");
			      PrintWriter out = response.getWriter();
			      JSONObject obj = new JSONObject();
			      obj.put("pw", pw);
			      out.print(obj);
	   
		}


}