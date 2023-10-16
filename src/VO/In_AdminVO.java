package VO;

// 소이 - 면접 관리자 정보 저장

public class In_AdminVO { // 관리자 테이블 Admin
    private int AdmID; // 관리자 id
    private String AdmPW; // 
    private String AdmName;
    private int ExpoId;
    private String rol; // 권한
    
    
	public int getAdmID() {
		return AdmID;
	}
	public void setAdmID(int admID) {
		AdmID = admID;
	}
	public String getAdmPW() {
		return AdmPW;
	}
	public void setAdmPW(String admPW) {
		AdmPW = admPW;
	}
	public String getAdmName() {
		return AdmName;
	}
	public void setAdmName(String admName) {
		AdmName = admName;
	}
	public int getExpoId() {
		return ExpoId;
	}
	public void setExpoId(int expoId) {
		ExpoId = expoId;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}

    
}