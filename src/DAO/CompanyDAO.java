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

    public CompanyDAO(Connection connection) {
        this.connection = connection;
    }

    public void addCompany(CompanyVO company) {
    	
        String sql = "INSERT INTO Company (CoName, CoDetails, Co_tel, Co_number, Email, Passwd, StartDate, EndDate, ExpoID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
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
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

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
                company.setPasswd(resultSet.getString("Passwd"));
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
    
    
}
