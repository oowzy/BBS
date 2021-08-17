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


@WebServlet("/Find_idServlet")

public class Find_idServlet extends HttpServlet {

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

      String name = request.getParameter("name");
      String email = request.getParameter("email");
      
      User user = new User();

      String id = null;
		String sql = "select id from member where name =? and email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
				user.setUserID(id);
				System.out.println("id : " + id);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
   
		      response.setContentType("application/json");
		      PrintWriter out = response.getWriter();
		      JSONObject obj = new JSONObject();
		      obj.put("id", id);
		      out.print(obj);
   
		}


}