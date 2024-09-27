<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="imagebannerboard.dao.ImagebannerboardDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    // DAO 인스턴스 생성
    ImagebannerboardDAO dao = ImagebannerboardDAO.getInstance();
    
    // 데이터 가져오기
    List<String> arraySeq = dao.getAllSeq(new HashMap<>());
    List<String> imageList = dao.getimage1(arraySeq);
    
    // request에 속성 설정
    request.setAttribute("imageList", imageList);
%>

<link rel="stylesheet" href="../css/main.css">

<style>

#leftarrow,#rightarrow {
    overflow-clip-margin: content-box;
    overflow: clip;
    width: 30px;
    aspect-ratio: auto 30 / 30;
    height: 30px;
}
</style>
<div class="banner_img">
    <a><img id="leftarrow" src="../image/left_arrow.png" alt="left" width="30" height="30"></a>
    <a><img id="rightarrow" src="../image/right_arrow.png" alt="right" width="30" height="30"></a>
</div>

<!-- 숨겨진 div에 이미지 주소 저장 -->
<div id="hiddenImages" style="display:none;">
    <c:forEach var="image" items="${imageList}">
        <span class="image-url">https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-133/storage/${image}</span>
    </c:forEach>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function() {
    let index = 0;
    let images = [
    ]; // 이미지 관리

    // 온라인 이미지 주소를 가져와서 배열에 추가
    $('#hiddenImages .image-url').each(function() {
        images.push($(this).text()); // 온라인 이미지 추가
    });

    showslide();

    // 메뉴 숨기기
    $('ul.main_menu > li > .nav_link').hide();

    // 마우스 오버 시 메뉴 슬라이드 다운
    $('ul.main_menu > li').hover(function() {
        $(this).find('.nav_link').slideDown(300);
    }, function() {
        $('.nav_link').slideUp(400);
    });

    // 왼쪽 화살표 클릭 시 이미지 넘기기
    $('.banner_img > a:first-child').click(function() {
        index--;
        if (index < 0) {
            index = images.length - 1;
        }
        showslide();
    });

    // 오른쪽 화살표 클릭 시 이미지 넘기기
    $('.banner_img > a:last-child').click(function() {
        index++;
        if (index >= images.length) {
            index = 0;
        }
        showslide();
    });

    // 5초마다 자동으로 이미지 변경
    setInterval(function() {
        index++;
        if (index >= images.length) {
            index = 0;
        }
        showslide();
    }, 5000); // 5000ms = 5초

    // 슬라이드 이미지 변경 함수
    function showslide() {
        $('.banner_img').css({
            'background-image': 'url(' + images[index] + ')',
            'background-size': 'cover' // 배경 크기 조절
        });
    }
});
</script>