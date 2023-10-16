<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>면접 일정 관리 페이지</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
    <h1>면접 일정 관리 페이지</h1>

    <!-- 여기에 면접 일정 정보를 나열하는 코드 추가 -->
    <h2>면접 일정 정보</h2>
    <table>
        <tr>
            <th>일정 ID</th>
            <th>면접 날짜</th>
            <th>면접 시간</th>
            <th>회사 ID</th>
            <th>액션</th>
        </tr>
        <!-- 면접 일정 정보를 표로 나열 -->
        <c:forEach var="schedule" items="${schedules}">
            <tr>
                <td>${schedule.schID}</td>
                <td>${schedule.intvwDate}</td>
                <td>${schedule.intvwTime}</td>
                <td>${schedule.coID}</td>
                <td>
                    <!-- 기타 액션 추가 가능 -->
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- 면접 일정 추가 양식 -->
    <h2>면접 일정 추가</h2>
    <form action="<%= request.getContextPath() %>/In_Controller" method="post">
        <input type="hidden" name="action" value="addSchedule">
        <label for="intvwDate">면접 날짜:</label>
        <input type="date" id="intvwDate" name="intvwDate" required>
        <label for="intvwTime">면접 시간 (시:분):</label>
		<input type="time" id="intvwTime" name="intvwTime" step="60" required>

        <label for="coID">회사 ID:</label>
        <input type="text" id="coID" name="coID" required>
        <input type="submit" value="추가">
    </form>

    <!-- 오류 메시지 표시 -->
    <c:if test="${not empty param.error}">
        <p style="color: red">${param.error}</p>
    </c:if>

    <!-- 기타 면접 일정 관련 기능 추가 가능 -->
</body>
</html>
