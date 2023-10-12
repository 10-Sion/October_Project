package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Event/*")
public class EventController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            
            response.sendRedirect("/ChuiUpExpo/sub_Event/expo_AnNae.jsp");
            
        } else if (action.equals("addAttendee")) {
            
        	
        	
        } else if (action.equals("otherAction")) {
        	
            
        } else {
            // 지원하지 않는 동작
            response.sendRedirect("error.jsp");
        }
    }
}
