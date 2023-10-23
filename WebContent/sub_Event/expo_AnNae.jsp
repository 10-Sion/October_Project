<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
	String path = request.getContextPath();
	String sessionUser = (String) session.getAttribute("loginUser");
	System.out.println("메인 세션 값 : " + sessionUser);
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=path %>/sub_Event/assets/css/main.css">
    <title>Binary by TEMPLATED</title>
</head>
<body>
    <jsp:include page="./subTop.jsp" />
    <!-- Banner -->
    <div class="bannerImg">
   			<img src="<%=path %>/sub_Event/images/expoBanner.png">
   	</div>
    <section id="banner">
        <div class="inner">
            <h1>예일 취업 박람회</h1>
            <ul class="actions">
                <li><a href="#one" class="button alt scrolly big">Continue</a></li>
            </ul>
        </div>
    </section>

    <!-- One -->
    <article id="one" class="post style1">
        <div class="image">
            <img src="<%=path%>/sub_Event/images/one.jpg" alt="" data-position="75% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="<%=path%>/sub_Event/expo_Info.jsp">박람회 개요</a></h2>
                </header>
                <p>
                    2주 동안 개최되는 취업 준비생들을 위한 온라인 박람회 입니다. 참가하셔서 여러 기업에 면접을 보고 일자리를 얻을 기회들을 찾아보세요.
                </p>
                <ul class="actions">
                    <li><a href="<%=path%>/sub_Event/expo_Info.jsp" class="button alt">Read More</a></li>
                </ul>
            </div>
            <div class="postnav">
                <a href="#" class="prev disabled"><span class="icon fa-chevron-up"></span></a>
                <a href="#two" class="scrolly next"><span class="icon fa-chevron-down"></span></a>
            </div>
        </div>
    </article>

    <!-- Two -->
<article id="two" class="post invert style1 alt">
    <div class="image">
        <img src="<%=path %>/sub_Event/images/sign.jpg" alt="" data-position="10% center" width="1400" height="788">
    </div>
    <div class="content">
        <div class="inner">
            <header>
                <h2><a href="<%=path %>/sub_Event/expo_JulCha.jsp">참여절차</a></h2>
            </header>
            <p>
                	참여절차를 확인 해보세요.
            </p>
            <ul class="actions">
                <li><a href="<%=path %>/sub_Event/expo_JulCha.jsp" class="button alt">Read More</a></li>
            </ul>
        </div>
        
        <div class="postnav">
	        <a href="#one" class="scrolly prev"><span class="icon fa-chevron-up"></span></a>
	        <a href="#three" class="scrolly next"><span class="icon fa-chevron-down"></span></a>
    	</div>
    </div>    
</article>

    <!-- Three -->
    <article id="three" class="post style2">
        <div class="image">
            <img src="<%=path %>/sub_Event/images/input.jpg" alt="" data-position="80% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="<%=path %>/sub_Event/expo_SaJeonApply.jsp">사전등록 신청</a></h2>
                </header>
                <p>
                    	사전등록을 클릭하시면 박람회에 참여하여 면접 진행의 혜택을 누릴 수 있습니다.
                </p>
                <ul class="actions">
                    <li><a href="<%=path %>/sub_Event/expo_SaJeonApply.jsp" class="button alt">사전등록 하러가기</a></li>
                </ul>
            </div>
            <div class="postnav">
                <a href="#two" class="scrolly prev"><span class="icon fa-chevron-up"></span></a>
                <a href="#four" class="scrolly next"><span class="icon fa-chevron-down"></span></a>
            </div>
        </div>
    </article>

    <!-- Four -->
    <article id="four" class="post invert style2 alt">
        <div class="image">
            <img src="<%=path %>/sub_Event/images/location.png" alt="" data-position="60% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="<%=path %>/sub_Event/expo_JiDo.jsp">찾아오시는 길</a></h2>
                </header>
                <ul class="actions">
                    <li><a href="<%=path %>/sub_Event/expo_JiDo.jsp" class=" button alt">위치 보기</a></li>
                </ul>
            </div>
            <div class="postnav">
                <a href="#three" class="scrolly prev"><span class="icon fa-chevron-up"></span></a>
                <a href="#five" class="scrolly next"><span class="icon fa-chevron-down"></span></a>
            </div>
        </div>
    </article>

    <!-- Five -->
    <article id="five" class="post style3">
        <div class="image">
            <img src="<%=path %>/sub_Event/images/Qna.jpg" alt="" data-position="5% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="<%=path %>/QnA/QnAlist.do">자주하는 질문</a></h2>
                </header>
                <p>
                    	참가자들이 자주 물어보시는 질문들 입니다. 박람회에 관하여 궁금하신 점이 있으시면 클릭하세요.
                </p>
                <ul class="actions">
                    <li><a href="<%=path %>/QnA/QnAlist.do" class="button alt">QnA</a></li>
                </ul>
            </div>
            <div class="postnav">
                <a href="#four" class="scrolly prev"><span class="icon fa-chevron-up"></span></a>
                <a href="#six" class="scrolly next"><span class="icon fa-chevron-down"></span></a>
            </div>
        </div>
    </article>

    <!-- Six -->
    <article id="six" class="post invert style3 alt">
        <div class="image">
            <img src="<%=path %>/sub_Event/images/companys.jpg" alt="" data-position="80% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2>참가 기업</h2>
                    <p class="info">전국의 우수한 기업들이 인재를 찾고 있습니다!</p>
                </header>
                <p>
      		국내의 여러 기업들이 박람회에 참여하였습니다. 더보기를 눌러 참가한 기업 목록을 확인해보세요
                </p>
                <ul class="actions">
                    <li><a href="<%=path%>/Company/list.do" class="button alt">Read More</a></li>
                </ul>
            </div>
            <div class="postnav">
                <a href="#five" class="scrolly prev"><span class="icon fa-chevron-up"></span></a>
                <a href="#" class="scrolly next disabled"><span class="icon fa-chevron-down"></span></a>
            </div>
        </div>
    </article>

    <!-- Footer -->
    <footer id="footer">
        <ul class="icons">
            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
        </ul>
    </footer>

</body>
</html>
