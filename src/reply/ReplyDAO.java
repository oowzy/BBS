package reply;
	import java.sql.Connection;
	
	import java.sql.DriverManager;
	
	import java.sql.PreparedStatement;
		
	import java.sql.ResultSet;
	
	import java.sql.SQLException;
	
	import java.util.ArrayList;

import bbs.Bbs;
import reply.Reply;



	
public class ReplyDAO {
	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;
	public ReplyDAO() {

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
	public int Repwrite(String rep_id, int rep_bno, String rep_content) {

		String SQL = "insert into reply(rep_id, rep_bno, rep_content, rep_date) values(?,?,?,(SELECT SYSDATE FROM DUAL))";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, rep_id);

			pstmt.setInt(2, rep_bno);

			pstmt.setString(3, rep_content);		

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
	
	public int getTotal() throws SQLException  {
		int count = 0;
		String sql = "select count(*) cnt from reply";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
		 count = rs.getInt("cnt");
		}
		return count;
		
		
		
		
	}
	public ArrayList<Reply> getRepList(int bno) {

		String sql = "select * from (select rownum rnum, t.* from reply t order by rep_date desc)  where rep_bno=? ";

		ArrayList<Reply> list = new ArrayList<Reply>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (bno));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Reply reply = new Reply();
				reply.setRep_id(rs.getString("rep_id"));
				reply.setRep_bno(rs.getInt("rep_bno"));
				reply.setRep_content(rs.getString("rep_content"));
				reply.setRep_date(rs.getString("rep_date"));

				list.add(reply);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
public String getReply(int bno) {
		try {String sql = "select rep_content from(select * from reply where rep_bno =? order by rep_date DESC)where ROWNUM = 1;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (bno));
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("dad:" + rs.getString("rep_content"));
				return rs.getString("rep_content");
				
//				Reply reply = new Reply();
//			
//				reply.setRep_date(rs.getString("rep_date"));
//					
//
//				return reply;
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();

		}

		return null;
		
	}
}
