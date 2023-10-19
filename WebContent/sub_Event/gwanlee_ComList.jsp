<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.CompanyVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="companyDAO" class="DAO.CompanyDAO" />
<jsp:useBean id="allCompanies" class="java.util.ArrayList" />

<c:set var="allCompanies" value="${companyDAO.getCompanyList('CoName', '', 1)}" />


<html>
<head>
    <title>Company List</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>

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
</body>
</html>
