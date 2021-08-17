package likely;



public class Likely {

	String userID;

	String userBno;

	String userIP;



	public String getUserID() {

		return userID;

	}

	public void setUserID(String userID) {

		this.userID = userID;

	}

	public String getUserBno() {

		return userBno;

	}

	public void setUserBno(String userBno) {

		this.userBno = userBno;

	}

	public String getUserIP() {

		return userIP;

	}

	public void setUserIP(String userIP) {

		this.userIP = userIP;

	}

	public Likely(String userID, String userBno, String userIP) {

		super();

		this.userID = userID;

		this.userBno= userBno;

		this.userIP = userIP;

	}

}