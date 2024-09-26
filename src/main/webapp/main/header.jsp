<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="context" value="${ pageContext.request.contextPath }" />          
<div class="main_index">
	<h1><a href="${ context }/index/index_main.do"><img src="../image/odiga_logo.jpeg" alt="#" width="135" height="60"/></a></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<ul class="main_menu">
		<li class="nav">
			<a href="${ context }/about/about.do">About</a>
			<ul class="nav_link">
				<li>
					<a href="${ context }/about/about.do">회사 개요</a>
				</li>
			</ul>
		</li>
		<li class="nav">
			<a href="${ context }/contact/contact1.do">Contact</a>
			<ul class="nav_link">
				<li>
					<a href="${ context }/contact/contact_place.do">위치 및 연락처</a>
				</li>
				<li>
					<a href="${ context }/contact/contact_company.do">회사 연혁</a>
				</li>
			</ul>
		</li>
		<li class="nav">
			<a href="${ context }/travel/travel1.do">Travel</a>
			<ul class="nav_link">
				<li>
					<a href="${ context }/travel/travel1.do">여행 가이드</a>
				</li>
				<li>
					<a href="${ context }/travel/travel2.do?pg=1">맛집</a>
				</li>
				<li>
					<a href="${ context }/travel/travel3.do">관광</a>
				</li>
				<li>
					<a href="${ context }/travel/travel4.do">숙소</a>
				</li>
			</ul>
		</li>
		<li class="nav">
			<a href="${ context }/flyTour/fly1.do">Fly/Tour</a>
			<ul class="nav_link">
				<li>
					<a href="${ context }/flyTour/fly1.do">해외 여행</a>
				</li>
				<li>
					<a href="${ context }/flyTour/fly2.do">국내 여행</a>
				</li>
				<li>
					<a href="${ context }/flyTour/tourPass.do">투어 패스</a>
				</li>
			</ul>
		</li>
		
		<!-- -------------------------- -->
		
		<c:if test="${ sessionScope.id == 'admin' }">
		<li clss="nav">
			<a href="${ context }/admin/adminMember.do">Admin Area</a>
			<ul class="nav_link">
				<li>
					<a href="${ context }/admin/adminMember.do">회원 관리</a>
				</li>
				<li>
					<a href="#">게시판 관리</a>
				</li>
				<li>
					<a href="#">문의 게시판 관리</a>
				</li>
				<li>
					<a href="#">배너 이미지 관리</a>
				</li>
			</ul>
		</li>
		</c:if>
	</ul>&nbsp;&nbsp;
	<div class="auth-buttons">
		<c:if test="${ sessionScope.id != null }">
	 		<a href="${ context }/member/logout.do" id="logout"><img src="../image/logout-icon.png" alt="logout_icon" width="23" height="23"/></a>
			<a href="${ context }/member/memberUpdate.do"><img src="../image/member_icon.png" alt="member_icon" width="23" height="23"/></a>
		</c:if>
		<c:if test="${ sessionScope.id == null }">
	 		<a href="${ context }/member/memberWriteForm.do" ><img src="../image/signup_icon.png" alt="signup_icon" width="23" height="23"/></a>
	     	<a href="${ context }/member/memberLoginForm.do" class="btn-8"><img src="../image/login_icon.png" alt="login_icon" width="23" height="23"/></a>
		</c:if>
	</div>  
</div>
<div id="menu_line"></div>
