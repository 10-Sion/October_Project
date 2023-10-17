package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import VO.CompanyVO;

public class CompanyDAO {
    private Connection connection;

    public CompanyDAO() {
        // 데이터베이스 연결 초기화
        this.connection = DatabaseConnection.getConnection();
    }

    public void addCompany(CompanyVO company) {
        String sql = "INSERT INTO Company (CoName, CoDetails, CoTel, CoNumber, Email, Passwd, StartDate, EndDate, ExpoID) " +
                     "VALUES (?, ?, ?, ?, ?, SHA2(?, 256), ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, company.getCoName());
            preparedStatement.setString(2, company.getCoDetails());
            preparedStatement.setString(3, company.getCoTel());
            preparedStatement.setString(4, company.getCoNumber());
            preparedStatement.setString(5, company.getEmail());
            preparedStatement.setString(6, company.getPasswd());
            preparedStatement.setDate(7, company.getStartDate());
            preparedStatement.setDate(8, company.getEndDate());
            preparedStatement.setInt(9, company.getExpoID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 수락 처리를 위한 메서드
    public void acceptCompany(int companyId) {
        String sql = "UPDATE Company SET Accepted = 1 WHERE CoID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, companyId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List getCompanyList(String keyField, String keyWord) {
    	
    	ArrayList list = new ArrayList();
    	String sql = "";
    	try {
    		
        	if(keyWord == null || keyWord.isEmpty()) {
      			sql = "select * from company where Status = 1 order by CoID desc";
      			
      		}else {
      			sql = "select * from company where Status = 1  and " + keyField + 
      					" like '%" + keyWord + "%' order by CoID desc";
      		}
			
			
			
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CompanyVO com = new CompanyVO();
				
				com.setCoID(rs.getInt("CoID"));
				com.setCoName(rs.getString("CoName"));
				com.setCoDetails(rs.getString("CoDetails"));
				com.setCoTel(rs.getString("Co_tel"));
				com.setCoNumber(rs.getString("Co_number"));
				com.setEmail(rs.getString("Email"));
				com.setStartDate(rs.getDate("startDate"));
				com.setEndDate(rs.getDate("endDate"));
				com.setExpoID(rs.getInt("ExpoID"));
				
				list.add(com);
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return list;
    }

	public CompanyVO getCompanyInfo(int coID) {
		String sql = "";
		CompanyVO com = null;
    	try {
    		
      		sql = "select * from company where Status = 1 and CoID="+ coID+  " order by CoID desc";
      			
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				com = new CompanyVO();
				
				com.setCoID(rs.getInt("CoID"));
				com.setCoName(rs.getString("CoName"));
				com.setCoDetails(rs.getString("CoDetails"));
				com.setCoTel(rs.getString("Co_tel"));
				com.setCoNumber(rs.getString("Co_number"));
				com.setEmail(rs.getString("Email"));
				com.setStartDate(rs.getDate("startDate"));
				com.setEndDate(rs.getDate("endDate"));
				com.setExpoID(rs.getInt("ExpoID"));
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return com;
	}
}
