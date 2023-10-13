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
			}
			
			// 사용자 이메일이 DB 에 저장된 email 과 같으면?
			if( email.equals(checkEmail)) {
				// 비밀번호 비교
				if(checkPwd.equals(checkPwd2)) {
					checkUser = "참가자 입니다.";
				} else {
					checkUser = "비밀번호 틀림.";
				}
			} else {
				checkUser = "이메일 주소 틀림.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkuesr 메소드 내부오류 : " + e);
		}
		
		return checkUser;
	}

}
