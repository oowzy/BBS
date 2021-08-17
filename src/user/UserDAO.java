package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;

	public UserDAO() {

		try {

			String driver = "oracle.jdbc.driver.OracleDriver"; // JDBC 클래스의 Full name

			String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 접속 URL

			String userID = "projects";

			String userPW = "1234";

			Class.forName(driver);

			conn = DriverManager.getConnection(url, userID, userPW);

			System.out.println("JDBC - 오라클 연결 성공");

		} catch (ClassNotFoundException e) {

			System.out.println("JDBC Driver 로딩 실패");

		} catch (SQLException e) {

			System.out.println("오라클 접속 실패");

		}

	}

	public int login(String ID, String PW) {

		String sql = "select pw from MEMBER where ID=?";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				if (rs.getString(1).equals(PW)) {

					return 1; // 로그인 성공

				}

				else

					return 0; // 비번 불일치

			}

			return -1; // 아이디 없음

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -2; // 데이터 베이스 오류

	}

	public int join(User user) {
		String SQL = "insert into member values (?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, user.getUserPhone());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류

	}
	
	public int update(User user) {
	      String SQL = "update member set name =?, pw=?, email=?, phone=? where id=?";
	   
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	       
	         pstmt.setString(1, user.getUserName());
	         pstmt.setString(2, user.getUserPassword());
	         pstmt.setString(3, user.getUserEmail());
	         pstmt.setString(4, user.getUserPhone());
	         pstmt.setString(5, user.getUserID());

	         return pstmt.executeUpdate();
	         
	      } catch (Exception e) {

	         e.printStackTrace();

	      }

	      return -1; // 데이터베이스 오류

	   }
	
	public int memberDelete(User user) {
		String SQL = "delete from member where pw =? and id =?";
		
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserID());
			
			
			return pstmt.executeUpdate();
	         
	      } catch (Exception e) {

	         e.printStackTrace();

	      }

	      return -1; // 데이터베이스 오류

	   }
	
	
	public int idcheck(String userID) throws SQLException  {
		
		String sql = "select count(*) count from member where id=?";
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();

		
		while(rs.next()) {
			if(rs.getInt("count")==1) {
				return 1;
			}else {
				return 0;
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
		
	}

}
