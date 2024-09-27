/*$(function(){
    let index = 0;
    let image = ['../image/BlueAirplaneCover.png','../image/main_b2.png','../image/main_b3.png']; //이미지 관리
	
	showslide();
	
    // 메뉴 숨기기
    $('ul.main_menu > li > .nav_link').hide();

    // 마우스 오버 시 메뉴 슬라이드 다운
    $('ul.main_menu > li').hover(function(){
        $(this).find('.nav_link').slideDown(300);
    },function(){
        $('.nav_link').slideUp(400);
    });

    // 왼쪽 화살표 클릭 시 이미지 넘기기
    $('.banner_img > a:first-child').click(function(){
        index--;
        if(index < 0){
            index = image.length - 1;
        }
        showslide();
    });

    // 오른쪽 화살표 클릭 시 이미지 넘기기
    $('.banner_img > a:last-child').click(function(){
        index++;
        if(index >= image.length){
            index = 0;
        }
        showslide();
    });

    // 5초마다 자동으로 이미지 변경
    setInterval(function(){
        index++;
        if(index >= image.length){
            index = 0;
        }
        showslide();
    }, 5000); // 5000ms = 5초

    // 슬라이드 이미지 변경 함수
    function showslide(){
        $('.banner_img').css({
            'background-image' : 'url(' + image[index] + ')'
        });
    }
	*/
	$('.custom-card2').click(function(){
		window.location.href = '/ODIGA_workspace/travel/travel4.do';
	});
/*});*/
