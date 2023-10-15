// 세션에 저장된 값 가져오기
var sessionUser = "<%= sessionUser %>"; // JSP 변수를 JavaScript 변수에 할당
var loginLink = document.getElementById("loginLink");

// 세션에 값이 없으면 "로그인" 링크를 표시
if (sessionUser === null || sessionUser === "") {
    loginLink.style.display = "block";
}
// 세션에 값이 있으면 "로그인" 링크를 숨김
else {
    loginLink.style.display = "none";
}