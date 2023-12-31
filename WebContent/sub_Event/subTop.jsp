<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
	String loginUser = (String) session.getAttribute("loginUser"); // 로그인한 사람의 email
	String rolename = (String) session.getAttribute("rolename");
	String sessionUser = (String) session.getAttribute("kakaoUser");
	
	// sessionUser 값이 없으면, loginUser 값으로 세션을 설정
	if (sessionUser == null || sessionUser.isEmpty()) {
		sessionUser = loginUser;
		session.setAttribute("loginUser", sessionUser);
	}
	
	System.out.println("subTop.jsp 11에 저장된 세션 값 : " + loginUser);
	System.out.println("subTop.jsp 에 저장된 세션 이름 값 : " + rolename);

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
        		<strong><%=sessionUser %> 님 로그인 중</strong>
                <a href="<%=contextPath %>/login/logOutFrom.do" >로그아웃</a>
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
       
       <% if (!"관리자".equals(rolename)) { %>
        <li><a href="<%= request.getContextPath() %>/sub_Event/expo_SaJeonApply.jsp">사전 등록</a></li>
    <% } %>
       
            <li><a href="<%= request.getContextPath() %>/sub_Event/expo_JiDo.jsp">찾아오시는 길</a></li>
            <% if(  "참가자".equals(rolename)){%>
			<li><a href="<%= request.getContextPath() %>/Ann/Check.do">참가정보 수정</a></li>			
			<% } %>
        </ul>
        
        <ul class="links">
            <li><a href="<%=request.getContextPath()%>/Company/list.do">참여기업</a></li>
            <li><a href="<%=request.getContextPath()%>/Ann/list.do">공지사항</a></li>
           
           <% if (!"관리자".equals(rolename)) { %>
            <!-- 사용자가 관리자가 아닌 경우에만 이러한 메뉴 항목을 표시합니다 -->
            <% if (sessionUser != null && !sessionUser.isEmpty()) { %>
                <li><a href="<%= request.getContextPath() %>/sub_Interview/in_ex_application.jsp">개인 온라인 면접 신청</a></li>
            <% } else { %>
                <li><a href="<%= request.getContextPath() %>/sub_Interview/in_application.jsp">개인 온라인 면접 신청</a></li>
            <% } %>
            <li><a href="<%= request.getContextPath() %>/sub_Interview/in_schedule.jsp">기업 면접 공고 신청</a></li>
        <% } %>
            
            <% if (rolename != null && rolename == "관리자"){%>
			<li><a href="<%= request.getContextPath() %>/sub_Event/gwanlee_Index.jsp">참가자 관리</a></li>						
            <li><a href="<%= request.getContextPath() %>/sub_Interview/in_admin.jsp">면접 관리자</a></li>
            <% } %>
            
            

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