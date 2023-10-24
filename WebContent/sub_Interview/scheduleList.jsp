<%@page import="java.util.List"%>
<%@page import="VO.In_ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    
    <title>면접 일정 목록 - 승인된 일정</title>
</head>
<body>
    <jsp:include page="../sub_Event/subTop.jsp" />
	<section id="main">
		<div class="inner">


            <h1 align="center">면접 일정 목록 - 승인된 일정</h1>
            <table>
                <tr>
                    <th>일정 ID</th>
                    <th>면접 날짜</th>
                    <th>면접 시간</th>
                    <th>기업 참가번호</th>
                    <th>상태</th>
                </tr>

                <c:forEach var="schedule" items="${approvedSchedules}">
                    <tr>
                        <td>${schedule.schID}</td>
                        <td>${schedule.intvwDate}</td>
                        <td>${schedule.intvwTime}</td>
                        <td>${schedule.coID}</td>
                        <td>${schedule.status}</td>
                    </tr>
                </c:forEach>
            </table>
</div>
	</section>
	<footer id="footer">
	<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
		</ul>
	</footer>
    
</body>
</html>
