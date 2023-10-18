<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="VO.ExpoInfoVO" %>
<%@ page import="DAO.ExpoInfoDAO" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page import="VO.CompanyVO" %>

<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<%String sessionUser = (String) session.getAttribute("loginUser"); %>
    <meta charset="UTF-8">
    <title>면접 신청 페이지</title>
   
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
    <h1>면접 신청 페이지</h1>

    <!-- 면접 신청 양식 -->
    <h2>면접 신청</h2>
    <form action="<%= request.getContextPath() %>/In_Controller" method="post">
    
    <label for="atndName">Attendee Name:</label>
        <input type="text" id="atndName" name="atndName" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="passwd">Password:</label>
        <input type="password" id="passwd" name="passwd" required><br><br>
        
        <label for="expoID">Select Expo:</label><br>
        <select name="expoID">
            <option value="" disabled selected>Select an Expo</option>
            <%
                ExpoInfoDAO expoInfoDAO = new ExpoInfoDAO();
                List<ExpoInfoVO> expoInfoList = expoInfoDAO.getAllExpos();
                for (ExpoInfoVO expo : expoInfoList) {
            %>
                <option value="<%= expo.getExpoID() %>"><%= expo.getExpoName() %></option>
            <%
                }
            %>
        </select>
    	<br><br>

        <label for="schID">면접 기업:</label>
		<select name="schID">
		    <%
		    CompanyDAO companyDAO = new CompanyDAO();
		    List<CompanyVO> companyList = companyDAO.getAllCompanies();
		    
		    for (CompanyVO company : companyList) {
		    %>
		        <option value="<%= company.getCoID() %>"><%= company.getCoName() %></option>
		    <%
		    }
		    %>
		</select>

        
        
       <br><br>
        <input type="submit" value="신청">
    </form>
	
    <!-- 기타 면접 신청 관련 기능 추가 가능 -->
</body>
</html>
