<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">
<style>
	.

</style>
<body>			
	<jsp:include page="/sub_Event/subTop.jsp"/>
	<section id="main">
		<div class="inner">
			<div class="image fit">
				<img src="<%=path%>/sub_Event/images/pic11.jpg" alt="">
			</div>
	 <div style="margin-bottom: 15px;"></div>
	<img src="<%=path%>/sub_Event/images/Yeil.png" alt="" data-position="center" width="1000" height="1100" margin-bottom= "20px">
	</div>
	<jsp:include page="/sub_Event/Exo_Sch.jsp"/>
	</section>
	<footer id="footer">
	<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
		</ul>
	</footer>
	<div class="copyright">
		Made with: <a href="https://templated.co/">Templated.co</a>
	</div>
</body>
</html>