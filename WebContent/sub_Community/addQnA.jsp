<%@page import="VO.qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContentType();
    String loginUser = (String)request.getAttribute("loginUser");
    System.out.println(loginUser);
%>
<!DOCTYPE html>
<html>
<head>

<%-- <link rel="stylesheet" href="<%=contextPath%>/sub_Event/assets/css/main.css"> --%>
		
<meta name="robots"
		content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<title>질문 수정</title>
<style>
</style>
</head>
<body>
<jsp:include page="/sub_Event/subTop.jsp" />
	<section id="main">
		<div class="inner">
	<form action="<%=request.getContextPath() %>/QnA/addQnA.do?loginUser=<%=loginUser %>" method="post">
    <div>
        <h3>자주하는 질문</h3>
        
        <table border="1">
            <tr>
                <th>질문</th>
                <th>질문 내용</th>
                <th>답변</th>
                <th>작성자</th>
            </tr>
            <tr>
                <td>
                    <input type="text" name="Qtitle" value="">
                </td>
                <td>
                    <input type="text" name="QContent" value="">
                </td>
                <td>
                    <input type="text" name="Answer" value="">
                </td>
                <td>
                    <%=loginUser%>
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top: 10px;">
            <input type="submit" value="글 작성">
            <input type="reset" value="다시작성">
            <input type="button" onclick="location.href='<%= request.getContextPath() %>/QnA/QnAlist.do'" value="목록가기">
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
