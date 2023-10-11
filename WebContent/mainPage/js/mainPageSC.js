$(document).ready(function () {
  // 초기에 모든 하위 리스트 숨김 처리
  $('ul ul').hide();
  $('.active ul').show();


  $('ul > li').on('click hover', function () {
    // .active 클래스가 적용된 상위 리스트에서 제거
    $('.active').removeClass('active');

    // 현재 클릭 또는 hover된 상위 리스트에 .active 클래스 추가
    $(this).addClass('active');
    $('ul ul').hide();

    $(this).find('ul').show();
  });
});
