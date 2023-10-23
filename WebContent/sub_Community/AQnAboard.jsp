<%@page import="DAO.qnaDAO"%>
<%@page import="VO.qnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// MVC 패턴을 이용한 페이징 처리
	// 개발자 임의로 지정하는 변수 = 값
	int numPerPage = 5;			// 한 페이지당 조회해서 보여줄 글 개수
	int pagePerBlock = 5;		// 한 블럭(섹션)으로 묶여질 페이지 번호 개수
	
	// DB 를 통해 조회해서 지정되는 변수 = 값
	int totalRecord = 0;		// FAQ 테이블에 저장된 글의 총 개수
	int totalPage = 0;			// 총 페이지 수
	int totalBlock = 0;			// 총 블럭 수
	int nowPage = 0;			// 현재 사용자에게 보여지고 있는 페이지가 위치한 번호 
	int nowBlock = 0;			// 클릭한 페이지 번호가 속한 블럭 위치 번호 
	int beginPerPage = 0;		// 각 블럭마다 보여지는 시작 글 번호(맨위의 글번호)
	
	// 질문게시판 모든 질문 조회 
	ArrayList qlist = (ArrayList)request.getAttribute("qlist");
	qnaVO qVo = new qnaVO();
	
	// DB 에서 조회된 총 글의 개수
	totalRecord = (Integer)request.getAttribute("count");
	
	// 현재 페이지 번호를 클릭했다면?
	if( request.getAttribute("nowPage") != null){
		nowPage = Integer.parseInt( request.getAttribute("nowPage").toString() );
	}
	
	// 각 페이지 번호에 보여지는 글 목록의 가장 윗 글에 대한 글 번호 구하기
	beginPerPage = nowPage * numPerPage;
	
	// 조회된 글의 갯수에 따른 총 페이지 번호 개수
	// 총 페이지 번호 개수 = 총 글의 개수 / 한페이지당 보여질 글 개수
	// 나눔 처리했을 때 나머지 값(초과글)이 있는 경우 하나의 페이지를 더 추가해야하기 때문에 올림처리
	totalPage = (int)Math.ceil( (double)totalRecord/numPerPage );
	
	// 클릭한 페이지 번호가 속한 블럭 위치 번호 구하기
	if(request.getAttribute("nowBlock") != null){
		nowBlock = Integer.parseInt( request.getAttribute("nowBlock").toString() );
	}
	
	totalBlock = (int)Math.ceil( (double)totalPage/pagePerBlock );
	
	// 관리자 정보 확인
	System.out.println("세션에 저장된 값 : " + session.getAttribute("loginUser"));
	String sessionUser = (String)session.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/mainPage/css/QnAboard.css">

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
    for(int i=0; i<qlist.size(); i++){
        qVo = (qnaVO)qlist.get(i);
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
		<td colspan="1" align="center">
			<%
			if(totalRecord != 0){		// DB에 글이 있으면?
				if(nowBlock > 0){
			%>
					<a herf="<%=request.getContextPath()%>/QnA/QnAlist.do?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1)*pagePerBlock)%>">
					[<<]이전 <%=pagePerBlock%>개 
					</a>
			<%}%>
				<%
				for(int i=0; i<pagePerBlock; i++){
				%>
					&nbsp;&nbsp;
					<a herf="<%=request.getContextPath()%>/QnA/QnAlist.do?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock) + 1%>">
						<%=(nowBlock * pagePerBlock)+i+1%>
					</a>
					&nbsp;&nbsp;
				<%}%>
				<%
				if(totalBlock > nowBlock+1){
				%>
					<a herf="<%=request.getContextPath()%>/QnA/QnAlist.do?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">
					[>>]다음 <%=pagePerBlock%>개
					</a>	
				<%}%>
			<%
			}
			%>
			
		</td>
	</div>
	<div align="center">
		<input type="button" onclick="location.href='<%= request.getContextPath() %>/mainPage/index.jsp'" value="메인으로">
	<!-- 세션에 저장된 값에 '관리자' 라는 문자가 있으면 글쓰기 버튼 생성 -->
	<%
	if (sessionUser != null && sessionUser.contains("관리자")) {
	%>
	    <a href="<%= request.getContextPath() %>/sub_Community/addQnA.jsp?loginUser=<%=sessionUser%>">글쓰기</a>
	<%
	}
	%>
    </div>
</body>
</html>