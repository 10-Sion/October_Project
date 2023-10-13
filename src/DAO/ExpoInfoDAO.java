package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.ExpoInfoVO;

public class ExpoInfoDAO {
	
	public ExpoInfoDAO() {
		this.connection = DatabaseConnection.getConnection();
	}
	
    private Connection connection;

    public ExpoInfoDAO(Connection connection) {
        this.connection = connection;
    }

    // ExpoInfo 테이블 상 모든 데이터 가져옴
    public List<ExpoInfoVO> getAllExpos() {
        List<ExpoInfoVO> expoList = new ArrayList<>();
        String sql = "SELECT * FROM ExpoInfo";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                ExpoInfoVO expo = new ExpoInfoVO();
                expo.setExpoID(resultSet.getInt("ExpoID"));
                expo.setExpoName(resultSet.getString("ExpoName"));
                expo.setExpoStartSched(resultSet.getDate("ExpoStartSched"));
                expo.setExpoEndSched(resultSet.getDate("ExpoEndSched"));
                

                expoList.add(expo);
                System.out.println("ExpoID: " + expo.getExpoID() + ", ExpoName: " + expo.getExpoName());
            
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return expoList;
    }

    
}