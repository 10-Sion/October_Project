<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="VO.AttendeeVO" %>
<%@ page import="DAO.AttendeeDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="VO.ExpoInfoVO" %>
<%@ page import="DAO.ExpoInfoDAO" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page import="VO.CompanyVO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 회원 개인 온라인 면접 신청</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp" />

    <h1>온라인 면접 신청</h1>

  <%
// 로그인한 사용자의 이메일을 세션에서 가져옵니다.
String userEmail = (String) session.getAttribute("loginUser");

// AttendeeDAO를 사용하여 참가자 정보를 가져옵니다.
AttendeeDAO attendeeDAO = new AttendeeDAO();
AttendeeVO attendee = attendeeDAO.getAttendeeByEmail(userEmail);
%>

<p>참가자명: <%= attendee.getAtndName() %></p>
<p>이메일: <%= attendee.getEmail() %></p>


	<!-- 아래 IntvwApplicant 테이블 저장 -->
    
    <form action="/ChuiUpExpo/In_Controller3" method="post">
    <input type="hidden" name="action" value="add_in_ex">
    <input type="hidden" name="userEmail" value="<%= userEmail %>">
 
        <label for="coName">면접 기업:</label>
		<select name="coName1">
		<option value="" disabled selected>선택하세요.</option>
		
		    <%
		    CompanyDAO companyDAO = new CompanyDAO();
		    List<CompanyVO> companyList = companyDAO.getAllCompanies();
		    
		    for (CompanyVO company : companyList) {
		    %>
		    
		    <!-- 사용자는 기업명을 선택하고, 값을 선택하면 해당 기업의 ID값을 받아 옴 -->
		        <option value="<%= company.getCoName() %>"><%= company.getCoName() %></option>
		    <%
		    }
		    %>
		</select> 

       <br><br>
        <input type="submit" value="신청">
    </form>
    
</body>
</html>
