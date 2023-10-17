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
    
    public ExpoInfoVO getExpoInfoByID(int expoID) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ExpoInfoVO expoInfo = null;

        try {
            conn = DatabaseConnection.getConnection(); // 데이터베이스 연결 코드

            String sql = "SELECT * FROM expo_info WHERE expo_id = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, expoID);

            rs = stmt.executeQuery();

            if (rs.next()) {
                expoInfo = new ExpoInfoVO();
                expoInfo.setExpoID(rs.getInt("ExpoID"));
                expoInfo.setExpoName(rs.getString("ExpoName"));
                expoInfo.setExpoStartSched(rs.getDate("ExpoStartSched"));
                expoInfo.setExpoEndSched(rs.getDate("ExpoEndSched"));
                expoInfo.setOrganizer(rs.getString("organizer"));
                expoInfo.setDescription(rs.getString("Description"));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제 코드 (conn, stmt, rs)
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return expoInfo;
    }




    
}