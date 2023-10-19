<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    // 여기에 request.setCharacterEncoding("UTF-8")을 추가
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
    
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
        <input type="hidden" name="action" value="addAttendee">
    
    
    <label for="atndName">신청자 이름:</label>
        <input type="text" id="atndName" name="atndName" required><br><br>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="passwd">비밀번호:</label>
        <input type="password" id="passwd" name="passwd" required><br><br>
        
        <label for="expoID">참가 박람회:</label><br>
        <select name="expoID">
            <option value="" disabled selected>선택하세요.</option>
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

        <label for="coName">면접 기업:</label>
		<select name="coName">
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
	
    <!-- 기타 면접 신청 관련 기능 추가 가능 -->
</body>
</html>
