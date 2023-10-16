package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import VO.qnaVO;
import javafx.css.PseudoClass;

public class qnaDAO  {
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/Expo";
	private static final String DB_USER = "pid";
	private static final String DB_PASSWORD = "1234";
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public qnaDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패 : " + e);
		}
	}
	
	// 전체 질문 조회 메소드
	public ArrayList selectQlist() {
		
		String sql = "";
		ArrayList qlist = new ArrayList();
		
		try {
			
			sql = "select * from faq";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				qnaVO qVo = new qnaVO();
				qVo.setFaqid(rs.getInt("FAQID"));
				qVo.setQtitle(rs.getString("Qtitle"));
				qVo.setQContent(rs.getString("QContent"));
				qVo.setAnswer(rs.getString("Answer"));
				qVo.setQdata(rs.getString("PostDate"));
				qVo.setPoster(rs.getString("Poster"));		
				qlist.add(qVo);
			}
			
		} catch (Exception e) {
			System.out.println("selectQlist() 메소드 내부오류 : " + e);
		} 
		return qlist;
	}
	
	// faq 테이블에 있는 글 개수 확인
	public int getBoardCount()  {
		String sql = "";
		int count = 0;
		try {
			sql = "select * from faq order by faqid desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("faqid");
			}
		} catch (Exception e) {
			System.out.println("getBoardCount() 메소드 내부오류 : " + e);
		} 
		return count;
	}
	
	// 페이징 처리 및 조회
	public ArrayList getBoardList(int startRow, int pageNum)  {
		
		String sql = "";
		ArrayList qnaList = new ArrayList();
		
		try {
			sql = "SELECT * FROM faq ORDER BY faqid DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageNum);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				qnaVO qVo = new qnaVO();
				qVo.setFaqid(rs.getInt("FAQID"));
				qVo.setQtitle(rs.getString("Qtitle"));
				qVo.setQContent(rs.getString("QContent"));
				qVo.setAnswer(rs.getString("Answer"));
				qVo.setQdata(rs.getString("PostDate"));
				qVo.setPoster(rs.getString("Poster"));		
				qnaList.add(qVo);
			}
			
		} catch (Exception e) {
			System.out.println("getBoardList() 메소드 내부오류 : " + e);
		} 
		
		return qnaList;
	}

	// 질문 추가
	public void addQnA(String loginUser, String title, String content, String answer) {
		String sql = "";
		
		try {
			
		sql = "INSERT INTO faq (QTitle, QContent, Answer, PostDate, Poster) " + 
				"VALUE (?, ?, ?, NOW(), ?)";	
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, answer);
		pstmt.setString(4, loginUser);
		
		pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("addQnA() 메소드 내부오류 : " + e);
		} 
		
	}
	
	// 글 수정 메소드
	public qnaVO editQnA(String faqID) {
		
		qnaVO qVo = new qnaVO();
		int faqId = Integer.parseInt(faqID);
		String sql = "";
		
		try {
			
			sql = "SELECT * FROM faq where FAQID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faqId);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				qVo.setFaqid(rs.getInt("FAQID"));
				qVo.setQtitle(rs.getString("Qtitle"));
				qVo.setQContent(rs.getString("Qcontent"));
				qVo.setAnswer(rs.getString("Answer"));
				qVo.setQdata(rs.getString("PostDate"));
				qVo.setPoster(rs.getString("Poster"));
			}
				
		} catch (Exception e) {
			System.out.println("editQnA() 메소드 내부오류 : " + e);
		} 
		
		return qVo;
	}

	// 글 수정 메소드
	public void updateQnA(qnaVO qVo) {
		
		String sql = "";
		
		try {
			
			sql = "update faq set QTitle=?, QContent=?, Answer=?,"
					+ " PostDate = now(), Poster=? where FAQID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qVo.getQtitle());
			pstmt.setString(2, qVo.getQContent());
			pstmt.setString(3, qVo.getAnswer());
			pstmt.setString(4, qVo.getPoster());
			pstmt.setInt(5, qVo.getFaqid());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateQnA() 메소드 내부오류 : " + e);
		} 
			
	}
	
	// 질문 삭제
	public void delQnA(int faqId) {
		String sql = "";
		
		try {
			
			sql = "delete from faq where faqid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faqId);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delQnA() 메소드 내부오류 : " + e);
		} 
		
	}
	
	
}
