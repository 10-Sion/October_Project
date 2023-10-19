<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%String sessionUser = (String) session.getAttribute("loginUser"); %>
    <meta charset="UTF-8">
    <title>신청 정보 수정</title>
</head>
<body>
<h1>일반 면접 신청 정보 수정</h1>

<%-- 신청 정보를 수정하기 위한 폼 --%>
<form action="<%= request.getContextPath() %>/In_Controller" method="post">
    <input type="hidden" name="action" value="updateApplicant">
    <input type="hidden" name="appID" value="${applicant.appID}">

    <label for="atndID">신청자 ID:</label>
    <input type="text" id="atndID" name="atndID" value="${applicant.atndID}" readonly><br>

    <label for="schID">일정 ID:</label>
    <input type="text" id="schID" name="schID" value="${applicant.schID}" readonly><br>

    <label for="status">신청 상태:</label>
    <input type="text" id="status" name="status" value="${applicant.status}"><br>

    <button type="submit">수정</button>
</form>

<%-- 기타 내용 추가 가능 --%>

</body>
</html>
