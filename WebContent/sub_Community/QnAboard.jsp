<%@page import="DAO.qnaDAO"%>
<%@page import="VO.qnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();	

    ArrayList qlist = (ArrayList)request.getAttribute("qlist");
    qnaVO qVo = new qnaVO();
	// 페이징
	qnaDAO qDao = new qnaDAO();
	// 게시판 전체 글 개수 count에 저장
	int count = qDao.getBoardCount();
	// 한페이지에 출력될 글 수
	int pageSize = 5;
	// 현 페이지 정보 설정
	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}
	// 첫 행 번호를 계산
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	// getBoardList() 메소드 호출
	ArrayList qnaLsit = (ArrayList)qDao.getBoardList(startRow, pageSize);
	System.out.println("리스트 사이즈 : " + qnaLsit.size());
	
	// 관리자 정보 확인
	System.out.println("세션에 저장된 값 : " + session.getAttribute("loginUser"));
	
	String sessionUser = (String)session.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
		href="<%=contextPath%>/sub_Event/assets/css/main.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/mainPage/css/QnAboard.css">
	<meta name="robots"
		content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>자주하는 질문</title>
<script>
    function toggleAnswer(row) {
        var answerRow = row.nextElementSibling;
        if (answerRow.style.display === "none") {
            answerRow.style.display = "table-row"; // 열을 확장하여 표시
        } else {
            answerRow.style.display = "none";
        }
    }
</script>
</head>
<body>
	<div>
	<jsp:include page="/sub_Event/subTop.jsp" />
		<h3>자주하는 질문</h3>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>질문</th>
				<th>질문 내용</th>
				<th>작성일</th>
				<th>작성자</th>
			</tr>
			<%
    for(int i=0; i<qnaLsit.size(); i++){
        qVo = (qnaVO)qnaLsit.get(i);
%>
			<tr onclick="toggleAnswer(this)">
				<td><%=qVo.getFaqid() %></td>
				<td><%=qVo.getQtitle() %></td>
				<td><%=qVo.getQContent() %></td>
				<td><%=qVo.getQdata() %></td>
				
				<!-- 세션에 저장된 값에 '관리자' 라는 문자가 있으면 글쓰기 버튼 생성 -->
				<td>
				<%
				if (sessionUser != null && sessionUser.contains("관리자")) {
				%>
				    <a href="<%= request.getContextPath() %>/QnA/editQnA.do?FaqId=<%=qVo.getFaqid() %>"><%=qVo.getPoster() %></a>
				<%
				} else {
				%>
					<%=qVo.getPoster() %>
				<%
				}
				%>
				</td>
			</tr>
			
			
			<tr class="answer-row">
				<td colspan="5"><%=qVo.getAnswer() %></td>
			</tr>
<%	
    }
%>
		</table>
	</div>
	<!-- 하단 글 페이지 번호 구현 -->
	<div id="page_control" style="text-align: center;">
<%
	if (count != 0) {
		// 전체 페이지 수 계산
	    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 한 페이지에 보여줄 페이지 블럭
	    int pageBlock = 5;
		// 한 페이지에 보여줄 페이지 블럭 시작번호 계산
	    int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 한페이지에 보여줄 페이지 블럭 시작번호 계산
	    int endPage = startPage + pageBlock - 1;
	
	    if (endPage > pageCount) {
	        endPage = pageCount;
	    }
	
	    if (startPage > pageBlock) {
	%>
			<a href="<%=request.getContextPath()%>/sub_Community/QnAboard.jsp?pageNum=<%= startPage - pageBlock %>">prev</a>
			<!-- 이전 페이지로 이동 -->
			<%
	    }
	
	    for (int i = startPage; i <= endPage; i++) {
	%>
			<a href="<%=request.getContextPath()%>/sub_Community/QnAboard.jsp?pageNum=<%= i %>"><%= i %></a>
			<!-- 각 페이지 번호 링크 -->
			<%
	    }
	
	    if (endPage < pageCount) {
	%>
			<a href="<%=request.getContextPath()%>/sub_Community/QnAboard.jsp?pageNum=<%= startPage + pageBlock %>">next</a>
			<!-- 다음 페이지로 이동 -->
			<%
	    }
	}
	%>
	</div>
	<div align="center">
		<input type="button" onclick="location.href='<%= request.getContextPath() %>/QnA/brackPage.do'" value="메인으로">
	<!-- 세션에 저장된 값에 '관리자' 라는 문자가 있으면 글쓰기 버튼 생성 -->
	<%
	if (sessionUser != null && sessionUser.contains("관리자")) {
	%>
	    <input type="button" onclick="location.href='<%= request.getContextPath() %>/QnA/addQnAFrom.do?loginUser=<%=sessionUser%>'" value="글쓰기">
	<%
	}
	%>
    </div>
</body>
</html>