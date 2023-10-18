<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>면접 신청 페이지</title>
   
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
    <h1>면접 신청 페이지</h1>

    <!-- 면접 신청 양식 -->
    <h2>면접 신청</h2>
    <form action="<%= request.getContextPath() %>/In_Controller" method="post">
        <input type="hidden" name="action" value="addApplicant">
        <label for="atndID">신청자 ID:</label>
        <input type="text" id="atndID" name="atndID" required>
        <label for="schID">일정 ID:</label>
        <input type="text" id="schID" name="schID" required>
       
        <input type="submit" value="신청">
    </form>
	
    <!-- 기타 면접 신청 관련 기능 추가 가능 -->
</body>
</html>
