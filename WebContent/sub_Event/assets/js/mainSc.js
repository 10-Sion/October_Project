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

// 마우스 휠 이동 처리(각 section 이동)
document.addEventListener('DOMContentLoaded', function () {
    const sections = document.querySelectorAll('.post'); // 섹션을 나타내는 클래스 선택자로 변경

    let currentSectionIndex = 0;
    let isThrottled = false;

    function scrollToSection(sectionIndex) {
        const position = sections[sectionIndex].offsetTop;
        window.scrollTo({
            top: position,
            behavior: 'smooth',
        });
    }

    document.addEventListener('wheel', (event) => {
        if (isThrottled) return;
        isThrottled = true;

        setTimeout(() => {
            isThrottled = false;
        }, 1000);

        const direction = event.deltaY > 0 ? 1 : -1;
        if (currentSectionIndex + direction >= 0 && currentSectionIndex + direction < sections.length) {
            currentSectionIndex += direction;
            scrollToSection(currentSectionIndex);
        }
    });
});
