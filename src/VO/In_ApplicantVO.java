package VO;

// 소이 - 면접 신청 정보 저장 VO

public class In_ApplicantVO { // 면접 신청자 정보 테이블 IntvwApplicant
    private int AppID; // 신청 id
    private int AtndID; // 참가자 id
    private int SchID; // 면접일정 id
    private String AppStatus; // 신청 상태
    
	public int getAppID() {
		return AppID;
	}
	public void setAppID(int appID) {
		AppID = appID;
	}
	public int getAtndID() {
		return AtndID;
	}
	public void setAtndID(int atndID) {
		AtndID = atndID;
	}
	public int getSchID() {
		return SchID;
	}
	public void setSchID(int schID) {
		SchID = schID;
	}
	public String getAppStatus() {
		return AppStatus;
	}
	public void setAppStatus(String appStatus) {
		AppStatus = appStatus;
	}

    
}