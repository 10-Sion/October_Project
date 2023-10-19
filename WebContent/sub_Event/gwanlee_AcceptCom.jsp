<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.CompanyVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="companyDAO" class="DAO.CompanyDAO" />
<jsp:useBean id="allCompanies" class="java.util.ArrayList" />

<!-- status가 0인 company 리스트 가져오기 -->
<c:set var="companies" value="<%=companyDAO.getCompanyList('CoName', '', 0) %>" />

<html>
<head>
    <title>Company List</title>
</head>
<body>
    <jsp:include page="subTop.jsp" />

    <h1>Company List (Status 0)</h1>
    <table>
        <tr>
            <th>CoID</th>
            <th>CoName</th>
            <th>CoDetails</th>
            <th>CoTel</th>
            <th>CoNumber</th>
            <th>Email</th>
            <th>StartDate</th>
            <th>EndDate</th>
            <th>ExpoID</th>
            <th>Status</th>
        </tr>

        <c:forEach var="company" items="${companies}">
            <tr>
                <td><c:out value="${company.coID}" /></td>
                <td><c:out value="${company.coName}" /></td>
                <td><c:out value="${company.coDetails}" /></td>
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
</body>
</html>
