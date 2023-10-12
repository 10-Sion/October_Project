package VO;

// 소이 - 면접 신청 정보 저장 VO

public class In_ApplicationVO { // 면접 신청자 테이블
	private int AppID; // 신청 ID (데이터베이스 컬럼: AppID)
    private int AtndID; // 참가자 ID (데이터베이스 컬럼: AtndID)
    private int SchID; // 면접 일정 ID (데이터베이스 컬럼: SchID)
    private String AppStatus; // 신청 상태 (데이터베이스 컬럼: AppStatus)

    public In_ApplicationVO() {
        // 기본 생성자
    }

    // Getter 및 Setter 메서드
    public int getAppID() {
        return AppID;
    }

    public void setAppID(int AppID) {
        this.AppID = AppID;
    }

    public int getAtndID() {
        return AtndID;
    }

    public void setAtndID(int AtndID) {
        this.AtndID = AtndID;
    }

    public int getSchID() {
        return SchID;
    }

    public void setSchID(int SchID) {
        this.SchID = SchID;
    }

    public String getAppStatus() {
        return AppStatus;
    }

    public void setAppStatus(String AppStatus) {
        this.AppStatus = AppStatus;
    }
}

