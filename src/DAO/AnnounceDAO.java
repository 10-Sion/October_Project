package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.AnnounceVO;

public  class AnnounceDAO implements AnnounceInterface{
	
	private Connection connection;
	
	public AnnounceDAO() {
        // 데이터베이스 연결 초기화
        this.connection = DatabaseConnection.getConnection();
    }

 

	    
//	    public void rs_Close() {
//			try {	
//				if(pstmt != null) {	pstmt.close(); }
//				if(rs != null) { rs.close(); }
//				if(con != null) { con.close(); }
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
	    
	@Override
	public List getAnnounceList(String keyField,String keyWord) {
		   List list = new ArrayList();
	    	   

	          try{
	        	  String sql = "select * from Announce order by AnnID desc"; 
	        	  if(keyWord == null || keyWord.isEmpty()) {
	      			sql = "select * from Announce";
	      			
	      		}else {
	      			sql = "select * from Announce where " + keyField + 
	      					" like '%" + keyWord + "%' order by AnnID desc";
	      		}
	      		
	        	  PreparedStatement pstmt = connection.prepareStatement(sql);
	  			
	  				ResultSet rs = pstmt.executeQuery();
	        	  
	        	  while(rs.next()) {
	        		  AnnounceVO vo = new AnnounceVO();
	        		  vo.setAnnID(rs.getInt("annID"));
	        		  vo.setAnnTitle(rs.getString("annTitle"));
	        		  vo.setPoster(rs.getString("poster"));
	        		  vo.setAnnContent(rs.getString("annContent"));
	        		  vo.setPostDate(rs.getDate("postDate"));
	        		  
	        		  list.add(vo);
	        	  } 
	        	  
	          } catch (Exception e) {
	        	  System.out.println("공지사항 리스트 메소드 오류");
	              e.printStackTrace();
	          }
	          return list;
	}
	    
	    @Override
	    public void InsertNotice(AnnounceVO vo) {
	    	
	    	try {
	        	  String sql = "INSERT INTO Announce (AnnTitle, AnnContent, PostDate, Poster)" + 
	        	  		"VALUES(?, ?, now(), ?)"; 
	        	  
	        	  PreparedStatement pstmt = connection.prepareStatement(sql);
	  			
	  			ResultSet rs = pstmt.executeQuery();
	        	  
	        	  pstmt.setString(1, vo.getAnnTitle());
	        	  pstmt.setString(2, vo.getAnnContent());
	        	  pstmt.setString(3, vo.getPoster());
	        	  
	          } catch (Exception e) {
	              e.printStackTrace();
	          }
	    }
}
