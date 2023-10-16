package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDAO;

@WebServlet("/login/*")
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse responsep) 
							throws ServletException, IOException {
		doHandle(request, responsep);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
							throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
							throws ServletException, IOException {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		String contextPath = request.getContextPath();
		String nextPage = "";
		System.out.println("요청 받은 주소 : " + action);
		PrintWriter out = response.getWriter();

		if(action.equals("") || action == null) {
			
			nextPage = "/mainPage/index.jsp";

		}else if( action.equals("/login.do")) {
			
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			String checkType = request.getParameter("type");
			String loginUser = "";
			
//			System.out.println(email);
//			System.out.println(pwd);
//			System.out.println(checkType);
			
			LoginDAO lDao = new LoginDAO();
			
			if(checkType.equals("Comp")) {
				loginUser = lDao.checkComp(email, pwd);
				
				if( loginUser.equals("가입된 정보와 일치하지 않습니다.")) {
					loginUser = "가입된 정보와 일치하지 않습니다.";
					request.setAttribute("Retry", loginUser);
					nextPage = "/mainPage/login.jsp";			
				} else {
					request.setAttribute("loginUser", loginUser);
					nextPage = "/mainPage/index.jsp";
				}
				
			} else if(checkType.equals("Atnd")){
				loginUser = lDao.checkUesr(email, pwd);
				
				if( loginUser.equals("가입된 정보와 일치하지 않습니다.")) {
					loginUser = "가입된 정보와 일치하지 않습니다.";
					request.setAttribute("Retry", loginUser);
					nextPage = "/mainPage/login.jsp";	
				} else {
					request.setAttribute("loginUser", loginUser);
					nextPage = "/mainPage/index.jsp";
				}
			}

			System.out.println("return 값 : " + loginUser);
			
		}
		
		System.out.println("반환 되는 주소 : " + nextPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
