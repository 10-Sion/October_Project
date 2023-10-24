<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<%String sessionUser = (String) session.getAttribute("loginUser"); %>
<head>
    <meta charset="UTF-8">
    <title>면접 신청 목록 - 승인된 신청</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
    <h1>면접 신청 목록 - 승인된 신청</h1>
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
</body>
</html>
