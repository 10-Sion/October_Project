<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%String sessionUser = (String) session.getAttribute("loginUser"); %>
    <meta charset="UTF-8">
    <title>면접 일정 추가 페이지</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>

<br>
    <!-- 면접 일정 추가 양식 -->
    <h2>기업용 면접 일정 추가</h2>
    <form action="/ChuiUpExpo/In_Controller3" method="post">
        <input type="hidden" name="action" value="addSchedule">
        <label for="coID">기업 참가번호:</label>
        <input type="text" id="coID" name="coID" required> <br>
        <label for="intvwDate">면접 날짜:</label>
        <input type="date" id="intvwDate" name="intvwDate" required><br><br>
        <label for="intvwTime">면접 시간 (시:분):</label>
		<input type="time" id="intvwTime" name="intvwTime" step="60" required><br><br>

        
        <input type="submit" value="추가">
    </form>

    <!-- 오류 메시지 표시 -->
    <c:if test="${not empty param.error}">
        <p style="color: red">${param.error}</p>
    </c:if>

    <!-- 기타 면접 일정 관련 기능 추가 가능 -->
</body>
</html>

