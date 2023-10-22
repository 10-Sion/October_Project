<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
	String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/main.css">
    <title>Binary by TEMPLATED</title>
</head>
<body>
    <jsp:include page="./subTop.jsp"/>
    <!-- Banner -->
    <div class="bannerImg">
   			<img src="images/expoBanner.png">
   	</div>
    <section id="banner">
        <div class="inner">
            <h1>취업 박람회</h1>
            <ul class="actions">
                <li><a href="#one" class="button alt scrolly big">Continue</a></li>
            </ul>
        </div>
    </section>

    <!-- One -->
    <article id="one" class="post style1">
        <div class="image">
            <img src="images/pic14.jpg" alt="" data-position="75% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="generic.html">박람회 안내</a></h2>
                    <p class="info"> 2주간 진행되는  <a href="#">박람회 개요</a></p>
                </header>
                <p>
					새로운 기회를 발견하고, 다양한 기업과 연결될 수 있는  
				</p>
                <ul class="actions">
                    <li><a href="generic.html" class="button alt">Read More</a></li>
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
        <img src="images/pic13.jpg" alt="" data-position="10% center" width="1400" height="788">
    </div>
    <div class="content">
        <div class="inner">
            <header>
                <h2><a href="generic.html">참여 절차</a></h2>
                <p class="info"> <a href="#">사전 안내</a></p>
            </header>
            <p>
				준비물 및 진행 절차 안내
            </p>
            <ul class="actions">
                <li><a href="generic.html" class="button alt">Read More</a></li>
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
            <img src="images/pic12.jpg" alt="" data-position="80% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="generic.html">면접 안내</a></h2>
                    <p class="info">온라인 신청과 <a href="#">면접 접수</a></p>
                </header>
                <p>
					사전 및 면접 접수 안내
                </p>
                <ul class="actions">
                    <li><a href="generic.html" class="button alt">Read More</a></li>
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
            <img src="images/pic14.jpg" alt="" data-position="60% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="generic.html"> 찾아오시는 길</a></h2>
                <p class="info">  <a href="#">박람회 장소</a></p>
                </header>
                <p>
                    지도와 주소 안내
                </p>
                <ul class="actions">
                    <li><a href="generic.html" class=" button alt">Read More</a></li>
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
            <img src="images/pic13.jpg" alt="" data-position="5% center" width="1400" height="788">
        </div>
        <div class="content">
            <div class="inner">
                <header>
                    <h2><a href="generic.html">커뮤니티</a></h2>
                    <p class="info">자주 묻는 사항과  <a href="#">공지사항</a></p>
                </header>
                <p>
					참여 전 변동사항과 궁금한 점에 대해
                </p>
                <ul class="actions">
                    <li><a href="generic.html" class="button alt">Read More</a></li>
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
            <img src="images/pic12.jpg" alt="" data-position="80% center" width="1400" height="788">
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
