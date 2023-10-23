package Controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
    	
    	String action = request.getParameter("action");
    	String contextPath = request.getContextPath();
    	
        if (action == null) {
            response.sendRedirect( contextPath+"/sub_Event/expo_AnNae.jsp");
            
        } else if (action.equals("addAttendee")) {
        	
            // Attendee 추가 처리
            String atndName = request.getParameter("atndName");
            String email = request.getParameter("email");
            String passwd = request.getParameter("passwd");
            int expoID = Integer.parseInt(request.getParameter("expoID"));
            int status = 0;	// 승인 대기 :0

            AttendeeVO attendee = new AttendeeVO();
            
            attendee.setAtndName(atndName);
            attendee.setEmail(email);
            attendee.setPasswd(passwd);
            attendee.setExpoID(expoID);
            attendee.setStatus(status);	

            AttendeeDAO attendeeDAO = new AttendeeDAO();
            attendeeDAO.addAttendee(attendee);

            response.sendRedirect(contextPath +"/sub_Event/expo_SaJeon.jsp");
            
        } else if (action.equals("attendeeList")) {
            // 모든 Attendee 정보 가져오기
            AttendeeDAO attendeeDAO = new AttendeeDAO();
            List<AttendeeVO> attendees = attendeeDAO.getAllAttendees();

            request.setAttribute("attendees", attendees);
            request.getRequestDispatcher("/sub_Event/gwanlee_AttList.jsp").forward(request, response);
            
        }	else if (action.equals("addCompany")) {
        	
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
            
        } else if (action.equals("companyList")) {
            // 모든 기업 정보 가져오기 (status가 1이 아닌 모든 기업)
            CompanyDAO companyDAO = new CompanyDAO();
            List<CompanyVO> companies = companyDAO.getCompanyList("CoName", "", 1); // status가 1이 아닌 기업을 가져오도록 설정

            request.setAttribute("companies", companies);
            request.getRequestDispatcher("/sub_Event/gwanlee_ComList.jsp").forward(request, response);
            
        } else if (action.equals("SelectWhat")) {
	            // Expo 선택 변경 처리
	            int selectedExpoID = Integer.parseInt(request.getParameter("expoID"));
	            
	            ExpoInfoDAO expoInfoDAO = new ExpoInfoDAO();
	            ExpoInfoVO selectedExpo = expoInfoDAO.getExpoInfoByID(selectedExpoID);

	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");

	            if (selectedExpo != null) {
	                // 선택한 Expo 정보
	                String json = "{\"expoID\":" + selectedExpo.getExpoID() + 
	                                ",\"expoName\":\"" + selectedExpo.getExpoName() + 
	                                "\",\"expoStartSched\":\"" + selectedExpo.getExpoStartSched() + 
	                                "\",\"expoEndSched\":\"" + selectedExpo.getExpoEndSched() + "\"}";

	                // JSON 응답 전송
	                response.getWriter().write(json);
	                
	            } else {
	                // 선택한 Expo가 존재하지 않는 경우에 대한 처리
	                response.getWriter().write("Selected Expo not found.");
	                
	            }
	            // 기업 전체 수락 처리
	        } if (action.equals("acceptAllCompanies")) {
	            CompanyDAO companyDAO = new CompanyDAO();
	            companyDAO.acceptAllCompanies();
	            
	            response.sendRedirect(contextPath +"/sub_Event/gwanlee_WaitiUntilReg.jsp");
	            
	            // 참가자 전체 수락 처리
	        } else if (action.equals("acceptAllAttendees")) {
	            AttendeeDAO attendeeDAO = new AttendeeDAO();
	            attendeeDAO.acceptAllAttendees();
	            
	            response.sendRedirect(contextPath +"/sub_Event/gwanlee_WaitiUntilReg.jsp");
	            
	        } else if (action.equals("editCompany")) {
	            int coID = Integer.parseInt(request.getParameter("coID"));

	            CompanyDAO companyDAO = new CompanyDAO();
	            CompanyVO company = companyDAO.getCompanyInfo(coID);

	            if (company != null) {
	                request.setAttribute("company", company);
	                request.getRequestDispatcher("/editCompany.jsp").forward(request, response);
	            } else {
	                // 회사를 찾지 못한 경우의 처리
	                response.sendRedirect(contextPath + "/sub_Event/gwanlee_ComList.jsp");
	                
	            }
	            
	        } else if (action.equals("updateCompany")) {
	        	
	            int coID = Integer.parseInt(request.getParameter("coID"));
	            String coName = request.getParameter("coName");
	            String coDetails = request.getParameter("coDetails");
	            String coTel = request.getParameter("coTel");
	            String coNumber = request.getParameter("coNumber");
	            String email = request.getParameter("email");
	            Date startDate = Date.valueOf(request.getParameter("startDate"));
	            Date endDate = Date.valueOf(request.getParameter("endDate"));
	            int expoID = Integer.parseInt(request.getParameter("expoID"));
	            int status = Integer.parseInt(request.getParameter("status"));

	            CompanyDAO companyDAO = new CompanyDAO();
	            CompanyVO company = companyDAO.getCompanyInfo(coID);

	            if (company != null) {
	            	
	                company.setCoName(coName);
	                company.setCoDetails(coDetails);
	                company.setCoTel(coTel);
	                company.setCoNumber(coNumber);
	                company.setEmail(email);
	                company.setStartDate(startDate);
	                company.setEndDate(endDate);
	                company.setExpoID(expoID);
	                company.setStatus(status);

	                companyDAO.updateCompany(company);
	                response.sendRedirect(contextPath + "/sub_Event/gwanlee_ComList.jsp");
	                
	            } else {
	                // 회사를 찾지 못한 경우의 처리
	                response.sendRedirect(contextPath + "/sub_Event/gwanlee_ComList.jsp");
	            }
	        }

 
 else {
            // 지원하지 않는 동작
            response.sendRedirect("error.jsp");
        }
    }
    


}
