<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionUser = (String) session.getAttribute("loginUser");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">
<body>			
	<jsp:include page="../sub_Event/subTop.jsp"/>
	<section id="main">
		<div class="inner">
    <!-- 면접 일정 추가 양식 -->
    <h2 align="center">기업용 면접 일정 추가</h2>
    <form action="/ChuiUpExpo/In_Controller3" method="post">
        <input type="hidden" name="action" value="addSchedule">
        <label for="coID">기업 참가번호:</label>
        <input type="text" id="coID" name="coID" required> <br>
        <label for="intvwDate">면접 날짜:</label>
        <input type="date" id="intvwDate" name="intvwDate" required><br><br>
        <label for="intvwTime">면접 시간 (시:분):</label>
		<input type="time" id="intvwTime" name="intvwTime" step="60" required><br><br>

        
        <input type="submit" value="추가">
    </form>

    <!-- 오류 메시지 표시 -->
    <c:if test="${not empty param.error}">
        <p style="color: red">${param.error}</p>
    </c:if>
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