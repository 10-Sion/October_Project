<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.ExpoInfoVO" %>
<%@ page import="DAO.ExpoInfoDAO" %>

<!DOCTYPE html>
<html>
<head>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="UTF-8">
    <title>SaJeon</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>
    
    <button id="showAttendeeForm">Attendee</button>
	<button id="showCompanyForm">Company</button>
    
    
    <div id="attendeeForm" style="display: none;">
    <form action="/ChuiUpExpo/Event?action=addAttendee" method="post">
    <h1>Add Attendee</h1>
    
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
        
        <input type="submit" value="Add Attendee">
        
    </form>
    </div>
    
    
    <!-- 기업 정보 입력 폼 -->
    <div id="companyForm" style="display: none;">
    <form action="/ChuiUpExpo/Event?action=addCompany" method="post">
    <h1>Add Company</h1>
    
        <label for="coName">Company Name:</label>
        <input type="text" id="coName" name="coName" required><br><br>
        
        <label for="coDetails">Company Details:</label>
        <input type="text" id="coDetails" name="coDetails" required><br><br>
        
        <label for="coTel">Company Tel:</label>
        <input type="text" id="coTel" name="coTel" required><br><br>
        
        <label for="coNumber">Company Number:</label>
        <input type="text" id="coNumber" name="coNumber" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="passwd">Password:</label>
        <input type="password" id="passwd" name="passwd" required><br><br>
        
        <label for="expoID">Select Expo:</label><br>
        <select name="expoID">
            <option value="" disabled selected>Select an Expo</option>
            <%
                for (ExpoInfoVO expo : expoInfoList) {
            %>
                <option value="<%= expo.getExpoID() %>"><%= expo.getExpoName() %></option>
            <%
                }
            %>
        </select>

    	<input type="submit" value="Add Company">
    </form>
    </div>
    
   	<script>
	   	$(document).ready(function() {
	   	    // Attendee 폼 표시
	   	    $("#showAttendeeForm").click(function() {
	   	        $("#attendeeForm").show();
	   	        $("#companyForm").hide();
	   	    });
	
	   	    // Company 폼 표시
	   	    $("#showCompanyForm").click(function() {
	   	        $("#attendeeForm").hide();
	   	        $("#companyForm").show();
	   	    });
	   	});
   	</script>
    	
</body>
</html>
