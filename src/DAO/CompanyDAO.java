package DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
                     "VALUES (?, ?, ?, ?, ?, SHA2(?, 256), ?, ?, ?, 0)";

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
