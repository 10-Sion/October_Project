package DAO;

// 소이 - 면접 관리자 정보를 데이터베이스와 연동하는 DAO 클래스

import VO.In_AdminVO; // 해당 VO 클래스를 임포트

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class In_AdminDAO {
    private Connection connection;

    public In_AdminDAO(Connection connection) {
        this.connection = connection;
    }

    // 관리자 정보를 데이터베이스에 추가하는 메서드
    public void addAdmin(In_AdminVO admin) {
        String query = "INSERT INTO Admin (AdmPW, AdmName, ExpoId, rol) VALUES (?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, admin.getAdmPW());
            preparedStatement.setString(2, admin.getAdmName());
            preparedStatement.setInt(3, admin.getExpoId());
            preparedStatement.setString(4, admin.getRol());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ID를 기반으로 관리자 정보를 가져오는 메서드
    // 개별 관리자 정보 반환
    public In_AdminVO getAdminByID(int admID) {
        In_AdminVO admin = null;
        String query = "SELECT * FROM Admin WHERE AdmID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, admID);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                admin = new In_AdminVO();
                admin.setAdmID(resultSet.getInt("AdmID"));
                admin.setAdmPW(resultSet.getString("AdmPW"));
                admin.setAdmName(resultSet.getString("AdmName"));
                admin.setExpoId(resultSet.getInt("ExpoId"));
                admin.setRol(resultSet.getString("rol"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;
    }

    // 관리자 정보를 업데이트하는 메서드
    public void updateAdmin(In_AdminVO admin) {
        String query = "UPDATE Admin SET AdmPW = ?, AdmName = ?, ExpoId = ?, rol = ? WHERE AdmID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, admin.getAdmPW());
            preparedStatement.setString(2, admin.getAdmName());
            preparedStatement.setInt(3, admin.getExpoId());
            preparedStatement.setString(4, admin.getRol());
            preparedStatement.setInt(5, admin.getAdmID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ID를 기반으로 관리자 정보를 삭제하는 메서드
    public void deleteAdmin(int admID) {
        String query = "DELETE FROM Admin WHERE AdmID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, admID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
 // 모든 관리자 정보를 가져오는 메서드
    public List<In_AdminVO> getAllAdmins() {
        List<In_AdminVO> admins = new ArrayList<>();
        String query = "SELECT * FROM Admin";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                In_AdminVO admin = new In_AdminVO();
                admin.setAdmID(resultSet.getInt("AdmID"));
                admin.setAdmPW(resultSet.getString("AdmPW"));
                admin.setAdmName(resultSet.getString("AdmName"));
                admin.setExpoId(resultSet.getInt("ExpoId"));
                admin.setRol(resultSet.getString("rol"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admins;
    }

}
