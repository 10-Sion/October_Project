package Controller;


import DAO.DatabaseConnection;
import DAO.In_AdminDAO;
import DAO.In_ApplicantDAO;
import DAO.In_ScheduleDAO;
import VO.In_AdminVO;
import VO.In_ApplicantVO;
import VO.In_ScheduleVO;

import java.sql.Connection;
import java.sql.*;
import java.util.List;

// 소이

public class In_Controller {
    private Connection connection;

    public In_Controller() {
        connection = DatabaseConnection.getConnection();
    }

    // 관리자 정보 관련 메서드
    public void addAdmin(String admPW, String admName, int expoId, String rol) {
        In_AdminDAO adminDAO = new In_AdminDAO(connection);
        In_AdminVO adminVO = new In_AdminVO();
        adminVO.setAdmPW(admPW);
        adminVO.setAdmName(admName);
        adminVO.setExpoId(expoId);
        adminVO.setRol(rol);
        adminDAO.addAdmin(adminVO);
    }
    
    // 특정 관리자 정보
    public In_AdminVO getAdminByID(int admID) {
        In_AdminDAO adminDAO = new In_AdminDAO(connection);
        return adminDAO.getAdminByID(admID);
    }
    
    // 관리자 정보 업데이트
    public void updateAdmin(int admID, String admPW, String admName, int expoId, String rol) {
        In_AdminDAO adminDAO = new In_AdminDAO(connection);
        In_AdminVO adminVO = adminDAO.getAdminByID(admID);
        if (adminVO != null) {
            adminVO.setAdmPW(admPW);
            adminVO.setAdmName(admName);
            adminVO.setExpoId(expoId);
            adminVO.setRol(rol);
            adminDAO.updateAdmin(adminVO);
        }
    }
    
    // 관리자 정보 삭제
    public void deleteAdmin(int admID) {
        In_AdminDAO adminDAO = new In_AdminDAO(connection);
        adminDAO.deleteAdmin(admID);
    }

    // 모든 관리자 정보
    public List<In_AdminVO> getAllAdmins() {
        In_AdminDAO adminDAO = new In_AdminDAO(connection);
        return adminDAO.getAllAdmins();
    }

    // 면접 신청자 정보 관련 메서드
    public void addApplicant(int atndID, int schID, String appStatus) {
        In_ApplicantDAO applicantDAO = new In_ApplicantDAO(connection);
        In_ApplicantVO applicantVO = new In_ApplicantVO();
        applicantVO.setAtndID(atndID);
        applicantVO.setSchID(schID);
        applicantVO.setAppStatus(appStatus);
        applicantDAO.addApplicant(applicantVO);
    }

    // 면접 일정 정보 관련 메서드
    public void addSchedule(Date intvwDate, Time intvwTime, int coID) {
        In_ScheduleDAO scheduleDAO = new In_ScheduleDAO(connection);
        In_ScheduleVO scheduleVO = new In_ScheduleVO();
        scheduleVO.setIntvwDate(intvwDate);
        scheduleVO.setIntvwTime(intvwTime);
        scheduleVO.setCoID(coID);
        scheduleDAO.addSchedule(scheduleVO);
    }

    public void closeConnection() {
        DatabaseConnection.closeConnection();
    }

    public static void main(String[] args) {
        // 테스트 코드 작성
        In_Controller controller = new In_Controller();
        // 여기에서 컨트롤러의 메서드를 사용하여 데이터베이스 작업을 수행할 수 있습니다.
    }
}
