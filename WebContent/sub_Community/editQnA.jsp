<%@page import="VO.qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String loginUser = (String)session.getAttribute("loginUser");
    System.out.println(loginUser);
    
    qnaVO qVo = (qnaVO)request.getAttribute("qVo");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/mainPage/css/QnAboard.css">
<meta charset="UTF-8">
<title>질문 수정</title>
<style>
</style>
</head>
<body>
	<jsp:include page="/sub_Event/subTop.jsp" />
	<section id="main">
		<div class="inner">
	<form action="<%=request.getContextPath() %>/QnA/updateQnA.do?faqId=<%=qVo.getFaqid()%>&poster=<%=qVo.getPoster() %>" method="post">
    <div>
    
        <h3>자주하는 질문</h3>
        <table border="1">
            <tr>
                <th>번호</th>
                <th>질문</th>
                <th>질문 내용</th>
                <th>답변</th>
                <th>작성일</th>
                <th>작성자</th>
            </tr>
            <tr>
                <td>
                    <%=qVo.getFaqid() %>
                </td>
                <td>
                    <input type="text" name="Qtitle" value="<%=qVo.getQtitle() %>">
                </td>
                <td>
                    <input type="text" name="QContent" value="<%=qVo.getQContent() %>">
                </td>
                <td>
                    <input type="text" name="Answer" value="<%=qVo.getAnswer() %>">
                </td>
                <td>
                    <%=qVo.getQdata() %>
                </td>
                <td>
                    <%=qVo.getPoster() %>
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top: 10px;">
            <input type="submit" value="수정하기">
            <input type="button" onclick="location.href='<%= request.getContextPath() %>/QnA/QnAlist.do'" value="목록가기">
            <input type="button" onclick="location.href='<%= request.getContextPath() %>/QnA/delQnA.do?faqId=<%=qVo.getFaqid() %>'" value="글 삭제">
        </div>
    </div>
    </form>
    	</div>
    </section>
    <footer id="footer">
        <ul class="icons">
            <li><a href="https://twitter.com/jjencshk" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="https://www.facebook.com/yeilit/?locale=ko_KR" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/b.yeil_official/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
        </ul>
    </footer>
	<div class="copyright">
		Made with: <a href="https://templated.co/">Templated.co</a>
	</div>
</body>
</html>
