<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.ExpoInfoVO" %>
<%@ page import="DAO.ExpoInfoDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Attendee</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>
    
    <h1>Add Attendee</h1>
    <form action="/ChuiUpExpo/Event?action=addAttendee" method="post">
    
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
</body>
</html>
