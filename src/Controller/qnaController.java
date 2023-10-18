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
			
			ArrayList qlist = new ArrayList();
			qnaDAO qnaDAO = new qnaDAO();
			
			// 전체 글 조회
			qlist = qnaDAO.selectQlist();
			request.setAttribute("qlist", qlist);
			
			// 전체 글 갯수 조회
			int count = qnaDAO.getTotalRecord();
			request.setAttribute("count", count);
			
			// AQnAboard.jsp 페이징 처리 부분에서 이전 또는 다음 또는 각 페이지 번호를 클릭했을 때
			String nowPage = request.getParameter("nowPage");
			String nowBlock = request.getParameter("Block");
			
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("nowBlock", nowBlock);
			
			nextPage = "/sub_Community/QnAboard.jsp";
			
		} else if (action.equals("/addQnA.do")) {
			
			qnaDAO qnaDAO = new qnaDAO();

			String loginUser = request.getParameter("loginUser");
			String title = request.getParameter("Qtitle");
			String content = request.getParameter("QContent");
			String answer = request.getParameter("Answer");
			
			System.out.println(loginUser);
			System.out.println(title);
			System.out.println(content);
			System.out.println(answer);
			
			qnaDAO.addQnA(loginUser, title, content, answer);
			
			nextPage = "/sub_Community/QnAboard.jsp";
			
		// 작성자 탭의 관리자 링크를 눌리면 요청
		} else if (action.equals("/editQnA.do")) {
			String FaqID = request.getParameter("FaqId");
			System.out.println("전달된 글번호 " + FaqID);
			
			qnaDAO qDao = new qnaDAO();
			qnaVO qVo = new qnaVO();
			
			qVo = qDao.editQnA(FaqID);
			
			request.setAttribute("qVo", qVo);
			
			nextPage = "/sub_Community/editQnA.jsp";
		
		// 글 수정 요청 시 
		} else if (action.equals("/updateQnA.do")) {
			
			int faqId = Integer.parseInt(request.getParameter("faqId"));
			String Qtitle = request.getParameter("Qtitle");
			String QContent = request.getParameter("QContent");
			String Answer = request.getParameter("Answer");
			String Poster = request.getParameter("poster");
			
			qnaVO qVo = new qnaVO();
			qnaDAO qDao = new qnaDAO();
			
			qVo.setFaqid(faqId);
			qVo.setQtitle(Qtitle);
			qVo.setQContent(QContent);
			qVo.setAnswer(Answer);
			qVo.setPoster(Poster);
			
			qDao.updateQnA(qVo);
	
			nextPage = "/sub_Community/QnAboard.jsp";
			
		} else if (action.equals("/delQnA.do")) {
			
			qnaDAO qDao = new qnaDAO();
			System.out.println(request.getAttribute("faqId"));
			
			int faqId = Integer.parseInt(request.getParameter("faqId"));
			
			qDao.delQnA(faqId);
			
			nextPage = "/sub_Community/QnAboard.jsp";
		}

		System.out.println("반환 되는 주소 : " + nextPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}