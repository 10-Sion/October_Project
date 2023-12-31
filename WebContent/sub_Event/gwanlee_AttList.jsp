<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.AttendeeVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="attendeeDAO" class="DAO.AttendeeDAO" />
<jsp:useBean id="allAttendees" class="java.util.ArrayList" />

<c:set var="allAttendees" value="<%= attendeeDAO.getAllAttendees() %>" />

<html>
<head>
    <title>Attendee List</title>
</head>
<body>
	<jsp:include page="subTop.jsp"/>
	<section id="main">
		<div class="inner">
    <h1>Attendee List</h1>
    <table>
        <tr>
            <th>AtndID</th>
            <th>AtndName</th>
            <th>Email</th>
            <th>ExpoID</th>
            <th>Status</th>
        </tr>

        <c:forEach var="attendee" items="${allAttendees}">
            <tr>
                <td><c:out value="${attendee.atndID}" /></td>
                <td><c:out value="${attendee.atndName}" /></td>
                <td><c:out value="${attendee.email}" /></td>
                <td><c:out value="${attendee.expoID}" /></td>
                <td><c:out value="${attendee.status}" /></td>
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
</body>
</html>