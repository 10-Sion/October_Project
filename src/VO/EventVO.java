package VO;

import java.sql.Date;

public class EventVO {
	private int Eve_no; 
	private String Eve_Name;
	private String Eve_manager;
	private Date Eve_Sch ;
    private String Eve_Cate;
    private int Expoid;
	public int getEve_no() {
		return Eve_no;
	}
	public void setEve_no(int eve_no) {
		Eve_no = eve_no;
	}
	public String getEve_Name() {
		return Eve_Name;
	}
	public void setEve_Name(String eve_Name) {
		Eve_Name = eve_Name;
	}
	public String getEve_manager() {
		return Eve_manager;
	}
	public void setEve_manager(String eve_manager) {
		Eve_manager = eve_manager;
	}
	public Date getEve_Sch() {
		return Eve_Sch;
	}
	public void setEve_Sch(Date eve_Sch) {
		Eve_Sch = eve_Sch;
	}
	public String getEve_Cate() {
		return Eve_Cate;
	}
	public void setEve_Cate(String eve_Cate) {
		Eve_Cate = eve_Cate;
	}
	public int getExpoid() {
		return Expoid;
	}
	public void setExpoid(int expoid) {
		Expoid = expoid;
	}
    
    
}
