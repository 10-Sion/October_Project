<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%String sessionUser = (String) session.getAttribute("loginUser"); 
String path = request.getContextPath();
%>
    <meta charset="UTF-8">
    <meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">

    <title>신청 정보 수정</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
<section id="main">
		<div class="inner">
<h1 align="center">일반 면접 신청 정보 수정</h1>

<%-- 신청 정보를 수정하기 위한 폼 --%>
<form action="<%= request.getContextPath() %>/In_Controller3" method="post">
    <input type="hidden" name="action" value="updateApplicant">
    <input type="hidden" name="appID" value="${applicant.appID}">

    <label for="atndID">신청자 ID:</label>
    <input type="text" id="atndID" name="atndID" value="${applicant.atndID}" readonly><br>

    <label for="schID">일정 ID:</label>
    <input type="text" id="schID" name="schID" value="${applicant.schID}" readonly><br>

    <label for="status">신청 상태:</label>
    <input type="text" id="status" name="status" value="${applicant.status}"><br>

    <button type="submit">수정</button>
</form>
</div>
	</section>
	<footer id="footer">
	<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
		</ul>
	</footer>
	<div class="copyright">
		Made with: <a href="https://templated.co/">Templated.co</a>
	</div>

<%-- 기타 내용 추가 가능 --%>

</body>
</html>
