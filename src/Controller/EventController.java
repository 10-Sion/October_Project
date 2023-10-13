package Controller;

import java.io.IOException;

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
        	
            String atndName = request.getParameter("atndName");
            String email = request.getParameter("email");
            String passwd = request.getParameter("passwd");
            int expoID = Integer.parseInt(request.getParameter("expoID"));

            // VO 객체 설정
            AttendeeVO attendee = new AttendeeVO();
            attendee.setAtndName(atndName);
            attendee.setEmail(email);
            attendee.setPasswd(passwd);
            attendee.setExpoID(expoID);

            // Attendee 추가 메서드
            AttendeeDAO attendeeDAO = new AttendeeDAO();
            attendeeDAO.addAttendee(attendee);

            response.sendRedirect("/ChuiUpExpo/sub_Event/expo_SaJeonApply.jsp");
            
        } else if (action.equals("otherAction")) {
            
        } else {
            // 지원하지 않는 동작
            response.sendRedirect("error.jsp");
        }
    }
}
