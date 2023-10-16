package Controller;

import java.io.IOException;

import java.sql.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DatabaseConnection;
import DAO.In_AdminDAO;
import DAO.In_ApplicantDAO;
import DAO.In_ScheduleDAO;
import VO.In_AdminVO;
import VO.In_ApplicantVO;
import VO.In_ScheduleVO;

@WebServlet("/In_Controller")
public class In_Controller extends HttpServlet {
    private In_ApplicantDAO applicantDAO;
    private In_ScheduleDAO scheduleDAO;

    public In_Controller() {
        applicantDAO = new In_ApplicantDAO();
        scheduleDAO = new In_ScheduleDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setCharacterEncoding("UTF-8");

        if (action == null) {
            // 기본 페이지로 포워딩
            List<In_ApplicantVO> applicants = applicantDAO.getAllApplicants();
            List<In_ScheduleVO> schedules = scheduleDAO.getAllSchedules();
            request.setAttribute("applicants", applicants);
            request.setAttribute("schedules", schedules);
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        } else if (action.equals("approveApplicant")) {
            // 승인 기능 수행
            int appID = Integer.parseInt(request.getParameter("appID"));
            // 승인 로직 구현
            // ...
            response.sendRedirect(request.getContextPath() + "/In_Controller");
        } else if (action.equals("updateApplicant")) {
            // 수정 기능 수행
            int appID = Integer.parseInt(request.getParameter("appID"));
            // 수정 로직 구현
            // ...
            response.sendRedirect(request.getContextPath() + "/In_Controller");
        } else if (action.equals("deleteApplicant")) {
            // 삭제 기능 수행
            int appID = Integer.parseInt(request.getParameter("appID"));
            applicantDAO.deleteApplicant(appID);
            response.sendRedirect(request.getContextPath() + "/In_Controller");
        } else if (action.equals("approveSchedule")) {
            // 승인 기능 수행
            int schID = Integer.parseInt(request.getParameter("schID"));
            // 승인 로직 구현
            // ...
            response.sendRedirect(request.getContextPath() + "/In_Controller");
        } else if (action.equals("updateSchedule")) {
            // 수정 기능 수행
            int schID = Integer.parseInt(request.getParameter("schID"));
            // 수정 로직 구현
            // ...
            response.sendRedirect(request.getContextPath() + "/In_Controller");
        } else if (action.equals("deleteSchedule")) {
            // 삭제 기능 수행
            int schID = Integer.parseInt(request.getParameter("schID"));
            scheduleDAO.deleteSchedule(schID);
            response.sendRedirect(request.getContextPath() + "/In_Controller");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setCharacterEncoding("UTF-8");

        if (action.equals("addApplicant")) {
            int atndID = Integer.parseInt(request.getParameter("atndID"));
            int schID = Integer.parseInt(request.getParameter("schID"));
            String appStatus = request.getParameter("appStatus");

            In_ApplicantVO applicantVO = new In_ApplicantVO();
            applicantVO.setAtndID(atndID);
            applicantVO.setSchID(schID);
            applicantVO.setAppStatus(appStatus);

            applicantDAO.addApplicant(applicantVO);

            // 신청이 완료되었습니다 알림을 표시
            request.setAttribute("message", "신청이 완료되었습니다");
        } else if (action.equals("addSchedule")) {
            Date intvwDate = Date.valueOf(request.getParameter("intvwDate"));
            
            // 시간 데이터 처리 부분 추가
            String intvwTimeStr = request.getParameter("intvwTime");
            String fixedTimeStr = intvwTimeStr + ":00";
            Time intvwTime = Time.valueOf(fixedTimeStr);
            
            int coID = Integer.parseInt(request.getParameter("coID"));

            In_ScheduleVO scheduleVO = new In_ScheduleVO();
            scheduleVO.setIntvwDate(intvwDate);
            scheduleVO.setIntvwTime(intvwTime);
            scheduleVO.setCoID(coID);

            scheduleDAO.addSchedule(scheduleVO);

            // 면접 일정관리 페이지로 포워딩
            response.sendRedirect(request.getContextPath() + "/In_Controller?action=adminPage");
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        DatabaseConnection.closeConnection();
    }
}
