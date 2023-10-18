package DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.CompanyVO;
import VO.ExpoInfoVO;

public class CompanyDAO {
    private Connection connection;

    public CompanyDAO() {
        // 데이터베이스 연결 초기화
        this.connection = DatabaseConnection.getConnection();
    }

    public void addCompany(CompanyVO company) {
    	
        String sql = "INSERT INTO Company (CoName, CoDetails, Co_tel, Co_number, Email, Passwd, StartDate, EndDate, ExpoID, Status) " +
                     "VALUES (?, ?, ?, ?, ?, SHA2(?, 256), ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, company.getCoName());
            preparedStatement.setString(2, company.getCoDetails());
            preparedStatement.setString(3, company.getCoTel());
            preparedStatement.setString(4, company.getCoNumber());
            preparedStatement.setString(5, company.getEmail());
            preparedStatement.setString(6, company.getPasswd());
            preparedStatement.setDate(7, new java.sql.Date(company.getStartDate().getTime()));
            preparedStatement.setDate(8, new java.sql.Date(company.getEndDate().getTime()));
            preparedStatement.setInt(9, company.getExpoID());
            preparedStatement.setInt(10, company.getStatus());

            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

    // 기업 전체 리스트 가져오는 메서드
    public List<CompanyVO> getAllCompanies() {
        List<CompanyVO> list = new ArrayList<>();
        
        //	수정 대기 중인 리스트만 가져옴
        String sql = "SELECT * FROM Company WHERE Status <> 1 ORDER BY CoID DESC";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
        	
            while (rs.next()) {
                CompanyVO com = new CompanyVO();
                
                com.setCoID(rs.getInt("CoID"));
                com.setCoName(rs.getString("CoName"));
                com.setCoDetails(rs.getString("CoDetails"));
                com.setCoTel(rs.getString("Co_tel"));
                com.setCoNumber(rs.getString("Co_number"));
                com.setEmail(rs.getString("Email"));
                com.setPasswd(rs.getString("Passwd"));
                com.setStartDate(rs.getDate("StartDate"));
                com.setEndDate(rs.getDate("EndDate"));
                com.setExpoID(rs.getInt("ExpoID"));
                com.setStatus(rs.getInt("Status"));
                
                list.add(com);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
        
        return list;
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
    	
    	List list = new ArrayList();
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
    
    private void handleExpoSelect(HttpServletRequest request, HttpServletResponse response, int selectedExpoID) throws ServletException, IOException {
        // 선택한 Expo에 대한 정보를 데이터베이스에서 가져오는 코드
        ExpoInfoDAO expoInfoDAO = new ExpoInfoDAO();
        ExpoInfoVO selectedExpo = expoInfoDAO.getExpoInfoByID(selectedExpoID);
        
        if (selectedExpo != null) {
            // 선택한 Expo 정보를 화면에 표시하는 코드 (예: JSP 페이지로 데이터 전달)
            request.setAttribute("selectedExpo", selectedExpo);
            request.getRequestDispatcher("your_jsp_page.jsp").forward(request, response);
        } else {
            // 선택한 Expo가 존재하지 않는 경우에 대한 처리 (예: 에러 메시지)
            response.getWriter().write("Selected Expo not found.");
        }
    }
    
    

}
