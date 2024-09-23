<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-Travel-Hotel</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/travel1.css">
<link rel="icon" href="../images/odiga_logo.jpeg" type="../image/gif" />
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
				<li><a href="${ context }/travel/travel2.do">맛집</a></li>
				<li><a href="${ context }/travel/travel3.do">관광</a></li>
				<li id="select"><a href="${ context }/travel/travel4.do">숙소</a></li>
			</ul>
		</div><!-- snb -->
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/travel/travel1.do">Travel</a> &gt;
				<strong>숙소</strong>
			</p>
			
			<h2>🏠 호텔 및 리조트</h2>
			
			<section class="hotel-list">
	            
	            <div class="hotel-card">
	                <img src="../image/hotel2.jpeg" alt="힐튼 호텔">
	                <div class="hotel-info">
	                    <h3>힐튼 호텔</h3>
	                    <p>위치: 서울</p>
	                    <p>별점: ⭐⭐⭐⭐</p>
	                    <p>₩290,000 / 1박</p>
	                    <a href="#" class="book-now">지금 예약</a>
	                    <p><strong>주소:</strong> 서울특별시 강남구 테헤란로 123</p>
	                    <p><strong>시설:</strong> 무료 Wi-Fi, 수영장, 스파</p>
	                    <p><strong>리뷰:</strong> "훌륭한 서비스와 편안한 숙소입니다. 추천합니다!"</p>
	                </div>
	            </div>
	            <div class="hotel-card">
	                <img src="../image/hotel1.jpeg" alt="호텔 2">
	                <div class="hotel-info">
	                    <h3>파르지아 호텔</h3>
	                    <p>위치: 부산</p>
	                    <p>별점: ⭐⭐⭐</p>
	                    <p>₩250,000 / 1박</p>
	                    <a href="#" class="book-now">지금 예약</a>
	                    <p><strong>주소:</strong> 부산광역시 해운대구 우동 456</p>
                   	 	<p><strong>시설:</strong> 무료 Wi-Fi, 조식 포함</p>
                    	<p><strong>리뷰:</strong> "좋은 위치와 합리적인 가격, 만족스러운 숙박 경험."</p>
	                </div>
	            </div>
	            <div class="hotel-card">
	                <img src="../image/hotel3.jpeg" alt="호텔 3">
	                <div class="hotel-info">
	                    <h3>엘레강스 호텔</h3>
	                    <p>위치: 제주도</p>
	                    <p>별점: ⭐⭐⭐⭐⭐</p>
	                    <p>₩920,000 / 1박</p>
	                    <a href="#" class="book-now">지금 예약</a>
	                    <p><strong>주소:</strong> 제주특별자치도 제주시 애월읍 789</p>
                    	<p><strong>시설:</strong> 바다 전망, 레스토랑, 무료 주차</p>
                    	<p><strong>리뷰:</strong> "아름다운 바다 전망과 훌륭한 시설, 강력 추천!"</p>
	                </div>
	            </div>
	            <div class="hotel-card">
	                <img src="../image/hotel4.jpeg" alt="호텔 4">
	                <div class="hotel-info">
	                    <h3>베이직 호텔</h3>
	                    <p>위치: 인천</p>
	                    <p>별점: ⭐⭐⭐</p>
	                    <p>₩180,000 / 1박</p>
	                    <a href="#" class="book-now">지금 예약</a>
	                    <p><strong>주소:</strong> 인천광역시 송도동 321</p>
                    	<p><strong>시설:</strong> 피트니스 센터, 무료 Wi-Fi</p>
                    	<p><strong>리뷰:</strong> "편리한 위치와 좋은 서비스, 적당한 가격."</p>
	                </div>
	            </div>
	            <div class="hotel-card">
	                <img src="../image/revato.jpg" alt="호텔 5">
	                <div class="hotel-info">
	                    <h3>성심당 호텔</h3>
	                    <p>위치: 대전</p>
	                    <p>별점: ⭐⭐⭐⭐</p>
	                    <p>₩85,000 / 1박</p>     
	                    <a href="#" class="book-now">지금 예약</a>
	                    <p><strong>주소:</strong> 대전광역시 중구 중앙로 654</p>
                   	 	<p><strong>시설:</strong> 무료 Wi-Fi, 비즈니스 센터</p>
                    	<p><strong>리뷰:</strong> "좋은 위치와 친절한 직원, 편안한 숙소."</p>
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