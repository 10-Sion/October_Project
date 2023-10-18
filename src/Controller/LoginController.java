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
			
			LoginDAO lDao = new LoginDAO();
			
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			String checkType = request.getParameter("type");
			String loginUser = "";
			int check = email.indexOf("@");
			
			System.out.println("@ 포함" + check);
			System.out.println("입력한 eamil 값 :" + email);
			System.out.println("입력한 paw 값 :" + pwd);
			System.out.println("입력한 checkType 값 :" + checkType);
			
			// 입력한 아이디에 @ 가 포함되지 않으면? 관리자 아이디와 매칭시킨다.
			if( check == -1) {
				// 관리자 체크 메소드 실행 후 loginUser 변수에 저장
				loginUser = lDao.checkAdmin(email, pwd);
				
				if(loginUser.equals("가입된 정보와 일치하지 않습니다.")) {
					loginUser = "가입된 정보와 일치하지 않습니다.";
					request.setAttribute("Retry", loginUser);
					nextPage = "/mainPage/login.jsp";
				// 관리자 체크 성공 시 request 에 AdmName 값 저장
				} else {
					request.setAttribute("loginUser", loginUser);
					nextPage = "/mainPage/index.jsp";
				}
				
				
			// 입력한 아이디에 @ 가 포함되어 있으면? 개인 및 기업 참가 여부 확인
			} else {
				if(checkType.equals("Comp")) {
					// 기업 로그인 요청 시 이메일, 비밀번호, 승인상태 검사
					loginUser = lDao.checkComp(email, pwd);
					System.out.println("기업");
					if( loginUser.equals("가입된 정보와 일치하지 않습니다.")) {
						loginUser = "가입된 정보와 일치하지 않습니다.";
						request.setAttribute("Retry", loginUser);
						nextPage = "/mainPage/login.jsp";
						
					} else if( loginUser.equals("관리자에게 문의 바람")) {
						loginUser = "가입 정보 변경 중 관리자 문의 바람";
						request.setAttribute("Retry", loginUser);
						nextPage = "/mainPage/login.jsp";
						
					} else {
						request.setAttribute("loginUser", loginUser);
						nextPage = "/mainPage/index.jsp";
					}
					
				} else if(checkType.equals("Atnd")){
					loginUser = lDao.checkUesr(email, pwd);
					System.out.println("개인");

					if( loginUser.equals("가입된 정보와 일치하지 않습니다.")) {
						loginUser = "가입된 정보와 일치하지 않습니다.";
						request.setAttribute("Retry", loginUser);
						nextPage = "/mainPage/login.jsp";
					} else if( loginUser.equals("관리자에게 문의 바람")) {
						loginUser = "가입 정보 변경 중 관리자 문의 바람";
						request.setAttribute("Retry", loginUser);
						nextPage = "/mainPage/login.jsp";
					} else {
						request.setAttribute("loginUser", loginUser);
						nextPage = "/mainPage/index.jsp";
					}
				}
			}
			
			System.out.println("return 값 : " + loginUser);			
		}
		
		System.out.println("반환 되는 주소 : " + nextPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
