package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AnnounceDAO;
import DAO.AttendeeDAO;
import Service.AnnounceService;
import VO.AnnounceVO;
import VO.AttendeeVO;


@WebServlet("/Ann/*")
public class AnnounceController extends HttpServlet {
	
	private AnnounceService announceService = new AnnounceService();
	
//	public void setAnnounceService(AnnounceService announceService) {
//		this.announceService = announceService;
//	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String action = request.getPathInfo();
		String contextPath = request.getContextPath();
		String nextPage = "" ; 
		String keyWord = "";
		String keyField = "";
		HttpSession session = request.getSession(true);
		System.out.println("요청 받은 주소 : " + action);
		System.out.println("요청 받은 컨텍스트 : " + contextPath);
		PrintWriter out = response.getWriter();
		
		

		if(action.equals("") || action == null) {
			
			nextPage = "/mainPage/index.jsp";

		}else if(action.equals("/list.do")){
			
			String nowPage = request.getParameter("nowPage");
			String nowBlock = request.getParameter("nowBlock");
			
			if(request.getParameter("keyWord") != null){
				keyField = request.getParameter("keyField");
				keyWord = request.getParameter("keyWord");
			}
			
			
			List  list = announceService.getAnnounceList(keyField, keyWord);
			
			request.setAttribute("keyField", keyField);
			request.setAttribute("keyWord", keyWord);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("nowBlock", nowBlock);
			request.setAttribute("AnnounceList", list);
			
			nextPage = "/sub_Community/Announce.jsp";
			
		}else if(action.equals("/insert.do")){
			
			AnnounceVO vo = new AnnounceVO();
			
			String poster = request.getParameter("poster");
			String annTitle = request.getParameter("AnnTitle");
			String annContent = request.getParameter("AnnContent");
			
			vo.setPoster(poster);
			vo.setAnnTitle(annTitle);
			vo.setAnnContent(annContent);
			
			announceService.InsertNotice(vo);	  
			
			nextPage = "/Ann/list.do";
			
		}else if(action.equals("/Check.do")) {
			
			nextPage = "/sub_Event/CheckAttnd.jsp";
		
		}else if(action.equals("/CheckPro.do")){
			
			String LoginEmail = (String)session.getAttribute("loginUser");
			
			String Passwd = request.getParameter("Passwd");
			
			boolean result = announceService.CheckPass(Passwd, LoginEmail);
			
			if(result) {
				nextPage = "/Ann/attendeInfo.do";
			}else {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.');");
				out.println("window.history.back();");
				out.println("</script>");
				return;
			}
			
			
		}else if(action.equals("/attendeInfo.do")) {
			
			String LoginEmail = (String)session.getAttribute("loginUser");
			AttendeeVO atndVO = announceService.getAttendee(LoginEmail);
			int ExpoID = atndVO.getExpoID();
			System.out.println(LoginEmail);
			String ExpoName = announceService.getExpoName(ExpoID);
			request.setAttribute("ExpoName", ExpoName);
			request.setAttribute("atnd", atndVO);
			
			nextPage= "/sub_Event/AttendInfo.jsp";
			
		}else if(action.equals("/EditAttend.do")) {
			
			String LoginEmail = (String)session.getAttribute("loginUser");
			
			AttendeeVO atndVO = announceService.getAttendee(LoginEmail);
			
			int ExpoID = atndVO.getExpoID();
			
			String ExpoName = announceService.getExpoName(ExpoID);
			
			request.setAttribute("ExpoName", ExpoName);
			
			request.setAttribute("atnd", atndVO);
			System.out.println(ExpoName);
			nextPage= "/sub_Event/EditAttend.jsp";
			
		}else if(action.equals("/EditAttendPro.do")) {
			
			int atndID = Integer.parseInt(request.getParameter("atndID"));
			String atndName = request.getParameter("atndName");
			String email = request.getParameter("email");
			
			AttendeeVO Editvo = new AttendeeVO();
			Editvo.setAtndID(atndID);
			Editvo.setAtndName(atndName);
			Editvo.setEmail(email);
			
			int result = announceService.UpdateAttend(Editvo);
			
			if(result < 1) {
				out.println("<script>");
				out.println("alert('수정에 실패하였습니다.');	");
				out.println("location.href='/ChuiUpExpo/Ann/EditAttend.do'; ");
				out.println("</script>");
				return;
				
			}else {
				out.println("<script>");
				out.println("alert('수정에 성공하였습니다.');	");
				out.println("location.href='/ChuiUpExpo/Ann/attendeInfo.do'; ");
				out.println("</script>");
				return;
			}
			
		
		}else if(action.equals("/DelAttend.do")) {
			
			int atndID = Integer.parseInt(request.getParameter("atndID"));
			int result = announceService.DelAttend(atndID);
			
			if(result > 0) {
			session.invalidate();
			out.println("<script>");
			out.println("alert('탈퇴에 성공하였습니다.');	");
			out.println("location.href='/ChuiUpExpo//sub_Event/expo_AnNae.jsp'; ");
			out.println("</script>");
				return;
			
			}else {
				out.println("<script>");
				out.println("alert('탈퇴에 실패하였습니다.');	");
				out.println("window.history.back();");
				out.println("</script>");
				return;
			}
			
			
		}else if(action.equals("/Eventlist.do")) {
			
			List list = new ArrayList();
			list = announceService.EventList();
			request.setAttribute("Event", list);
			nextPage = "/sub_Event/expo_Eventlist.jsp";
			
		}
		
		System.out.println("반환 되는 주소 : " + nextPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
