package VO;

// 소이 - 면접 일정 정보 저장 VO

import java.util.Date;
import java.sql.Time;

public class In_ScheduleVO { // 면접 스케줄 테이블
	 private int SchID; // 면접 일정 ID (데이터베이스 컬럼: SchID)
	    private Date IntvwDate; // 면접 날짜 (데이터베이스 컬럼: IntvwDate)
	    private String IntvwTime; // 면접 시간 (데이터베이스 컬럼: IntvwTime)
	    private int CoID; // 면접을 진행하는 기업 ID (데이터베이스 컬럼: CoID)
	    private int ExpoID; // 박람회 ID (데이터베이스 컬럼: ExpoID)

	    public In_ScheduleVO() {
	        // 기본 생성자
	    }

	    // Getter 및 Setter 메서드
	    public int getSchID() {
	        return SchID;
	    }

	    public void setSchID(int SchID) {
	        this.SchID = SchID;
	    }

	    public Date getIntvwDate() {
	        return IntvwDate;
	    }

	    public void setIntvwDate(Date IntvwDate) {
	        this.IntvwDate = IntvwDate;
	    }

	    public String getIntvwTime() {
	        return IntvwTime;
	    }

	    public void setIntvwTime(String IntvwTime) {
	        this.IntvwTime = IntvwTime;
	    }

	    public int getCoID() {
	        return CoID;
	    }

	    public void setCoID(int CoID) {
	        this.CoID = CoID;
	    }

	    public int getExpoID() {
	        return ExpoID;
	    }

	    public void setExpoID(int ExpoID) {
	        this.ExpoID = ExpoID;
	    }
	}

