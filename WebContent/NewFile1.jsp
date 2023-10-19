<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/ChuiUpExpo/In_Controller3" method="post">
	
		<input type="hidden" name="action" value="addAttendee">
	
		<select name="a">
			<option value="기업1">기업1</option>
			<option value="기업2">기업2</option>
			<option value="기업3">기업3</option>
		</select>
		
			
		<select name="b">
			<option value="기업4">기업1</option>
			<option value="기업5">기업5</option>
			<option value="기업6">기업6</option>
		</select>
		
		<input type="submit" value="전송">
	</form>
</body>
</html>