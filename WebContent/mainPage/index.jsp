<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String contextPath = request.getContextPath();
	String loginUser = (String) request.getAttribute("loginUser");
	String sessionUser = (String) session.getAttribute("loginUser");

	// sessionUser 값이 없으면, loginUser 값으로 세션을 설정
	if (sessionUser == null || sessionUser.isEmpty()) {
		sessionUser = loginUser;
		session.setAttribute("loginUser", sessionUser);
	}

	System.out.println("세션에 저장된 값: " + sessionUser);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title> 취업 박람회 </title>
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900%7CQuicksand:400,700%7CQuestrial" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    
    <link href="<%=request.getContextPath() %>/mainPage/css/default.css" rel="stylesheet" type="text/css" media="all">
    <link href="<%=request.getContextPath() %>/mainPage/css/fonts.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<div id="header-wrapper">
	    <div id="header" class="container">
	        <div id="logo">
	            <span class="icon icon-cog"></span>
	            <h1><a href="#">취업 박람회</a></h1>
	        </div>
	        <div id="menu">
	            <ul>
	                <li class="active"><a href="#" accesskey="1" title="">행사 안내</a>
	                    <ul class="sub-menu">
	                        <li><a href="../sub_Event/expo_AnNae.jsp"> 박람회 소개 </a></li>
	                        <li><a href="../sub_Event/expo_JulCha.jsp"> 참여 절차 </a></li>
	                        <li><a href="../sub_Event/expo_SaJeon.jsp"> 사전 등록 </a></li>
	                        <li><a href="../sub_Event/expo_JiDo.jsp"> 찾아오시는 길 </a></li>
	                    </ul>
	                </li>
	                <li><a href="#" accesskey="2" title="">참여 기업</a>
	                    <ul class="sub-menu">
	                        <li><a href="<%=request.getContextPath()%>/Company/list.do"> 기업 리스트 </a></li>
	                    </ul>
	                </li>
	                <li><a href="#" accesskey="3" title="">온라인 면접</a>
	                    <ul class="sub-menu">
	                        <li><a href="../sub_Interview/in_application.jsp"> 개인 온라인 면접 신청 </a></li>
	                        <li><a href="../sub_Interview/in_schedule.jsp"> 기업 온라인 면접 공고 신청 </a></li>
	                        <li><a href="../sub_Interview/in_admin.jsp"> 관리자: 기업 신청 승인 </a></li>
	                    </ul>
	                </li>
	                <li><a href="#" accesskey="4" title="">커뮤니티</a>
	                    <ul class="sub-menu">
	                        <li><a href="<%=request.getContextPath()%>/Ann/list.do"> 공지사항 </a></li>
<%-- 	                        <li><a href="<%=request.getContextPath()%>/QnA/QnAlist.do"> 자주 하는 질문 </a></li> --%>
	                        <li><a href="<%=request.getContextPath()%>/sub_Community/QnAboard.jsp"> 자주 하는 질문 </a></li>
	                    </ul>
	                </li>
	               
	               	<li>
	                <%-- 세션에 저장된 값이 있으면 로그아웃을 표시 --%>
	                <% if (sessionUser != null && !sessionUser.isEmpty()) { %>
	                    <a href="<%=request.getContextPath() %>/mainPage/logout.jsp" accesskey="6" title="">로그아웃</a>
	                <% } else { %>
	                    <a href="<%=request.getContextPath() %>/mainPage/login.jsp" accesskey="6" title="">로그인</a>
	                <% } %>
	                </li>
	               	
	            </ul>
	            
	        </div>
	        
	    </div>
	</div>
	
	<div class="wrapper">
	    <div id="banner" class="container"><img src="<%=request.getContextPath() %>/mainPage/images/banner.jpg" width="1200" height="500" alt=""></div>
	</div>

	<script src="<%=request.getContextPath() %>/mainPage/js/mainPageSC.js"></script>
</body>
</html>
