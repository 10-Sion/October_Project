<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteCookie() { 
		var id = document.getElementById("cookie_id").value;
		var today = new Date();
		today.setTime(today.getTime() - 1*24*60*60*1000);
		document.cookie = escape(id)+"=; path=/; expires="+today.toUTCString()+";";
	}
	
	function getCookie() { 
		
		var id = document.getElementById("cookie_id").value;
		
		if(document.cookie.length != 0){  
			var id_idx = document.cookie.split('; ');
			
			for(var i=0; i<id_idx.length; i++){
				var arr = id_idx[i].split('=');
				if(id == arr[0]){
					document.getElementById("cookie_save").value = arr[1];
				}
			}
			
		}else{ 
			return 0; 
		} 
	}
	
	
	function setCookie(time) {
		var today = new Date(); 
		
		if(time == 'second'){
			today.setMilliseconds(30000); //30초
		}else{
			today.setTime(today.getTime() + 3*24*60*60*1000);
		}
		
		var id = document.getElementById("cookie_id").value;
		var val = document.getElementById("cookie_val").value;
		
		document.cookie = escape(id)+"="+escape(val)+"; path=/; expires="+today.toUTCString()+";";
		
	}
</script>
</head>
<body>
쿠키명<input type="text" id="cookie_id"><br>
쿠키값<input type="text" id="cookie_val"><br><br>
<button onclick="setCookie('second')">쿠키 저장(30초)</button>
<button onclick="setCookie('day')">쿠키 저장(3일)</button><br>
<button onclick="getCookie()">쿠키 값</button>
<button onclick="deleteCookie()">쿠키 삭제</button><br><br>
저장된 쿠키값<input type="text" id="cookie_save"><br>
</body>
</html>