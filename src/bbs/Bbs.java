package bbs;

public class Bbs {

	private int bno;
	private String write_id;
	private String board_title;
	private String board_content;
	private int cnt_good;
	private int cnt_bad;
	private int cnt_view;
	private String make_date;
	private String fileName;
	private String fileRealName;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String make_id) {
		this.write_id = make_id;
	}
	
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getCnt_good() {
		return cnt_good;
	}
	public void setCnt_good(int cnt_good) {
		this.cnt_good = cnt_good;
	}
	public int getCnt_bad() {
		return cnt_bad;
	}
	public void setCnt_bad(int cnt_bad) {
		this.cnt_bad = cnt_bad;
	}
	public int getCnt_view() {
		return cnt_view;
	}
	public void setCnt_view(int cnt_view) {
		this.cnt_view = cnt_view;
	}
	public String getMake_date() {
		return make_date;
	}
	public void setMake_date(String make_date) {
		this.make_date = make_date;
	}
	
	

}
