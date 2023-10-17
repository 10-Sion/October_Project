package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	private static final String DB_URL = "jdbc:mysql://localhost:3306/Expo";
	private static final String DB_USER = "pid";
	private static final String DB_PASSWORD = "1234";
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LoginDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패 : " + e);
		}
	}	
	
	public String checkUesr(String email, String pwd) {
		
		String checkUser = "";
		String sql = "";
		String checkEmail = "";
		String checkPwd = "";
		String checkPwd2 = "";
		String getUserName = "";
		int checkStatus = 0;
		try {
			
			sql = "SELECT * FROM Attendee WHERE Email = ? AND Passwd = SHA2(?, 256)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				checkEmail = rs.getString("email");
				checkPwd = rs.getString("passwd");
			}
			
			sql = "SELECT * FROM Attendee WHERE Email = ? AND Passwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, checkEmail);
			pstmt.setString(2, checkPwd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				checkEmail = rs.getString("email");
				checkPwd2 = rs.getString("passwd");
				getUserName = rs.getString("atndName");
				checkStatus = rs.getInt("Status");
			}
			// 사용자 이메일이 DB 에 저장된 email 과 같으면?
			if( email.equals(checkEmail)) {
				// 비밀번호 비교
				if(checkPwd.equals(checkPwd2)) {
					// 아이디 비밀번호 모두 일치하면 가입승인 상태 체크 
					if( checkStatus == 0) {
						checkUser = "관리자에게 문의 바람";
					} else if( checkStatus == 1) {
						checkUser = getUserName;
					} else if( checkStatus == 2) {
						checkUser = "관리자에게 문의 바람";
					} else if( checkStatus == 3) {
						checkUser = "관리자에게 문의 바람";
					} else {
						checkUser = "관리자에게 문의 바람";
					}
				} else {
					checkUser = "가입된 정보와 일치하지 않습니다.";
				}
			} else {
				checkUser = "가입된 정보와 일치하지 않습니다.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkuesr 메소드 내부오류 : " + e);
		}
		
		return checkUser;
	}

	public String checkComp(String email, String pwd) {
		String checkComp = "";
		String sql = "";
		String checkEmail = "";
		String checkPwd = "";
		String checkPwd2 = "";
		String getUserName = "";
		int checkStatus = 0;
		
		try {
			
			sql = "SELECT * FROM company WHERE Email = ? AND Passwd = SHA2(?, 256)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				checkEmail = rs.getString("email");
				checkPwd = rs.getString("passwd");
			}
			
			sql = "SELECT * FROM company WHERE Email = ? AND Passwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, checkEmail);
			pstmt.setString(2, checkPwd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				checkEmail = rs.getString("email");
				checkPwd2 = rs.getString("passwd");
				getUserName = rs.getString("CoName");
				checkStatus = rs.getInt("Status");
			}
			
			// 사용자 이메일이 DB 에 저장된 email 과 같으면?
			if( email.equals(checkEmail)) {
				// 비밀번호 비교
				if(checkPwd.equals(checkPwd2)) {
					// 아이디 비밀번호 모두 일치하면 가입승인 상태 체크 
					if( checkStatus == 0) {
						checkComp = "관리자에게 문의 바람";
					} else if( checkStatus == 1) {
						checkComp = getUserName;
					} else if( checkStatus == 2) {
						checkComp = "관리자에게 문의 바람";
					} else if( checkStatus == 3) {
						checkComp = "관리자에게 문의 바람";
					} else {
						checkComp = "관리자에게 문의 바람";
					}
					
				} else {
					checkComp = "가입된 정보와 일치하지 않습니다.";
				}
			} else {
				checkComp = "가입된 정보와 일치하지 않습니다.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkuesr 메소드 내부오류 : " + e);
		}
		
		return checkComp;
	}
	
	
	// 관리자 조회 메소드
	public String checkAdmin(String email, String pwd) {
		String checkAdmin = "";
		String sql = "";
		String checkAdmID = "";
		String checkPwd = "";
		String checkPwd2 = "";
		String getAdminName = "";
		try {
			
			sql = "SELECT * FROM Admin WHERE AdmID = ? AND AdmPW = SHA2(?, 256)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				checkAdmID = rs.getString("AdmID");
				checkPwd = rs.getString("AdmPW");
			}
			
			sql = "SELECT * FROM Admin WHERE AdmID = ? AND AdmPW = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, checkAdmID);
			pstmt.setString(2, checkPwd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				checkAdmID = rs.getString("AdmID");
				checkPwd2 = rs.getString("AdmPW");
				getAdminName = rs.getString("AdmName");
			}
			// 관리자 이메일이 DB 에 저장된 AdmID 과 같으면?
			if( email.equals(checkAdmID)) {
				// 비밀번호 비교
				if(checkPwd.equals(checkPwd2)) {
					checkAdmID = getAdminName;
				} else {
					checkAdmID = "관리자가 아닙니다.";
				}
			} else {
				checkAdmID = "가입된 정보와 일치하지 않습니다.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkAdmin 메소드 내부오류 : " + e);
		}
		
		return checkAdmID;
	}

}
