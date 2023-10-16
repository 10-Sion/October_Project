<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>면접 신청</title>
</head>
<body>
    <h1>면접 신청</h1>

    <!-- 면접 신청 폼 -->
    <form action="in_Controller" method="post">
        <input type="hidden" name="action" value="apply">
        <label for="attendeeID">회원 ID:</label>
        <input type="text" name="attendeeID" required> <br>
        
        <label for="scheduleID">일정 ID:</label>
        <input type="text" name="scheduleID" required> <br><br>
        <input type="submit" value="신청하기">
    </form>
</body>
</html>
