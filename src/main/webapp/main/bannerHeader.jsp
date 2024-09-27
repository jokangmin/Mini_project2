<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="context" value="${pageContext.request.contextPath}" />    
<link rel="stylesheet" href="../css/bannertitle.css"> 


<h2 class="banner-title">
<a href="${ context }/index/index_main.do"><img id="logo" src="../image/odiga_logo.jpeg" alt="#" width="135" height="60"/></a>
오디가 배너 관리 페이지</h2>



<div class="banner-menu">
    <c:if test="${sessionScope.id != 'admin'}">
        <button class="btn-modern" onclick="location.href='${context}/member/memberLoginForm.do'">관리자 로그인</button>
    </c:if>

    <c:if test="${sessionScope.id == 'admin'}">
        <button class="btn-modern" onclick="location.href='${context}/main_admin/adminBannerInsertForm.do'">배너 추가하기</button>
        <button class="btn-modern" onclick="location.href='${context}/main_admin/adminMainBannerPrint.do'">메인 배너 관리</button>
        <button class="btn-modern" onclick="location.href='${context}/member/logout.do'">관리자 로그아웃</button>
        <button class="btn-modern" onclick="loadBanner3()">배너 목록</button> 
        <button class="btn-modern" onclick="location.href='adminBannerForm.do'">새로고침</button>
    </c:if>
</div>

<div id="bannerList3"></div>


     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/bannerList.js"></script>  
<script>
</script> 

