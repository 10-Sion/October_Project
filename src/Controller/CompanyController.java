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

import DAO.CompanyDAO;
import VO.CompanyVO;


@WebServlet("/Company/*")
public class CompanyController extends HttpServlet {
	
	
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
		String nextPage = "";
		String keyWord = "";
		String keyField = "";
		System.out.println("요청 받은 주소 : " + action);
		PrintWriter out = response.getWriter();
		System.out.println(request.getParameter("coName"));

		if(action.equals("") || action == null) {
			
			nextPage = "/mainPage/index.jsp";

		}else if(action.equals("/list.do")){
			
			String nowPage = request.getParameter("nowPage");
			String nowBlock = request.getParameter("nowBlock");

			if(request.getParameter("keyWord") != null){
				keyField = request.getParameter("keyField");
				keyWord = request.getParameter("keyWord");
			}
			
			List list = new CompanyDAO().getCompanyList(keyField, keyWord);
			
			
			request.setAttribute("keyField", keyField);
			request.setAttribute("keyWord", keyWord);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("nowBlock", nowBlock);
			request.setAttribute("CompanyList", list);
//			request.setAttribute("top", "../sub_Event/subTop.jsp");
			
			nextPage = "/sub_Company/company_main.jsp";
			
		}else if(action.equals("/Info.do")){
			
			int CoID = Integer.parseInt(request.getParameter("CoId"));
			
			CompanyVO vo = new CompanyDAO().getCompanyInfo(CoID);
			
			request.setAttribute("CompanyInfo", vo);
			
			nextPage = "../sub_Company/company_Info.jsp";
		}
		
		
			
		System.out.println("반환 되는 주소 : " + nextPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
	}
}
