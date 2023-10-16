<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>면접 일정 관리</title>
</head>
<body>
    <h1>면접 일정 관리</h1>

    <!-- 면접 일정 추가 폼 -->
    <h2>면접 일정 추가</h2>
    <form action="in_Controller" method="post">
        <input type="hidden" name="action" value="addSchedule">
        <label for="date">날짜:</label>
        <input type="date" name="date" required> <br>
        
        <label for="time">시간:</label>
        <input type="text" name="time" required> <br>
        
        <label for="companyID">회사 ID:</label>
        <input type="text" name="companyID" required> <br>
        
        <label for="expoID">박람회 ID:</label>
        <input type="text" name="expoID" required>
        <input type="submit" value="일정 추가">
    </form>

    <!-- 면접 일정 목록 -->
    <h2>면접 일정 목록</h2>
    <table>
        <tr>
            <th>일정 ID</th>
            <th>날짜</th>
            <th>시간</th>
            <th>회사 ID</th>
            <th>박람회 ID</th>
            <th>동작</th>
        </tr>
        <!-- 여기에 면접 일정 목록을 출력하는 로직 추가 -->
        <c:forEach var="schedule" items="${schedules}">
            <tr>
                <td>${schedule.schID}</td>
                <td>${schedule.intvwDate}</td>
                <td>${schedule.intvwTime}</td>
                <td>${schedule.coID}</td>
                <td>${schedule.expoID}</td>
                <td>
                    <a href="in_Controller?action=editSchedule&id=${schedule.schID}">수정</a>
                    <a href="in_Controller?action=deleteSchedule&id=${schedule.schID}">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
