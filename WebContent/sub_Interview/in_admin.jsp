<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>면접 관리자 페이지</title>
</head>
<body>
    <h1>면접 관리자 페이지</h1>

    <!-- 면접 일정 목록 표시 -->
    <h2>면접 일정 목록</h2>
    <table>
        <tr>
            <th>일정 ID</th>
            <th>일정 날짜</th>
            <th>일정 시간</th>
            <th>회사 ID</th>
            <th>박람회 ID</th>
            <th>상태</th>
            <th>액션</th>
        </tr>
        <c:forEach items="${schedules}" var="schedule">
            <tr>
                <td>${schedule.scheduleID}</td>
                <td>${schedule.scheduleDate}</td>
                <td>${schedule.scheduleTime}</td>
                <td>${schedule.companyID}</td>
                <td>${schedule.expoID}</td>
                <td>${schedule.status}</td>
                <td>
                    <a href="in_Controller?action=approve&scheduleID=${schedule.scheduleID}">승인</a>
                    <a href="in_Controller?action=reject&scheduleID=${schedule.scheduleID}">거절</a>
                    <a href="in_Controller?action=modify&scheduleID=${schedule.scheduleID}">수정</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
