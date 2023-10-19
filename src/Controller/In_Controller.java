package Controller;


import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AttendeeDAO;
import DAO.CompanyDAO;
import DAO.DatabaseConnection;
import DAO.In_ApplicantDAO;
import DAO.In_ScheduleDAO;
import VO.AttendeeVO;
import VO.In_ApplicantVO;
import VO.In_ScheduleVO;


@WebServlet("/In_Controller3")
public class In_Controller extends HttpServlet {
	
	
	 private In_ApplicantDAO applicantDAO;
	    private In_ScheduleDAO scheduleDAO;

	    public In_Controller() {
	        applicantDAO = new In_ApplicantDAO();
	        scheduleDAO = new In_ScheduleDAO();
	        
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	request.setCharacterEncoding("UTF-8");
	    	String action = request.getParameter("action");
	        
	        
	    //    String action = request.getPathInfo();  //  온라인 면접 신청 요청애 관한 2 단계 요청 주소  /onlineApplication.do"   받기 
	        
	        
	        if (action == null) {
	        	
	        	
	            // 기본 페이지로 포워딩
	            List<In_ApplicantVO> applicants = applicantDAO.getAllApplicants();
	            List<In_ScheduleVO> schedules = scheduleDAO.getAllSchedules();
	            request.setAttribute("applicants", applicants);
	            request.setAttribute("schedules", schedules);
	            
	            request.getRequestDispatcher("sub_Interview/in_admin.jsp").forward(request, response);

	           // 일반회원 면접 신청
	        } else if (action.equals("approveApplicant")) {
	            // 승인 기능 수행
	            int appID = Integer.parseInt(request.getParameter("appID"));
	            
	            // 승인 로직 구현
	            In_ApplicantVO applicantVO = applicantDAO.getApplicantByID(appID);
	            
	            if (applicantVO != null) {
	                applicantVO.setStatus(1); // 승인 상태로 변경 (1은 승인을 나타내는 값)
	                applicantDAO.updateApplicant(applicantVO);
	            }

	            response.sendRedirect(request.getContextPath() + "/In_Controller");
	            
	        } else if (action.equals("approvedList")) {
	            // 승인된 목록을 가져와서 포워딩
	            List<In_ApplicantVO> approvedApplicants = applicantDAO.getApprovedApplicants();
	            request.setAttribute("approvedApplicants", approvedApplicants);
	            request.getRequestDispatcher("sub_Interview/approved_applicants.jsp").forward(request, response);
	        }
	        
	        else if (action.equals("updateApplicant")) {
	        	// 수정 기능 수행
	            int appID = Integer.parseInt(request.getParameter("appID"));
	            // 수정 로직 구현
	            In_ApplicantVO applicant = applicantDAO.getApplicantByID(appID);

	            if (applicant != null) {
	                request.setAttribute("applicant", applicant);

	                // 수정 페이지로 포워딩
	                request.getRequestDispatcher("sub_Interview/up_applicant.jsp").forward(request, response);
	            } 
	            
	        } else if (action.equals("deleteApplicant")) {
	            // 삭제 기능 수행
	            int appID = Integer.parseInt(request.getParameter("appID"));
	            
	            // 삭제 로직 구현
	            applicantDAO.deleteApplicant(appID);
	            response.sendRedirect(request.getContextPath() + "/In_Controller");
	            
	        } else if (action.equals("approveSchedule")) {
	        	// 승인 기능 수행
	            int schID = Integer.parseInt(request.getParameter("schID"));
	            
	            // 승인 로직 구현
	            In_ScheduleVO schedule = scheduleDAO.getScheduleByID(schID);
	            
	            if (schedule != null) {
	                // 여기에서 승인 처리
	                // 예를 들어, 승인 상태를 업데이트하거나 다른 작업을 수행합니다.
	                // 승인이 성공하면, 해당 기업의 일정 승인 상태를 변경합니다.
	                scheduleDAO.updateSchedule(schedule);
	            }

	            response.sendRedirect(request.getContextPath() + "/In_Controller");
	            
	        } else if (action.equals("updateSchedule")) {
	        	// 수정 기능 수행
	            int schID = Integer.parseInt(request.getParameter("schID"));
	            
	            // 수정 로직 구현
	            In_ScheduleVO schedule = scheduleDAO.getScheduleByID(schID);
	            
	            if (schedule != null) {
	            	request.setAttribute("schedule", schedule);
	            }
	            // 수정 페이지로 포워딩
	            request.getRequestDispatcher("sub_Interview/up_schedule.jsp").forward(request, response);
	            
	        } else if (action.equals("deleteSchedule")) {
	        	// 삭제 기능 수행
	            int schID = Integer.parseInt(request.getParameter("schID"));
	            
	            // 삭제 로직 구현
	            scheduleDAO.deleteSchedule(schID);

	            response.sendRedirect(request.getContextPath() + "/In_Controller");
	        
	        
	        }
	    }
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	  request.setCharacterEncoding("UTF-8");
		        response.setCharacterEncoding("UTF-8");
	        String action = request.getParameter("action");
	      
	        
	       if (action.equals("updateApplicant")) {
	            // 일반인 면접신청 수정 처리
	            int appID = Integer.parseInt(request.getParameter("appID"));
	            int atndID = Integer.parseInt(request.getParameter("atndID"));
	            int schID = Integer.parseInt(request.getParameter("schID"));
	            int status = Integer.parseInt(request.getParameter("status"));

	            In_ApplicantVO applicantVO = new In_ApplicantVO();
	            applicantVO.setAppID(appID);
	            applicantVO.setAtndID(atndID);
	            applicantVO.setSchID(schID);
	            applicantVO.setStatus(status);

	            applicantDAO.updateApplicant(applicantVO);

	            // 수정 완료 후 다시 관리자 페이지로 리다이렉트
	            response.sendRedirect(request.getContextPath() + "/In_Controller");
	        } 
	        
	        else if (action.equals("updateSchedule")) {
	            // 기업 면접일정 수정 처리
	            int schID = Integer.parseInt(request.getParameter("schID"));
	            Date intvwDate = Date.valueOf(request.getParameter("intvwDate"));

	            // 시간 데이터 처리 부분
	            String intvwTimeStr = request.getParameter("intvwTime");
	            		 
	            
	            String fixedTimeStr = intvwTimeStr + ":00";
	            Time intvwTime = Time.valueOf(fixedTimeStr);

	            In_ScheduleVO scheduleVO = new In_ScheduleVO();
	            scheduleVO.setSchID(schID);
	            scheduleVO.setIntvwDate(intvwDate);
	            scheduleVO.setIntvwTime(intvwTime);

	            // 데이터베이스에서 일정 수정
	            scheduleDAO.updateSchedule(scheduleVO);

	            // 수정 완료 후 다시 관리자 페이지로 리다이렉트
	            response.sendRedirect(request.getContextPath() + "/In_Controller");
	            
	        } // 기업 면접 공고 일정 추가
	        else if (action.equals("addSchedule")) {
	            Date intvwDate = Date.valueOf(request.getParameter("intvwDate"));
	           
	            int coID = Integer.parseInt(request.getParameter("coID"));
	            
	            // 시간 데이터 처리 부분
	            String intvwTimeStr = request.getParameter("intvwTime");
	            		 
	            
	            String fixedTimeStr = intvwTimeStr + ":00";
	            Time intvwTime = Time.valueOf(fixedTimeStr);

	            In_ScheduleVO scheduleVO = new In_ScheduleVO();
	            scheduleVO.setIntvwDate(intvwDate);
	            scheduleVO.setIntvwTime(intvwTime);
	            scheduleVO.setCoID(coID);

	            scheduleDAO.addSchedule(scheduleVO);

	            // 면접 일정관리 페이지로 포워딩
	            response.sendRedirect("/ChuiUpExpo/sub_Interview/in_schedule.jsp");

	        }
	       // 일반 면접신청 추가
	        else if (action.equals("addApplicant")) {
	            int atndID = Integer.parseInt(request.getParameter("atndID"));
	            int schID = Integer.parseInt(request.getParameter("schID"));
	          
	            
	            In_ApplicantVO applicantVO = new In_ApplicantVO();
	            
	            applicantVO.setAtndID(atndID);
	            applicantVO.setSchID(schID);
	          

	            applicantDAO.addApplicant(applicantVO);

	            // 신청이 완료되었습니다 알림을 표시
	            request.setAttribute("message", "신청이 완료되었습니다");
	       
	    }
	        else if (action.equals("addAttendee")) {
	        	// 준현
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
	            
            int AtndID = attendeeDAO.addAttendee1(attendee);
            System.out.println("AtndID 값은 : " + AtndID);
            
         
            

	            // 사용자가 선택한 기업명을 입력 받음
	            String coName = request.getParameter("coName1");
	            System.out.println(coName);
	            
	        
	            // CompanyDAO를 사용하여 기업명을 기반으로 CoID를 검색
            CompanyDAO companyDAO = new CompanyDAO();
	            int coID = companyDAO.getCoIDByName(coName);
            
            System.out.println("해당 coID값은 :" + coID); // 굿
            
            
	
	            if (coID > 0) {
	                // IntvwSchedDAO를 사용하여 CoID를 기반으로 SchID를 검색
	                In_ScheduleDAO schedDAO = new In_ScheduleDAO();
                int schID = schedDAO.getSchIDByCoID(coID);
	
             if (schID > 0) {
            	 In_ApplicantVO applicant = new In_ApplicantVO();
            	 applicant.setAtndID(AtndID); // 참가자 ID를 설정
            	 applicant.setSchID(schID); // 면접 일정 ID (SchID)를 설정
            	 applicant.setStatus(0); // status 값을 항상 0으로 설정

            	 In_ApplicantDAO applicantDAO = new In_ApplicantDAO();
            	 applicantDAO.addApplicant(applicant); // IntvwApplicant 테이블에 신청 정보 추가


						
						 
						  int schhID = applicant.getSchID();
						  
						  System.out.println("schhID 값은 : " +
						  schhID);
						 
	                    
	                    response.sendRedirect("/ChuiUpExpo/sub_Interview/in_application.jsp");
	                } else {
	                    // SchID를 찾을 수 없을 때의 에러 처리 로직
	                    // 사용자에게 오류 메시지를 표시하거나 다른 조치를 취할 수 있습니다.
	                }
	            } else {
	                // CoID를 찾을 수 없을 때의 에러 처리 로직
	                // 사용자에게 오류 메시지를 표시하거나 다른 조치를 취할 수 있습니다.
	            }
	            
       	
	        	
	        }
	        
	       }
		@Override
	    public void destroy() {
	        super.destroy();
	        DatabaseConnection.closeConnection();
	    }
	}