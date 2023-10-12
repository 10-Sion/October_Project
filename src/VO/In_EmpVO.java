package VO;

// 소이 - 면접 관리자 정보 저장

public class In_EmpVO { // 면접 관리자 테이블
	private int AdmID; // 관리자 ID (데이터베이스 컬럼: AdmID)
    private String AdmPW; // 관리자 비밀번호 (데이터베이스 컬럼: AdmPW)
    private String AdmName; // 관리자 이름 (데이터베이스 컬럼: AdmName)

    public In_EmpVO() {
        // 기본 생성자
    }

    // Getter 및 Setter 메서드
    public int getAdmID() {
        return AdmID;
    }

    public void setAdmID(int AdmID) {
        this.AdmID = AdmID;
    }

    public String getAdmPW() {
        return AdmPW;
    }

    public void setAdmPW(String AdmPW) {
        this.AdmPW = AdmPW;
    }

    public String getAdmName() {
        return AdmName;
    }

    public void setAdmName(String AdmName) {
        this.AdmName = AdmName;
    }
}
