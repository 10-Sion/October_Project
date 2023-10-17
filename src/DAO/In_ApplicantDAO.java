package DAO;

// 소이 - 면접 신청 정보를 데이터베이스와 연동하는 DAO 클래스

import VO.In_ApplicantVO; // 해당 VO 클래스를 임포트

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class In_ApplicantDAO {
    private Connection connection;

    public In_ApplicantDAO(Connection connection) {
        this.connection = connection;
    }

    // 면접 신청 정보를 데이터베이스에 추가하는 메서드
    public void addApplicant(In_ApplicantVO applicant) {
        String query = "INSERT INTO IntvwApplicant (AtndID, SchID, AppStatus) VALUES (?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, applicant.getAtndID());
            preparedStatement.setInt(2, applicant.getSchID());
            preparedStatement.setString(3, applicant.getAppStatus());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 면접 신청 정보를 ID를 기반으로 가져오는 메서드
    public In_ApplicantVO getApplicantByID(int appID) {
        In_ApplicantVO applicant = null;
        String query = "SELECT * FROM IntvwApplicant WHERE AppID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, appID);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                applicant = new In_ApplicantVO();
                applicant.setAppID(resultSet.getInt("AppID"));
                applicant.setAtndID(resultSet.getInt("AtndID"));
                applicant.setSchID(resultSet.getInt("SchID"));
                applicant.setAppStatus(resultSet.getString("AppStatus"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return applicant;
    }

    // 면접 신청 정보를 업데이트하는 메서드
    public void updateApplicant(In_ApplicantVO applicant) {
        String query = "UPDATE IntvwApplicant SET AtndID = ?, SchID = ?, AppStatus = ? WHERE AppID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, applicant.getAtndID());
            preparedStatement.setInt(2, applicant.getSchID());
            preparedStatement.setString(3, applicant.getAppStatus());
            preparedStatement.setInt(4, applicant.getAppID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 면접 신청 정보를 ID를 기반으로 삭제하는 메서드
    public void deleteApplicant(int appID) {
        String query = "DELETE FROM IntvwApplicant WHERE AppID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, appID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
