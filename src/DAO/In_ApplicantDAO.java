package DAO;

import VO.In_ApplicantVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class In_ApplicantDAO {
    private Connection connection;

    public In_ApplicantDAO() {
        this.connection = DatabaseConnection.getConnection();
    }

    // 면접 신청 정보를 데이터베이스에 추가하는 메서드
    public void addApplicant(In_ApplicantVO applicant) {
        String query = "INSERT INTO IntvwApplicant (AtndID, SchID, Status) VALUES (?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, applicant.getAtndID());
            preparedStatement.setInt(2, applicant.getSchID());
            preparedStatement.setInt(3, applicant.getStatus());

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
                applicant.setStatus(resultSet.getInt("Status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return applicant;
    }

    // 면접 신청 정보를 업데이트하는 메서드
    public void updateApplicant(In_ApplicantVO applicant) {
        String query = "UPDATE IntvwApplicant SET AtndID = ?, SchID = ?, Status = ? WHERE AppID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, applicant.getAtndID());
            preparedStatement.setInt(2, applicant.getSchID());
            preparedStatement.setInt(3, applicant.getStatus());
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

    // 모든 면접 신청 정보를 가져오는 메서드
    public List<In_ApplicantVO> getAllApplicants() {
        List<In_ApplicantVO> applicants = new ArrayList<>();
        String query = "SELECT * FROM IntvwApplicant";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                In_ApplicantVO applicant = new In_ApplicantVO();
                applicant.setAppID(resultSet.getInt("appID"));
                applicant.setAtndID(resultSet.getInt("atndID"));
                applicant.setSchID(resultSet.getInt("schID"));
                applicant.setStatus(resultSet.getInt("status"));
                applicants.add(applicant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return applicants;
    }

    // 승인된 상태의 면접 신청 정보를 가져오는 메서드
    public List<In_ApplicantVO> getApprovedApplicants() {
        List<In_ApplicantVO> approvedApplicants = new ArrayList<>();
        String query = "SELECT * FROM IntvwApplicant WHERE Status = 1"; // 1은 승인된 상태를 나타냅니다.

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                In_ApplicantVO applicant = new In_ApplicantVO();
                applicant.setAppID(resultSet.getInt("AppID"));
                applicant.setAtndID(resultSet.getInt("AtndID"));
                applicant.setSchID(resultSet.getInt("SchID"));
                applicant.setStatus(resultSet.getInt("Status"));
                approvedApplicants.add(applicant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return approvedApplicants;
    }
    
    
}
