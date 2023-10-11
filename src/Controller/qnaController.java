package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.qnaDAO;
import VO.qnaVO;

@WebServlet("/QnA/*")
public class qnaController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
										throws ServletException, IOException {
		doHandle(request, response);
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
		String nextPage = "";
		System.out.println("요청 받은 주소 : " + action);
		
		if( action.equals("") || action == null) {
			
			nextPage = "/mainPage/index.jsp";
		
		} else if(action.equals("/QnAlist.do")) {
			
			qnaDAO qnaDAO = new qnaDAO();
			
			ArrayList qlist = new ArrayList();
			
			qlist = qnaDAO.selectQlist();
			
			request.setAttribute("qlist", qlist);
			
			nextPage = "/sub_Community/QnAboard.jsp";
		}
		
		System.out.println("반환 되는 주소 : " + nextPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}

