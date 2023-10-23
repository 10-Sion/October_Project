<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
	String loginUser = (String) session.getAttribute("loginUser"); // 로그인한 사람의 email
	String rolename = (String) session.getAttribute("rolname");
	String sessionUser = (String) session.getAttribute("kakaoUser");
	
	// sessionUser 값이 없으면, loginUser 값으로 세션을 설정
	if (sessionUser == null || sessionUser.isEmpty()) {
		sessionUser = loginUser;
		session.setAttribute("loginUser", sessionUser);
	}
	
	System.out.println("subTop.jsp 에 저장된 세션 값 : " + sessionUser);

%>
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
        <a href="<%= request.getContextPath() %>/sub_Event/expo_AnNae.jsp" class="logo">
            <strong>취업 박람회</strong>
        </a>
        
        <nav>
        	<% if (sessionUser != null && !sessionUser.isEmpty()) { %>
                <a href="<%=contextPath %>/login/logOutFrom.do" ><strong><%=sessionUser %> 님 로그인 중</strong></a>
            <% } else { %>
                <a href="<%=contextPath %>/login/loginFrom.do" >로그인</a>
            <% } %>
            <a href="#menu">Menu</a>
        </nav>
    </header>

    <!-- Nav -->
    <nav id="menu">
        <ul class="links">
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_AnNae.jsp">메인</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_Info.jsp">박람회 개요</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_JulCha.jsp">참여 절차</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_SaJeon.jsp">사전 등록</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_JiDo.jsp">찾아오시는 길</a></li>
            <% if (rolename != null && rolename == "참가자"){%>
			<li><a href="<%= request.getContextPath() %>/Ann/attendeInfo.do">참가정보 수정</a></li>			
			<% } %>
        </ul>
        
        <ul class="links">
            <li><a href="<%=request.getContextPath()%>/Company/list.do">참여기업</a></li>
            <li><a href="<%=request.getContextPath()%>/Ann/list.do">공지사항</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Interview/in_application.jsp">온라인 면접</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Interview/in_schedule.jsp">면접 공고 신청</a></li>
            <li><a href="<%= request.getContextPath() %>/sub_Interview/in_admin.jsp">면접 관리자</a></li>
             <li><a href="<%= request.getContextPath() %>/sub_Interview/in_ex_application.jsp">박람회신청한 개인</a></li>
            <li><a href="<%=request.getContextPath()%>/QnA/QnAlist.do">자주하는 질문</a></li>
<%--        <li><a href="<%=request.getContextPath()%>/login/loginFrom.do">로그인</a></li> --%>
            <%-- 세션에 저장된 값이 있으면 로그아웃을 표시 --%>
            <% if (sessionUser != null && !sessionUser.isEmpty()) { %>
                <a href="<%=contextPath %>/login/logOutFrom.do" accesskey="6" title="">로그아웃</a>
            <% } else { %>
                <a href="<%=contextPath %>/login/loginFrom.do" accesskey="6" title="">로그인</a>
            <% } %>
            </li>
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