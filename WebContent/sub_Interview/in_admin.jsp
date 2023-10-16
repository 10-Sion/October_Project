<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>면접 관리자 페이지</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp" />

<h1>면접 관리자 페이지</h1>

<!-- 면접 신청 정보 -->
<h2>면접 신청 정보</h2>
<table>
    <tr>
        <th>신청 ID</th>
        <th>신청자 ID</th>
        <th>일정 ID</th>
        <th>상태</th>
        <th>액션</th>
    </tr>
    <c:forEach var="applicant" items="${applicants}">
        <tr>
            <td>${applicant.appID}</td>
            <td>${applicant.atndID}</td>
            <td>${applicant.schID}</td>
            <td>${applicant.appStatus}</td>
            <td>
                <!-- 승인 버튼 -->
                <a href="<%= request.getContextPath() %>/Admin_Controller?action=approveApplicant&appID=${applicant.appID}">승인</a>
                
                <!-- 수정 버튼 -->
                <a href="<%= request.getContextPath() %>/Admin_Controller?action=editApplicant&appID=${applicant.appID}">수정</a>
                
                <!-- 삭제 버튼 -->
                <a href="<%= request.getContextPath() %>/Admin_Controller?action=deleteApplicant&appID=${applicant.appID}">삭제</a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- 면접 일정 정보 -->
<h2>면접 일정 정보</h2>
<table>
    <tr>
        <th>일정 ID</th>
        <th>면접 날짜</th>
        <th>면접 시간</th>
        <th>회사 ID</th>
        <th>액션</th>
    </tr>
    <c:forEach var="schedule" items="${schedules}">
        <tr>
            <td>${schedule.schID}</td>
            <td>${schedule.intvwDate}</td>
            <td>${schedule.intvwTime}</td>
            <td>${schedule.coID}</td>
            <td>
                <!-- 승인 버튼 -->
                <a href="<%= request.getContextPath() %>/Admin_Controller?action=approveSchedule&schID=${schedule.schID}">승인</a>
                
                <!-- 수정 버튼 -->
                <a href="<%= request.getContextPath() %>/Admin_Controller?action=editSchedule&schID=${schedule.schID}">수정</a>
                
                <!-- 삭제 버튼 -->
                <a href="<%= request.getContextPath() %>/Admin_Controller?action=deleteSchedule&schID=${schedule.schID}">삭제</a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- 기타 관리자 기능 추가 가능 -->

</body>
</html>
