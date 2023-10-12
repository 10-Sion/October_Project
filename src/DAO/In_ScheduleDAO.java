package DAO;

// 소이 - 면접 일정 정보를 데이터베이스와 연동하는 DAO 클래스

import VO.In_ScheduleVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class In_ScheduleDAO {
    private Connection connection;

    public In_ScheduleDAO(Connection connection) {
        this.connection = connection;
    }

    public void addSchedule(In_ScheduleVO schedule) {
        // 데이터베이스에 면접 스케줄 추가
        String sql = "INSERT INTO IntvwSched (IntvwDate, IntvwTime, CoID, ExpoID) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, new java.sql.Date(schedule.getIntvwDate().getTime()));
            statement.setString(2, schedule.getIntvwTime());
            statement.setInt(3, schedule.getCoID());
            statement.setInt(4, schedule.getExpoID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateSchedule(In_ScheduleVO schedule) {
        // 데이터베이스에서 면접 스케줄 수정
        String sql = "UPDATE IntvwSched SET IntvwDate = ?, IntvwTime = ?, CoID = ?, ExpoID = ? WHERE SchID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, new java.sql.Date(schedule.getIntvwDate().getTime()));
            statement.setString(2, schedule.getIntvwTime());
            statement.setInt(3, schedule.getCoID());
            statement.setInt(4, schedule.getExpoID());
            statement.setInt(5, schedule.getSchID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSchedule(int scheduleID) {
        // 데이터베이스에서 면접 스케줄 삭제
        String sql = "DELETE FROM IntvwSched WHERE SchID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, scheduleID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<In_ScheduleVO> getSchedules() {
        // 데이터베이스에서 모든 면접 스케줄 검색
        List<In_ScheduleVO> schedules = new ArrayList<>();
        String sql = "SELECT * FROM IntvwSched";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                In_ScheduleVO schedule = new In_ScheduleVO();
                schedule.setSchID(resultSet.getInt("SchID"));
                schedule.setIntvwDate(resultSet.getDate("IntvwDate"));
                schedule.setIntvwTime(resultSet.getString("IntvwTime"));
                schedule.setCoID(resultSet.getInt("CoID"));
                schedule.setExpoID(resultSet.getInt("ExpoID"));
                schedules.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }
}
