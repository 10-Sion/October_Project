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
		System.out.println("요청 받은 주소 : " + action);
		PrintWriter out = response.getWriter();

		if(action.equals("") || action == null) {
			
			nextPage = "/mainPage/index.jsp";

		}else if(action.equals("/list.do")){
			
			CompanyDAO dao = new CompanyDAO();
			List list = new ArrayList();
			
			list = dao.getCompanyList();
			
			request.setAttribute("CompanyList", list);
			
			nextPage = "/sub_Company/company_main.jsp";
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
						  dispatcher.forward(request, response);
	}
}
