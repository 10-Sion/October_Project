package VO;

import java.sql.Date;

//	기업측 참가자 VO
public class CompanyVO {
    private int coID;
    private String coName;
    private String coDetails;
    private String coTel;
    private String coNumber;
    private String email;
    private String passwd;
    private Date startDate;
    private Date endDate;
    private int expoID;
    private int status;
    
    
	public int getCoID() {
		return coID;
		
	}
	public void setCoID(int coID) {
		this.coID = coID;
		
	}
	public String getCoName() {
		return coName;
		
	}
	public void setCoName(String coName) {
		this.coName = coName;
		
	}
	public String getCoDetails() {
		return coDetails;
		
	}
	public void setCoDetails(String coDetails) {
		this.coDetails = coDetails;
		
	}
	public String getCoTel() {
		return coTel;
		
	}
	public void setCoTel(String coTel) {
		this.coTel = coTel;
		
	}
	public String getCoNumber() {
		return coNumber;
		
	}
	public void setCoNumber(String coNumber) {
		this.coNumber = coNumber;
		
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
	public Date getStartDate() {
		return startDate;
		
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
		
	}
	public Date getEndDate() {
		return endDate;
		
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
		
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

