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
import VO.*;

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

    // 여러개의 status를 가져와 기업을 리스트화
    /* 좀 더 손 봐야할듯....
     * 
    public List<CompanyVO> getCompanyList(int... statuses) {
        List<CompanyVO> list = new ArrayList<>();
        String sql = "SELECT * FROM Company WHERE Status IN (";
        
        for (int i = 0; i < statuses.length; i++) {
            sql += "?";
            if (i < statuses.length - 1) {
                sql += ",";
            }
        }
        
        sql += ") ORDER BY CoID ASC, Status DESC";
        
        try {
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                for (int i = 0; i < statuses.length; i++) {
                    pstmt.setInt(i + 1, statuses[i]);
                }
                
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
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
                    com.setStatus(rs.getInt("Status"));
                    list.add(com);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
*/
    
    // 특정 status 리스트화 메서드
    public List<CompanyVO> getCompanyList(int status) {
        List<CompanyVO> list = new ArrayList<>();
        String sql = "SELECT * FROM Company WHERE Status = ? ORDER BY CoID DESC";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, status); // Set the value for the status parameter

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
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
                com.setStatus(rs.getInt("Status"));
                list.add(com);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
    // 특정 조건 기업 리스트 가져오는 메서드 (status 추가)
    public List<CompanyVO> getCompanyList(String keyField, String keyWord, int status) {
        List<CompanyVO> list = new ArrayList<>();
        String sql = "";
        try {
            if (keyWord == null || keyWord.isEmpty()) {
            	sql = "SELECT * FROM Company WHERE Status <> ? ORDER BY Status DESC";

            } else {
                sql = "SELECT * FROM Company WHERE Status <> ? AND " + keyField + " LIKE ? ORDER BY CoID DESC";
            }

            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setInt(1, status);  // Set the value for the first parameter

                if (!keyWord.isEmpty()) {
                    pstmt.setString(2, "%" + keyWord + "%"); // Set the value for the second parameter
                }

                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
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
                    com.setStatus(rs.getInt("Status"));
                    list.add(com);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    
 // 수락 처리를 위한 메서드
    public void acceptAllCompanies() {
        String sql = "UPDATE Company SET Status = 1 WHERE Status = 0";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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

    //	Status를 필터링하는 메서드
    public CompanyVO getActiveCompanyInfo(int coID) {
        String sql = "SELECT * FROM company WHERE Status = 1 AND CoID = ? ORDER BY CoID DESC";
        CompanyVO com = null;
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, coID);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
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

    // id를 통해 기업을 가져오는 메서드
    public CompanyVO getCompanyInfo(int coID) {
        String sql = "SELECT * FROM company WHERE CoID = ? ORDER BY CoID DESC";
        
        CompanyVO com = null;
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, coID);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
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
                com.setStatus(rs.getInt("Status"));
                
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
    
    // 소이 사용 메서드 추가
    public List<CompanyVO> getAllCompanies() {
        List<CompanyVO> companies = new ArrayList<>();
        String sql = "SELECT * FROM Company";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                CompanyVO company = new CompanyVO();
                company.setCoID(resultSet.getInt("CoID"));
                company.setCoName(resultSet.getString("CoName"));
                company.setCoDetails(resultSet.getString("CoDetails"));
                company.setCoTel(resultSet.getString("Co_tel"));
                company.setCoNumber(resultSet.getString("Co_number"));
                company.setEmail(resultSet.getString("Email"));
                company.setStartDate(resultSet.getDate("StartDate"));
                company.setEndDate(resultSet.getDate("EndDate"));
                company.setExpoID(resultSet.getInt("ExpoID"));
                
                companies.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return companies;
    }
    
    
    // 주어진 기업명(coName)을 기반으로 해당 기업의 CoID를 검색하고 반환
    public int getCoIDByName(String coName) {
        int coID = -1;
        String query = "SELECT CoID FROM Company WHERE CoName = ?";
        
        System.out.println("coName: " + coName);

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, coName);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                coID = rs.getInt("CoID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return coID;
    }

    //	기업 수정 메서드
    public void updateCompany(CompanyVO company) {
        String sql = "UPDATE Company SET CoName = ?, CoDetails = ?, Co_tel = ?, Co_number = ?, " +
                     "Email = ?, StartDate = ?, EndDate = ?, ExpoID = ?, Status = ? WHERE CoID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, company.getCoName());
            preparedStatement.setString(2, company.getCoDetails());
            preparedStatement.setString(3, company.getCoTel());
            preparedStatement.setString(4, company.getCoNumber());
            preparedStatement.setString(5, company.getEmail());
            preparedStatement.setDate(6, new java.sql.Date(company.getStartDate().getTime()));
            preparedStatement.setDate(7, new java.sql.Date(company.getEndDate().getTime()));
            preparedStatement.setInt(8, company.getExpoID());
            preparedStatement.setInt(9, company.getStatus());
            preparedStatement.setInt(10, company.getCoID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

    // 기업 삭제 메서드
    public boolean deleteCompany(int coID) {
        String sql = "DELETE FROM Company WHERE CoID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, coID);
            int affectedRows = preparedStatement.executeUpdate();

            return affectedRows > 0; // 성공하면 true, 실패하면 false 반환
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<In_ScheduleVO> getAllIntvwSched() {
        List<In_ScheduleVO> companies = new ArrayList<>();
        String sql = "select * from IntvwSched";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
            	In_ScheduleVO company = new In_ScheduleVO();
                company.setSchID(rs.getInt("schID"));
                company.setIntvwDate(rs.getDate("intvwDate"));
                company.setIntvwTime(rs.getTime("intvwTime"));
                company.setCoID(rs.getInt("coID"));
                company.setStatus(rs.getInt("status"));
                
                companies.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return companies;
    }
    public String getCoName(int Coid) {
        String sql = "SELECT CoName FROM Company where CoId = " + Coid;
        String CoName = "";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
            	CoName = resultSet.getString("coName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return CoName;
    }

    

}
