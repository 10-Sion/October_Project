<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.1/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
    
    <link rel="stylesheet" href="css/firstPageStyle.css">
    
    <title>박람회 시작 페이지</title>
</head>
<body>
	<section>
		<p id="offscreen-text" class="offscreen-text"></p>
    	<p id="text" class="text"></p>
	
		<svg id="svg">
        
    	</svg>
    	
		<h1>홈페이지로</h1>
		<svg id="dark_mode" width="55" height="55" viewBox="0 0 55 55" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(320deg);">
			<path class="moon" d="M 27.5 0 C 34.791 0 41.79 2.899 46.945 8.055 C 33.991 9.89 26.93 20.209 26.93 27.5 C 26.93 34.791 33.689 45.261 46.945 46.945 C 41.79 52.101 34.791 55 27.5 55 C 20.209 55 13.21 52.101 8.055 46.945 C 2.899 41.79 0 34.791 0 27.5 C 0 20.209 2.899 13.21 8.055 8.055 C 13.21 2.899 20.209 0 27.5 0 Z" fill="#fee140"/>
			
		</svg>
		
	</section>

    <input type="hidden" class="input" id="input" />
    
   	<script src="js/firstPageSc.js"></script>
</body>
</html>
