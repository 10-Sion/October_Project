<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%String sessionUser = (String) session.getAttribute("loginUser"); 
String path = request.getContextPath();
%>
	
<head>
    <meta charset="UTF-8">
    <meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">
<title>면접 신청 목록 - 승인된 신청</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
<section id="main">
		<div class="inner">
    <h1 align="center">면접 신청 목록 - 승인된 신청</h1>
    <table>
        <tr>
            <th>신청 ID</th>
            <th>신청자 ID</th>
            <th>일정 ID</th>
            <th>상태</th>
        </tr>
        <c:forEach var="applicant" items="${approvedApplicants}">
            <tr>
                <td>${applicant.appID}</td>
                <td>${applicant.atndID}</td>
                <td>${applicant.schID}</td>
                <td>${applicant.status}</td>
            </tr>
        </c:forEach>
    </table>
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
