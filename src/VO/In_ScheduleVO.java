package VO;

// 소이 - 면접 일정 정보 저장 VO

import java.util.Date;
import java.sql.Time;

public class In_ScheduleVO { // 면접 스케줄 테이블 IntvwSched
	private int SchID; // 면접일정 id
    private Date IntvwDate; // 면접날짜
    private Time IntvwTime; // 면접시간
    private int CoID; // 기업id
    private int Status; // 상태
    
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public int getSchID() {
		return SchID;
	}
	public void setSchID(int schID) {
		SchID = schID;
	}
	public Date getIntvwDate() {
		return IntvwDate;
	}
	public void setIntvwDate(Date intvwDate) {
		IntvwDate = intvwDate;
	}
	public Time getIntvwTime() {
		return IntvwTime;
	}
	public void setIntvwTime(Time intvwTime) {
		IntvwTime = intvwTime;
	}
	public int getCoID() {
		return CoID;
	}
	public void setCoID(int coID) {
		CoID = coID;
	}

    
	}

