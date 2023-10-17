package VO;

// 소이 - 면접 신청 정보 저장 VO

public class In_ApplicantVO { // 면접 신청자 정보 테이블 IntvwApplicant
	private int appID; // 신청 ID
    private int atndID; // 참가자 ID
    private int schID; // 면접 일정 ID
    private int status; // 가입 상태 (0-가입대기/1-완료/2-수정대기/3-삭제대기)
    
	public int getAppID() {
		return appID;
	}
	public void setAppID(int appID) {
		this.appID = appID;
	}
	public int getAtndID() {
		return atndID;
	}
	public void setAtndID(int atndID) {
		this.atndID = atndID;
	}
	public int getSchID() {
		return schID;
	}
	public void setSchID(int schID) {
		this.schID = schID;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
    
	

    
}