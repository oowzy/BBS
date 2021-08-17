package bbs;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;

	public BbsDAO() {

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

	public int write(String board_title, String userID, String board_content, String fileName, String fileRealName) {

		String SQL = "insert into board(bno, write_id, board_title, board_content, cnt_good, cnt_bad, cnt_view, from_date, filename, filerealname) values(bno.NEXTVAL,?,?,?,'0','0','0',(SELECT SYSDATE FROM DUAL),?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.setString(2, board_title);

			pstmt.setString(3, board_content);
			
			pstmt.setString(4, fileName);
			
			pstmt.setString(5, fileRealName);
			
			

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	public ArrayList<Bbs> getList(int pageNumber) {

		String sql = "select * from (select rownum rnum, t.* from board t order by bno desc)  where rnum>=? and rnum<=? ";

		ArrayList<Bbs> list = new ArrayList<Bbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNumber * 12) - 11);
			pstmt.setInt(2, (pageNumber * 12));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBno(rs.getInt("bno"));
				bbs.setBoard_title(rs.getString("Board_title"));
				bbs.setWrite_id(rs.getString("write_id"));
				bbs.setMake_date(rs.getString("From_date"));
				bbs.setCnt_view(rs.getInt("cnt_view"));
				bbs.setCnt_good(rs.getInt("cnt_good"));
				bbs.setCnt_bad(rs.getInt("cnt_bad"));

				list.add(bbs);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}
	public ArrayList<Bbs> getSumList(int pageNumber) {

		String sql = "select * from (select rownum rnum, t.* from board t order by bno desc)  where rnum>=? and rnum<=? ";

		ArrayList<Bbs> list = new ArrayList<Bbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNumber * 16) - 15);
			pstmt.setInt(2, (pageNumber * 16));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBno(rs.getInt("bno"));
				bbs.setBoard_title(rs.getString("Board_title"));
				bbs.setWrite_id(rs.getString("write_id"));
				bbs.setMake_date(rs.getString("From_date"));
				bbs.setCnt_view(rs.getInt("cnt_view"));
				bbs.setFileName(rs.getString("filename"));
				bbs.setFileRealName(rs.getString("filerealname"));
				bbs.setCnt_good(rs.getInt("cnt_good"));
				bbs.setCnt_bad(rs.getInt("cnt_bad"));

				list.add(bbs);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}
	
	
	public Bbs getBbs(int bno) {
	


		
		try {String sql = "select * from BOARD where BNO =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (bno));
			
			rs = pstmt.executeQuery();
			int cnt_view=0;
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBno(rs.getInt("bno"));
				bbs.setWrite_id(rs.getString("write_id"));
				bbs.setBoard_title(rs.getString("Board_title"));
				bbs.setBoard_content(rs.getString("Board_content"));
				bbs.setCnt_good(rs.getInt("Cnt_good"));
				bbs.setCnt_bad(rs.getInt("Cnt_bad"));
				bbs.setMake_date(rs.getString("From_date"));
				bbs.setFileRealName(rs.getString("FileRealName"));
					 cnt_view=rs.getInt("cnt_view");
					 	cnt_view++;
				
				

				return bbs;
				
			}
			String sql1 = "update board set cnt_view = ? where bno = ?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, (cnt_view));
			pstmt1.setInt(2, (bno));
		} catch (Exception e) {

			e.printStackTrace();

		}

		return null;
		
	}
	
	public Bbs getViewMax() {
		String sql = "select filerealname from board where cnt_view=(SELECT MAX(cnt_view) FROM board)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				
				bbs.setFileRealName(rs.getString("FileRealName"));
				
				

				return bbs;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return null;

	}
	
	public Bbs getGoodMax() {
		String sql = "select filerealname from board where cnt_good=(SELECT MAX(cnt_good) FROM board)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
			
				bbs.setFileRealName(rs.getString("FileRealName"));
				
				

				return bbs;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return null;

	}
	
	public Bbs getBadMax() {
		String sql = "select filerealname from board where cnt_bad=(SELECT MAX(cnt_bad) FROM board)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				
				bbs.setFileRealName(rs.getString("FileRealName"));
				
				

				return bbs;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return null;

	}
	
	public int update(int bno, String Board_title, String Board_content,  String fileName, String fileRealName) {
		String SQL = "update board set board_title=?, board_content=?, fileName=?, fileRealName=? where bno=?";
		System.out.println(Board_title);
		System.out.println(Board_content);
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, Board_title);
			pstmt.setString(2, Board_content);
			pstmt.setString(3, fileName);
			pstmt.setString(4, fileRealName);
			pstmt.setInt(5, bno );
			

			
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
		
	public int getTotal() throws SQLException  {
		int count = 0;
		String sql = "select count(*) cnt from board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
		 count = rs.getInt("cnt");
		}
		return count;
		
		
		
		
	}
	public ArrayList<Bbs> getMyList(int pageNumber, String userID) {

		String sql = "select * from (select rownum rnum, t.* from board t order by bno desc)  where rnum>=? and rnum<=? and write_id=?";

		ArrayList<Bbs> list = new ArrayList<Bbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNumber * 12) - 11);
			pstmt.setInt(2, (pageNumber * 12));
			pstmt.setString(3, userID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBno(rs.getInt("bno"));
				bbs.setBoard_title(rs.getString("Board_title"));
				bbs.setWrite_id(rs.getString("write_id"));
				bbs.setMake_date(rs.getString("From_date"));
				bbs.setCnt_good(rs.getInt("cnt_good"));
				bbs.setCnt_bad(rs.getInt("cnt_bad"));

				list.add(bbs);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}
	public ArrayList<Bbs> getMySumList(int pageNumber, String userID) {

		String sql = "select * from (select rownum rnum, t.* from board t order by bno desc)  where rnum>=? and rnum<=? and write_id=?";

		ArrayList<Bbs> list = new ArrayList<Bbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNumber * 16) - 15);
			pstmt.setInt(2, (pageNumber * 16));
			pstmt.setString(3, userID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBno(rs.getInt("bno"));
				bbs.setBoard_title(rs.getString("Board_title"));
				bbs.setWrite_id(rs.getString("write_id"));
				bbs.setMake_date(rs.getString("From_date"));
				bbs.setCnt_view(rs.getInt("cnt_view"));
				bbs.setFileName(rs.getString("filename"));
				bbs.setFileRealName(rs.getString("filerealname"));
				bbs.setCnt_good(rs.getInt("cnt_good"));
				bbs.setCnt_bad(rs.getInt("cnt_bad"));

				list.add(bbs);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}
	
	
	public ArrayList<Bbs> getFindSumList(int pageNumber, String board_title) {

		String sql = "select * from (select rownum rnum, t.* from board t order by bno desc)  where rnum>=? and rnum<=? and board_title LIKE  '%' || ? || '%'";

		ArrayList<Bbs> list = new ArrayList<Bbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNumber * 16) - 15);
			pstmt.setInt(2, (pageNumber * 16));
			pstmt.setString(3, (board_title));
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBno(rs.getInt("bno"));
				bbs.setBoard_title(rs.getString("Board_title"));
				bbs.setWrite_id(rs.getString("write_id"));
				bbs.setMake_date(rs.getString("From_date"));
				bbs.setCnt_view(rs.getInt("cnt_view"));
				bbs.setFileName(rs.getString("filename"));
				bbs.setFileRealName(rs.getString("filerealname"));
				

				list.add(bbs);

			

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}
	
	
	public ArrayList<Bbs> getFindList(int pageNumber, String board_title) {
		
		String sql = "select * from (select rownum rnum, t.* from board t order by bno desc)  where rnum>=? and rnum<=? and board_title LIKE  '%' || ? || '%'";

		ArrayList<Bbs> list = new ArrayList<Bbs>();
		 System.out.println(board_title);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNumber * 12) - 11);
			pstmt.setInt(2, (pageNumber * 12));
			pstmt.setString(3, board_title);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBno(rs.getInt("bno"));
				bbs.setBoard_title(rs.getString("Board_title"));
				bbs.setWrite_id(rs.getString("write_id"));
				bbs.setMake_date(rs.getString("From_date"));
				

				list.add(bbs);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}
	
	
	
	public int delete(int bno) {
	      String SQL = "delete from board where bno=?";
	            
	      try {

	         PreparedStatement pstmt = conn.prepareStatement(SQL);

	         pstmt.setInt(1, bno);
	         
	         return pstmt.executeUpdate();
	         
	      } catch (Exception e) {

	         e.printStackTrace();

	      }

	      return -1; // 데이터베이스 오류

	   }
	public int hitcount(int bno, int cnt_view) {
		String SQL = "update board set cnt_view=?+1 where bno=?";
		
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, cnt_view);
			pstmt.setInt(2, bno);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	public int like(String Bno) {

		PreparedStatement pstmt = null;

	        try {

			String SQL = "UPDATE BOARD SET CNT_GOOD = CNT_GOOD + 1 WHERE BNO = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, Bno);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}
	public int bad(String Bno) {

		PreparedStatement pstmt = null;

	        try {

			String SQL = "UPDATE BOARD SET CNT_BAD = CNT_BAD + 1 WHERE BNO = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, Bno);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}
	
	public int count_like(int bno) {

		PreparedStatement pstmt = null;
	        try {
			String SQL = "select cnt_good from board WHERE BNO = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				count = rs.getInt("cnt_good");
			}
			return count;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1;

	}
	
	
	
	public int count_bad(int bno) {

		PreparedStatement pstmt = null;
	        try {
			String SQL = "select cnt_bad from board WHERE BNO = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			int bad_count = 0;
			while(rs.next()) {
				bad_count = rs.getInt("cnt_bad");
			}
			return bad_count;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1;

	}

}

