package DAO;

// 소이 - 면접 관리자 정보를 데이터베이스와 연동하는 DAO 클래스

import VO.In_EmpVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class In_EmpDAO {
    private Connection connection;

    public In_EmpDAO(Connection connection) {
        this.connection = connection;
    }

    public void addEmployee(In_EmpVO employee) {
        // 면접 관리자 정보 추가
        String sql = "INSERT INTO IntvwAdm (AdmPW, AdmName) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, employee.getAdmPW());
            statement.setString(2, employee.getAdmName());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<In_EmpVO> getEmployees() {
        // 모든 면접 관리자 정보 조회
        List<In_EmpVO> employees = new ArrayList<>();
        String sql = "SELECT * FROM IntvwAdm";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                In_EmpVO employee = new In_EmpVO();
                employee.setAdmID(resultSet.getInt("AdmID"));
                employee.setAdmPW(resultSet.getString("AdmPW"));
                employee.setAdmName(resultSet.getString("AdmName"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
}
