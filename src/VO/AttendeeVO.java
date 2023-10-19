package VO;

import java.util.Date;

//	일반 참가자 VO
public class AttendeeVO {
    private int atndID;
    private String atndName;
    private String email;
    private String passwd;
    private int expoID;
    private int status;
    
    
	public int getAtndID() {
		return atndID;
		
	}
	public void setAtndID(int atndID) {
		this.atndID = atndID;
		
	}
	public String getAtndName() {
		return atndName;
		
	}
	public void setAtndName(String atndName) {
		this.atndName = atndName;
		
	}
	public String getEmail() {
		return email;
		
	}
	public void setEmail(String email) {
		this.email = email;
		
	}
	public String getPasswd() {
		return passwd;
		
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
		
	}
	public int getExpoID() {
		return expoID;
		
	}
	public void setExpoID(int expoID) {
		this.expoID = expoID;
		
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

    
}
