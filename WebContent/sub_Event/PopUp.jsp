<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">

<style type="text/css">
	body {
	width=500;
	height=550;
}
</style>
</head>
<body>
	<section id="main">
		<div class="inner">
			<img src="<%=path%>/sub_Event/images/procedure.png" alt="" data-position="center" width="550" height="500" margin-bottom= "20px">
			
			<button>
				신청 바로가기
			</button>
		</div>
	</section>
</body>
</html>