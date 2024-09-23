<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header-placeholder"></div>
   <div id="container">
	<div class="snb">
		<h2>Contact</h2>
		<ul>
			<li id="select"><a href="${ pageContext.request.contextPath }/contact/contact_place.do">위치 및 연락처</a></li>
			<li><a href="${ pageContext.request.contextPath }/contact/contact_company.do">회사 연혁</a></li>
		</ul>
	</div><!-- snb -->
	
	<div id="content">
		<p class="locate">
			<a href="${ pageContext.request.contextPath }/index/index_main.do">Home</a> &gt;
			<a href="${ pageContext.request.contextPath }/contact/contact_place.do">Contact</a> &gt;
			<strong>위치 및 연락처</strong>
		</p>
		
		<h2>위치 및 연락처</h2>
		<div id="map_div">
			<div id="map" style="width:500px;height:400px;"></div>
			<p>📍 위치: <Strong>서울특별시 강남구 819 3 삼오빌딩 6층</Strong></p>
			<p>📞 전화번호: <Strong>02-3486-9600</Strong></p>
		</div>
		
	</div><!-- content -->
</div><!-- container -->