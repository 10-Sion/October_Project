// 페이지 로드 후 1초 뒤에 스크롤링 시작
    setTimeout(function() {
        // 화면의 높이 계산
        var windowHeight = window.innerHeight;       
        // #banner의 하단 위치 계산
        var bannerBottom = $('#banner').offset().top + $('#banner').outerHeight();       
        // 스크롤 위치 계산
        var scrollTop = bannerBottom - windowHeight;
        
        // 스크롤 이동
        $('html, body').animate({
            scrollTop: scrollTop
        }, 1000); // 1초 동안 스크롤이 이동하도록 설정
    }, 1000); // 1초 후에 스크롤링 시작