<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Attendee</title>
</head>
<body>
	<jsp:include page="subTop.jsp"/>
	
    <h1>Add Attendee</h1>
    <form action="/EventController?action=addAttendee" method="post">
    
        <label for="atndName">Attendee Name:</label>
        <input type="text" id="atndName" name="atndName" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="passwd">Password:</label>
        <input type="password" id="passwd" name="passwd" required><br><br>
        
        <input type="submit" value="Add Attendee">
        
    </form>
</body>
</html>
