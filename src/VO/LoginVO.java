package VO;

public class LoginVO {
	
	private int AtndId;
	private String AtndName;
	private String Email;
	private String passwd;
	private int Expo;
	
	public int getAtndId() {
		return AtndId;
	}
	public void setAtndId(int atndId) {
		AtndId = atndId;
	}
	public String getAtndName() {
		return AtndName;
	}
	public void setAtndName(String atndName) {
		AtndName = atndName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getExpo() {
		return Expo;
	}
	public void setExpo(int expo) {
		Expo = expo;
	}
}
