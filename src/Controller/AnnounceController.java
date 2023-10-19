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

import DAO.AnnounceDAO;
import Service.AnnounceService;
import VO.AnnounceVO;


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
		System.out.println("요청 받은 주소 : " + action);
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
		}
		
		System.out.println("반환 되는 주소 : " + nextPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
