package DAO;

// 소이 - 면접 일정 정보를 데이터베이스와 연동하는 DAO 클래스 (기업)

import VO.In_ScheduleVO; // 해당 VO 클래스를 임포트

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class In_ScheduleDAO {
    private Connection connection;

    public In_ScheduleDAO() {
    	this.connection = DatabaseConnection.getConnection();
    }

    // 면접 일정을 데이터베이스에 추가하는 메서드
    public void addSchedule(In_ScheduleVO schedule) {
        String query = "INSERT INTO IntvwSched (IntvwDate, IntvwTime, CoID, Status) VALUES (?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setDate(1, (Date) schedule.getIntvwDate());
            preparedStatement.setTime(2, schedule.getIntvwTime());
            preparedStatement.setInt(3, schedule.getCoID());
            preparedStatement.setInt(4, schedule.getStatus());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 면접 일정을 ID를 기반으로 가져오는 메서드
    public In_ScheduleVO getScheduleByID(int schID) {
        In_ScheduleVO schedule = null;
        String query = "SELECT * FROM IntvwSched WHERE SchID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, schID);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                schedule = new In_ScheduleVO();
                schedule.setSchID(resultSet.getInt("SchID"));
                schedule.setIntvwDate(resultSet.getDate("IntvwDate"));
                schedule.setIntvwTime(resultSet.getTime("IntvwTime"));
                schedule.setCoID(resultSet.getInt("CoID"));
                schedule.setStatus(resultSet.getInt("Status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return schedule;
    }

    // 면접 일정을 업데이트하는 메서드
    public void updateSchedule(In_ScheduleVO schedule) {
    	String query = "UPDATE IntvwSched SET IntvwDate = ?, IntvwTime = ?, Status = ? WHERE SchID = ?";

    	try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
    	    preparedStatement.setDate(1, (Date) schedule.getIntvwDate());
    	    preparedStatement.setTime(2, schedule.getIntvwTime());
    	    preparedStatement.setInt(3, schedule.getStatus());
    	    preparedStatement.setInt(4, schedule.getSchID());
    	    
    	    preparedStatement.executeUpdate();
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	}

    }

    // 면접 일정을 ID를 기반으로 삭제하는 메서드
    public void deleteSchedule(int schID) {
        String query = "DELETE FROM IntvwSched WHERE SchID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, schID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 // 모든 면접 일정 정보를 가져오는 메서드
    public List<In_ScheduleVO> getAllSchedules() {
        List<In_ScheduleVO> schedules = new ArrayList<>();
        String query = "SELECT * FROM IntvwSched";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                In_ScheduleVO schedule = new In_ScheduleVO();
                schedule.setSchID(resultSet.getInt("SchID"));
                schedule.setIntvwDate(resultSet.getDate("IntvwDate"));
                schedule.setIntvwTime(resultSet.getTime("IntvwTime"));
                schedule.setCoID(resultSet.getInt("CoID"));
                schedule.setStatus(resultSet.getInt("Status"));
                schedules.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return schedules;
    }

    // 주어진 CoID를 기반으로 IntvwSched 테이블에서 해당 기업의 SchID를 검색하고 반환
    public int getSchIDByCoID(int coID) {
        int schID = -1;
        String query = "SELECT SchID FROM IntvwSched WHERE CoID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, coID);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                schID = rs.getInt("SchID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return schID;
    }
    
    // 승인된 상태의 면접 일정 정보를 가져오기
    public List<In_ScheduleVO> getApprovedSchedules() {
        List<In_ScheduleVO> approvedSchedules = new ArrayList<>();
        String query = "SELECT * FROM IntvwSched WHERE Status = 1";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                In_ScheduleVO schedule = new In_ScheduleVO();
                schedule.setSchID(resultSet.getInt("SchID"));
                schedule.setIntvwDate(resultSet.getDate("IntvwDate"));
                schedule.setIntvwTime(resultSet.getTime("IntvwTime"));
                schedule.setCoID(resultSet.getInt("CoID"));
                schedule.setStatus(resultSet.getInt("Status"));
                approvedSchedules.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return approvedSchedules;
    }

    

}









