<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath %>/sub_Event/assets/css/main.css">
</head>
<style>

.tb_schedule {
    border-radius: 30px;
    overflow: hidden;
    background: #242424 top left repeat-y;
    background-size: cover;
}
table {	
    position: relative;
    width: 90%;
    min-width: min-content;
    border-spacing: 0;
    border-collapse: collapse;
    box-sizing: border-box;
}
 caption{
 	font-size: large;
 	text-align: left;
 
 
 }
body, table, div {
    font-family: 'FontAwesome';
	src: url('fonts/fontawesome-webfont.eot?v=3.0.1');
	src: url('fonts/fontawesome-webfont.eot?#iefix&v=3.0.1') format('embedded-opentype'),
	     url('fonts/fontawesome-webfont.woff?v=3.0.1') format('woff'),
	     url('fonts/fontawesome-webfont.ttf?v=3.0.1') format('truetype'),
	     url('fonts/fontawesome-webfont.svg#FontAwesome') format('svg');
	font-weight: normal;
	font-style: normal;
}
.tb_schedule th {
	text-align: center;
    background-color: #545454;
    color: #fff;
    position: relative;
    padding: 15px 2px 15px 30px;
    border: none;
    font-size: 16px;
    line-height: 1.4;
    word-break: keep-all;
}
.tb_schedule td span {
    display: block;
    padding: 5px 0;
    text-align: center;
    border-radius: 30px;
    color: #fff;
}
.tb_schedule td span.bg_color10 {
    background-color: #04B486;
}

.tb_schedule td span.bg_color01 {
    background-color: #00bfff;
}
.tb_schedule td span.bg_color02 {
    background-color: #e97ef0;
}
.tb_schedule td span.bg_color03 {
    background-color: #5f63ff;
}
.tb_schedule td span.bg_color04 {
    background-color: #967ef0;
}
.tb_schedule td span.bg_color05 {
    background-color: #50dfa9;
}
.tb_schedule td span.bg_color06 {
    background-color: #f9bd3b;
}
.tb_schedule td span.bg_color07 {
    background-color: #ff9072;
}
.tb_schedule td span.bg_color08 {
    background-color: #fecb70;
}
.tb_schedule td span.bg_color08 {
    background-color: #fecb70;
}.tb_schedule td span.bg_color09 {
    background-color: #999;
}
</style>
<body>
<jsp:include page="/sub_Event/subTop.jsp"/>
<section id="main">
<div class="inner">
<h2>일정표</h2>
<table class="tb_schedule">
    	 <colgroup>
              <col style="width:20%;">
              <col style="width:20%;">
              <col style="width:20%;">
              <col style="width:20%;">
              <col style="width:20%;">
          </colgroup>
          <thead>
              <tr>
                  <th>11.15 - 수</th>
                  <th>11.16 - 목</th>
                  <th>11.17 - 금</th>
                  <th>11.18 - 토</th>
                  <th>11.19 - 일</th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td colspan="1"><span class="bg_color01">개막식</span></td>
                  <td colspan="1"><span class="bg_color02">기업1</span></td>
                  <td colspan="1"><span class="bg_color10">기업2</span></td>
                  <td colspan="2"></td>
              </tr>
              <tr>
                  <td colspan="1"></td>
                  <td colspan="4"><span class="bg_color04">기업3</span></td>
              </tr>
              <tr>
                  <td colspan="1"></td>
                  <td colspan="3"><span class="bg_color05">기업4</span></td>
                  <td colspan="1"></td>
              </tr>
              <tr>
                  <td colspan="1"></td>
                  <td colspan="2"><span class="bg_color06">기업5</span></td>
                  <td colspan="2"></td>
              </tr>
              <tr>
                  <td colspan="1"></td>
                  <td colspan="4"><span class="bg_color07">기업10</span></td>
              </tr>
              <tr>
                  <td colspan="4"></td>
                  <td colspan="1"><span class="bg_color08">기업6</span></td>
              </tr>
              <tr>
                  <td colspan="4"></td>
                  <td colspan="1"><span class="bg_color09">기업7</span></td>
              </tr>
          </tbody>
      </table>
      </div>
      </section>
</body>
</html>