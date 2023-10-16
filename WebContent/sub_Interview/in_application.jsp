<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>면접 신청 페이지</title>
   
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
    <h1>면접 신청 페이지</h1>

    <!-- 여기에 면접 신청 정보를 나열하는 코드 추가 -->
    <h2>면접 신청 정보</h2>
    <table>
        <tr>
            <th>신청자 ID</th>
            <th>일정 ID</th>
            <th>상태</th>
            <th>액션</th>
        </tr>
        <!-- 면접 신청 정보를 표로 나열 -->
        <c:forEach var="applicant" items="${applicants}">
            <tr>
                <td>${applicant.atndID}</td>
                <td>${applicant.schID}</td>
                <td>${applicant.appStatus}</td>
                <td>
                    <!-- 기타 액션 추가 가능 -->
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- 면접 신청 양식 -->
    <h2>면접 신청</h2>
    <form action="<%= request.getContextPath() %>/In_Controller" method="post">
        <input type="hidden" name="action" value="addApplicant">
        <label for="atndID">신청자 ID:</label>
        <input type="text" id="atndID" name="atndID" required>
        <label for="schID">일정 ID:</label>
        <input type="text" id="schID" name="schID" required>
        <label for="appStatus">상태:</label>
        <input type="text" id="appStatus" name="appStatus" required>
        <input type="submit" value="신청">
    </form>
	
    <!-- 기타 면접 신청 관련 기능 추가 가능 -->
</body>
</html>
