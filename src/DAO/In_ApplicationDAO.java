package DAO;

// 소이 - 면접 신청 정보를 데이터베이스와 연동하는 DAO 클래스

import VO.In_ApplicationVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class In_ApplicationDAO {
    private Connection connection;

    public In_ApplicationDAO(Connection connection) {
        this.connection = connection;
    }

    public void addApplication(In_ApplicationVO application) {
        // 데이터베이스에 면접 신청 정보 추가
        String sql = "INSERT INTO IntvwApplicant (AtndID, SchID, AppStatus) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, application.getAtndID());
            statement.setInt(2, application.getSchID());
            statement.setString(3, application.getAppStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateApplication(In_ApplicationVO application) {
        // 데이터베이스에서 면접 신청 정보 수정
        String sql = "UPDATE IntvwApplicant SET AtndID = ?, SchID = ?, AppStatus = ? WHERE AppID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, application.getAtndID());
            statement.setInt(2, application.getSchID());
            statement.setString(3, application.getAppStatus());
            statement.setInt(4, application.getAppID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteApplication(int applicationID) {
        // 데이터베이스에서 면접 신청 정보 삭제
        String sql = "DELETE FROM IntvwApplicant WHERE AppID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, applicationID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<In_ApplicationVO> getApplications() {
        // 데이터베이스에서 모든 면접 신청 정보 검색
        List<In_ApplicationVO> applications = new ArrayList<>();
        String sql = "SELECT * FROM IntvwApplicant";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                In_ApplicationVO application = new In_ApplicationVO();
                application.setAppID(resultSet.getInt("AppID"));
                application.setAtndID(resultSet.getInt("AtndID"));
                application.setSchID(resultSet.getInt("SchID"));
                application.setAppStatus(resultSet.getString("AppStatus"));
                applications.add(application);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }
}
