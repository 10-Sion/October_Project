package Controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.*;
import DAO.*;

@WebServlet("/Event/*")
public class EventController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("/ChuiUpExpo/sub_Event/expo_AnNae.jsp");
            
        } else if (action.equals("addAttendee")) {
        	
            // Attendee 추가 처리
            String atndName = request.getParameter("atndName");
            String email = request.getParameter("email");
            String passwd = request.getParameter("passwd");
            int expoID = Integer.parseInt(request.getParameter("expoID"));

            AttendeeVO attendee = new AttendeeVO();
            
            attendee.setAtndName(atndName);
            attendee.setEmail(email);
            attendee.setPasswd(passwd);
            attendee.setExpoID(expoID);

            AttendeeDAO attendeeDAO = new AttendeeDAO();
            attendeeDAO.addAttendee(attendee);

            response.sendRedirect("/ChuiUpExpo/sub_Event/expo_SaJeon.jsp");
            
        } else if (action.equals("addCompany")) {
        	
            // 기업 추가 처리
            String coName = request.getParameter("coName");
            String coDetails = request.getParameter("coDetails");
            String coTel = request.getParameter("co_tel");
            String coNumber = request.getParameter("co_number");
            String email = request.getParameter("email");
            String passwd = request.getParameter("passwd");
            Date startDate = Date.valueOf(request.getParameter("startDate")); // 사용자로부터 날짜를 문자열로 입력 받음
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            int expoID = Integer.parseInt(request.getParameter("expoID"));

            CompanyVO company = new CompanyVO();
            
            company.setCoName(coName);
            company.setCoDetails(coDetails);
            company.setCoTel(coTel);
            company.setCoNumber(coNumber);
            company.setEmail(email);          
            company.setPasswd(passwd);
            company.setStartDate(startDate);
            company.setEndDate(endDate);
            company.setExpoID(expoID);

            CompanyDAO companyDAO = new CompanyDAO();
            companyDAO.addCompany(company);
            

            response.sendRedirect("/ChuiUpExpo/sub_Event/expo_SaJeon.jsp");
            
        } else if (action.equals("acceptCompany")) {
            // 기업 수락 처리
            int companyId = Integer.parseInt(request.getParameter("coID"));

            CompanyDAO companyDAO = new CompanyDAO();
            companyDAO.acceptCompany(companyId);

            response.sendRedirect("/ChuiUpExpo/sub_Event/expo_CompanyAccepted.jsp");
        } else {
            // 지원하지 않는 동작
            response.sendRedirect("error.jsp");
        }
    }
}
