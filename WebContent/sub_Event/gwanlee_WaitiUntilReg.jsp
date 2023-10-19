<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.CompanyVO" %>
<%@ page import="VO.AttendeeVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="companyDAO" class="DAO.CompanyDAO" />
<jsp:useBean id="allCompanies" class="java.util.ArrayList" />
<jsp:useBean id="attendeeDAO" class="DAO.AttendeeDAO" />
<jsp:useBean id="allAttendees" class="java.util.ArrayList" />

<c:set var="allCompanies" value="${companyDAO.getCompanyList(0)}" />
<c:set var="allAttendees" value="${attendeeDAO.getAttendeeList(0)}" />

<!-- 회원가입 안 된 친구들 -->
<html>
<head>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

    <title>List</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>

	<!-- 기업 리스트의 status를 가입 처리 -->
	<button onclick="acceptAllCompanies()">기업 전체 승인</button>
	
	<!-- 참가자 리스트의 status를 가입 처리 -->
	<button onclick="acceptAllAttendees()">참가자 전체 승인</button>
	

    <div>
        <h1>Company List</h1>

        <table>
            <tr>
                <th>CoID</th>
                <th>CoName</th>
                <th>CoTel</th>
                <th>CoNumber</th>
                <th>Email</th>
                <th>StartDate</th>
                <th>EndDate</th>
                <th>ExpoID</th>
                <th>Status</th>
            </tr>

            <c:forEach var="company" items="${allCompanies}">
                <tr>
                    <td><c:out value="${company.coID}" /></td>
                    <td><c:out value="${company.coName}" /></td>
                    <td><c:out value="${company.coTel}" /></td>
                    <td><c:out value="${company.coNumber}" /></td>
                    <td><c:out value="${company.email}" /></td>
                    <td><c:out value="${company.startDate}" /></td>
                    <td><c:out value="${company.endDate}" /></td>
                    <td><c:out value="${company.expoID}" /></td>
                    <td><c:out value="${company.status}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    
    <div>
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

	<script src="assets/js/GwanleeRegist.js"></script>
</body>
</html>
