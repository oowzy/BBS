package likely;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;



public class LikelyDAO {

	private Connection conn;



	public LikelyDAO() {

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



	public int like(String userID, String userBno, String userIP) {

		String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.setString(2, userBno);

			pstmt.setString(3, userIP);

			

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -1; 

	}
	
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	

}