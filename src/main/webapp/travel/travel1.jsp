<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-Travel-Guide</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/travel1.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body class = "main_window">
	<!-- header -->
    <jsp:include page="../main/header.jsp" />
    
    <!-- content -->    
   	 <div id="container">
		<div class="snb">
			<h2>Travel</h2>
			<ul>
				<li id="select"><a href="${ context }/travel/travel1.do">여행가이드</a></li>
				<li><a href="${ context }/travel/travel2.do?pg=1">맛집</a></li>
				<li><a href="${ context }/travel/travel3.do">관광</a></li>
				<li><a href="${ context }/travel/travel4.do">숙소</a></li>
			</ul>
		</div><!-- snb -->
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/travel/travel1.do">Travel</a> &gt;
				<strong>여행가이드</strong>
			</p>
			
			<h2>⛳️ 여행가이드</h2>
			
			<section class="guide">
	            <!-- 국내 투어 -->
	            <div class="tour">
	            	<img src="../image/seoul.jpg" alt="서울 시내 관광" class="tour-image">
	                <h3>🇰🇷 서울 시내 관광 투어</h3>
	                <p>서울의 주요 명소를 탐방하는 투어입니다. 경복궁, 북촌 한옥마을, 남산타워 등을 포함하며, 한국의 역사와 문화를 깊이 있게 이해할 수 있습니다.</p>
	                <ul>
	                    <li><strong>투어 시간:</strong> 9:00 AM - 5:00 PM</li>
	                    <li><strong>가격:</strong> 100,000 원</li>
	                    <li><strong>포함 사항:</strong> 가이드, 입장료, 점심</li>
	                    <li><strong>예약 방법:</strong> <a href="mailto:info@odiga.com">이메일로 예약하기</a></li>
	                </ul>
	            </div>
	            <div class="tour">
	            	<img src="../image/jeju.jpg" alt="제주도 자연 탐방" class="tour-image">
	                <h3>🏝️ 제주도 자연 탐방 투어</h3>
	                <p>제주도의 아름다운 자연을 탐험하는 투어입니다. 한라산, 성산 일출봉, 천지연 폭포 등을 포함하여 제주도의 자연경관을 감상할 수 있습니다.</p>
	                <ul>
	                    <li><strong>투어 시간:</strong> 8:00 AM - 6:00 PM</li>
	                    <li><strong>가격:</strong> 150,000 원</li>
	                    <li><strong>포함 사항:</strong> 가이드, 차량, 점심</li>
	                    <li><strong>예약 방법:</strong> <a href="mailto:info@odiga.com">이메일로 예약하기</a></li>
	                </ul>
	            </div>
	            <!-- 해외 투어 -->
	            <div class="tour">
	            	<img src="../image/fukuoka.jpg" alt="후쿠오카 문화 탐방" class="tour-image">
	                <h3>👺 후쿠오카 문화 탐방 투어</h3>
	                <p>후쿠오카의 전통과 현대를 탐방하는 투어입니다. 하카타 지역, 오호리 공원, 후쿠오카 타워 등을 포함하여 일본의 문화와 경관을 즐길 수 있습니다.</p>
	                <ul>
	                    <li><strong>투어 시간:</strong> 10:00 AM - 4:00 PM</li>
	                    <li><strong>가격:</strong> 120,000 원</li>
	                    <li><strong>포함 사항:</strong> 가이드, 입장료, 점심</li>
	                    <li><strong>예약 방법:</strong> <a href="mailto:info@odiga.com">이메일로 예약하기</a></li>
	                </ul>
	            </div>
	            <div class="tour">
	            	<img src="../image/bangkok.jpeg" alt="태국 방콕 시내 투어" class="tour-image">
	                <h3>🇹🇭 태국 방콕 시내 투어</h3>
	                <p>태국 방콕의 주요 명소를 방문하는 투어입니다. 왕궁, 와트 포, 카오산 로드 등을 포함하여 태국의 역사와 문화에 대해 배울 수 있습니다.</p>
	                <ul>
	                    <li><strong>투어 시간:</strong> 9:00 AM - 5:00 PM</li>
	                    <li><strong>가격:</strong> 140,000 원</li>
	                    <li><strong>포함 사항:</strong> 가이드, 입장료, 점심</li>
	                    <li><strong>예약 방법:</strong> <a href="mailto:info@odiga.com">이메일로 예약하기</a></li>
	                </ul>
	            </div>
	            <div class="tour">
	            	<img src="../image/london.jpg" alt="영국 런던 역사 투어" class="tour-image">
	                <h3>💂🏻 영국 런던 역사 투어</h3>
	                <p>런던의 역사적인 명소를 탐방하는 투어입니다. 버킹엄 궁전, 타워 브리지, 대영 박물관 등을 포함하여 영국의 역사와 문화를 경험할 수 있습니다.</p>
	                <ul>
	                    <li><strong>투어 시간:</strong> 10:00 AM - 6:00 PM</li>
	                    <li><strong>가격:</strong> 200,000 원</li>
	                    <li><strong>포함 사항:</strong> 가이드, 입장료, 점심</li>
	                    <li><strong>예약 방법:</strong> <a href="mailto:info@odiga.com">이메일로 예약하기</a></li>
	                </ul>
	            </div>
        	</section>
			
		</div><!-- content -->
	</div><!-- container -->
	    
	<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
</body>
</html>