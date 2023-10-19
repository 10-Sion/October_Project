<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=contextPath%>/sub_Event/assets/css/main.css">

</head>
<body>
	<!-- Header -->
    <header id="header">
        <a href="<%= request.getContextPath() %>/mainPage/index.jsp" class="logo">
            <strong>취업 박람회</strong>
        </a>
        <nav>
            <a href="#menu">Menu</a>
        </nav>
    </header>

    <!-- Nav -->
    <nav id="menu">
        <ul class="links">
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_AnNae.jsp">박람회 소개</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_JulCha.jsp">참여 절차</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_SaJeon.jsp">사전 등록</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_JiDo.jsp">찾아오시는 길</a></li>
        </ul>
        
        <ul class="links">
            <li><a href="<%=request.getContextPath()%>/Company/list.do">참여기업</a></li>
            <li><a href="generic.html">온라인 면접</a></li>
            <li><a href="elements.html">커뮤니티</a></li>
        </ul>
    </nav>
	
	
	    <!-- Scripts -->
    <script src="<%=contextPath%>/sub_Event/assets/js/jquery.min.js"></script>
    <script src="<%=contextPath%>/sub_Event/assets/js/jquery.scrolly.min.js"></script>
    <script src="<%=contextPath%>/sub_Event/assets/js/skel.min.js"></script>
    <script src="<%=contextPath%>/sub_Event/assets/js/util.js"></script>
    <script src="<%=contextPath%>/sub_Event/assets/js/main.js"></script>
</body>
</html>