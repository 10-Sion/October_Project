package Controller;

import DAO.In_ApplicationDAO;
import DAO.In_ScheduleDAO;
import VO.In_ApplicationVO;
import VO.In_ScheduleVO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class In_Controller {

    private List<In_ScheduleVO> schedules;
    private List<In_ApplicationVO> applications;

    // 데이터베이스 연결
    private Connection databaseConnection;

    public In_Controller() {
        schedules = new ArrayList<>();
        applications = new ArrayList<>();

        // 데이터베이스 연결 초기화
        databaseConnection = establishDatabaseConnection();
    }

    // 데이터베이스 연결 초기화 메서드
    private Connection establishDatabaseConnection() {
        // 여기에 데이터베이스 연결 설정 및 초기화 코드를 작성
        Connection connection = null;
        try {
            // 데이터베이스 연결 설정
            String url = "jdbc:mysql://localhost:3306/your_database_name";
            String username = "your_username";
            String password = "your_password";
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void addSchedule(Date date, String time, int companyID, int expoID) {
        In_ScheduleVO schedule = new In_ScheduleVO();
        schedule.setIntvwDate(date);
        schedule.setIntvwTime(time);
        schedule.setCoID(companyID);
        schedule.setExpoID(expoID);

        In_ScheduleDAO scheduleDAO = new In_ScheduleDAO(databaseConnection);
        scheduleDAO.addSchedule(schedule);
        schedules.add(schedule);
    }

    public void updateSchedule(int scheduleID, Date date, String time, int companyID, int expoID) {
        for (In_ScheduleVO schedule : schedules) {
            if (schedule.getSchID() == scheduleID) {
                schedule.setIntvwDate(date);
                schedule.setIntvwTime(time);
                schedule.setCoID(companyID);
                schedule.setExpoID(expoID);

                In_ScheduleDAO scheduleDAO = new In_ScheduleDAO(databaseConnection);
                scheduleDAO.updateSchedule(schedule);

                break;
            }
        }
    }

    public void deleteSchedule(int scheduleID) {
        In_ScheduleVO scheduleToRemove = null;
        for (In_ScheduleVO schedule : schedules) {
            if (schedule.getSchID() == scheduleID) {
                scheduleToRemove = schedule;

                In_ScheduleDAO scheduleDAO = new In_ScheduleDAO(databaseConnection);
                scheduleDAO.deleteSchedule(scheduleID);

                break;
            }
        }
        schedules.remove(scheduleToRemove);
    }

    public List<In_ScheduleVO> getSchedules() {
        In_ScheduleDAO scheduleDAO = new In_ScheduleDAO(databaseConnection);
        schedules = scheduleDAO.getSchedules();
        return schedules;
    }

    public void apply(int attendeeID, int scheduleID) {
        In_ApplicationVO application = new In_ApplicationVO();
        application.setAtndID(attendeeID);
        application.setSchID(scheduleID);
        application.setAppStatus("대기 중");

        In_ApplicationDAO applicationDAO = new In_ApplicationDAO(databaseConnection);
        applicationDAO.addApplication(application);
        applications.add(application);
    }

    public void manage(int applicationID, String action) {
        for (In_ApplicationVO application : applications) {
            if (application.getAppID() == applicationID) {
                application.setAppStatus(action);

                In_ApplicationDAO applicationDAO = new In_ApplicationDAO(databaseConnection);
                applicationDAO.updateApplication(application);

                break;
            }
        }
    }

    // 데이터베이스 연결 해제
    public void closeDatabaseConnection() {
        try {
            if (databaseConnection != null) {
                databaseConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
