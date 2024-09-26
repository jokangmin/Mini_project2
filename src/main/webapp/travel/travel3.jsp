<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-Travel-Tour</title>
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
				<li><a href="${ context }/travel/travel1.do">여행가이드</a></li>
				<li><a href="${ context }/travel/travel2.do?pg=1">맛집</a></li>
				<li id="select"><a href="${ context }/travel/travel3.do">관광</a></li>
				<li><a href="${ context }/travel/travel4.do">숙소</a></li>
			</ul>
		</div><!-- snb -->
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/travel/travel1.do">Travel</a> &gt;
				<strong>관광</strong>
			</p>
			
			<h2>🗺️ 오디가 핫플레이스??</h2>
			
			<section class="hotspots">
	            <!-- 서울 핫플레이스 -->
	            <div class="hotspot">
	                <div class="hotspot-content">
	                    <img src="../image/gyeongbokgung.jpg" alt="서울 핫플레이스" class="hotspot-image">
	                    <div class="hotspot-info">
	                        <h3>서울의 인기 명소</h3>
	                        <p>서울은 전통과 현대가 조화를 이루는 도시로, 다양한 명소가 있습니다. 주요 핫플레이스는 다음과 같습니다:</p>
	                        <ul>
	                            <li>경복궁 - 조선 왕조의 역사적인 궁궐</li>
	                            <li>북촌 한옥마을 - 전통 한국 건축과 문화를 체험할 수 있는 장소</li>
	                            <li>남산타워 - 서울 전경을 한눈에 볼 수 있는 전망대</li>
	                            <li>홍대 - 젊음과 창의성이 넘치는 거리 예술과 맛집의 중심지</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <!-- 제주 핫플레이스 -->
	            <div class="hotspot">
	                <div class="hotspot-content">
	                    <img src="../image/winter-landscape.jpg" alt="제주 핫플레이스" class="hotspot-image">
	                    <div class="hotspot-info">
	                        <h3>제주의 매력적인 명소</h3>
	                        <p>제주는 아름다운 자연경관과 독특한 문화로 유명합니다. 제주에서 꼭 가봐야 할 핫플레이스는:</p>
	                        <ul>
	                            <li>한라산 - 제주도의 중심이자 등산 명소</li>
	                            <li>성산 일출봉 - 환상적인 일출을 볼 수 있는 명소</li>
	                            <li>천지연 폭포 - 청량한 물소리와 아름다운 경관</li>
	                            <li>제주 올레길 - 제주도의 자연과 풍경을 즐길 수 있는 도보 여행 코스</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <!-- 후쿠오카 핫플레이스 -->
	            <div class="hotspot">
	                <div class="hotspot-content">
	                    <img src="../image/Xe2DsFgtzeQmkTADNBhziwV6MfGNB2Ck99CIEP8g__1690_1125.jpg" alt="후쿠오카 핫플레이스" class="hotspot-image">
	                    <div class="hotspot-info">
	                        <h3>후쿠오카의 인기 명소</h3>
	                        <p>후쿠오카는 일본의 현대와 전통이 어우러진 도시입니다. 후쿠오카의 핫플레이스는 다음과 같습니다:</p>
	                        <ul>
	                            <li>하카타 지역 - 후쿠오카의 중심 상업 지역</li>
	                            <li>오호리 공원 - 도심 속의 평화로운 공원</li>
	                            <li>후쿠오카 타워 - 도시 전경을 감상할 수 있는 높은 타워</li>
	                            <li>텐진 지역 - 쇼핑과 맛집이 밀집된 번화가</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <!-- 방콕 핫플레이스 -->
	            <div class="hotspot">
	                <div class="hotspot-content">
	                    <img src="../image/istockphoto-908027986-170667a.jpg" alt="방콕 핫플레이스" class="hotspot-image">
	                    <div class="hotspot-info">
	                        <h3>방콕의 인기 명소</h3>
	                        <p>방콕은 태국의 문화와 역사를 체험할 수 있는 다양한 장소가 있습니다. 방콕의 핫플레이스는:</p>
	                        <ul>
	                            <li>왕궁 - 태국의 왕실과 역사적 건축물</li>
	                            <li>와트 포 - 대불상이 있는 사원</li>
	                            <li>카오산 로드 - 여행자와 청춘들이 모이는 거리</li>
	                            <li>차이나타운 - 다양한 태국 전통 음식과 문화</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <!-- 런던 핫플레이스 -->
	            <div class="hotspot">
	                <div class="hotspot-content">
	                    <img src="../image/istockphoto-1370551107-612x612.jpg" alt="런던 핫플레이스" class="hotspot-image">
	                    <div class="hotspot-info">
	                        <h3>런던의 명소</h3>
	                        <p>런던은 역사적인 명소와 현대적인 문화가 공존하는 도시입니다. 런던의 핫플레이스는:</p>
	                        <ul>
	                            <li>버킹엄 궁전 - 영국 왕실의 공식 거주지</li>
	                            <li>타워 브리지 - 런던의 상징적인 다리</li>
	                            <li>대영 박물관 - 세계적인 박물관</li>
	                            <li>코벤트 가든 - 쇼핑과 거리 공연의 중심지</li>
	                        </ul>
	                    </div>
	                </div>
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