<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-TourPass</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/tour.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body class = "main_window">
	<!-- header -->
    <jsp:include page="../main/header.jsp" />
    
    <!-- content -->  
    <div id="container">
		<div class="snb">
			<h2>Fly/Tour</h2>
			<ul>
				<li><a href="${ context }/flyTour/fly1.do">해외 여행</a></li>
				<li><a href="${ context }/flyTour/fly2.do">국내 여행</a></li>
				<li id="select"><a href="${ context }/flyTour/tourPass.do">투어 패스</a></li>
			</ul>
		</div><!-- snb -->
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/flyTour/fly1.do">Fly/Tour</a> &gt;
				<strong>투어 패스</strong>
			</p>
			
			<h2>🗽 투어 패스️</h2>
			
			            <div class="tour-list">
                <div class="tour-card">
                    <img src="../image/seoul.jpg" alt="Tour Image 1">
                    <div class="tour-info">
                        <h3>서울 시티 투어</h3>
                        <p>서울의 주요 명소를 하루 만에 돌아보는 투어.</p>
                        <p><strong>₩150,000</strong></p>
                        <button class="buy-btn">구매하기</button>
                    </div>
                </div>
                
                <div class="tour-card">
                    <img src="../image/busan.jpg" alt="Tour Image 2">
                    <div class="tour-info">
                        <h3>부산 해안 투어</h3>
                        <p>부산의 아름다운 해안을 따라 즐기는 투어.</p>
                        <p><strong>₩120,000</strong></p>
                        <button class="buy-btn">구매하기</button>
                    </div>
                </div>
                
                <div class="tour-card">
                    <img src="../image/gz.jpg" alt="Tour Image 3">
                    <div class="tour-info">
                        <h3>경주 문화유산 투어</h3>
                        <p>한국의 역사를 느낄 수 있는 경주의 문화유산 투어.</p>
                        <p><strong>₩100,000</strong></p>
                        <button class="buy-btn">구매하기</button>
                    </div>
                </div>
                
                <div class="tour-card">
                    <img src="../image/jeju.jpg" alt="Tour Image 4">
                    <div class="tour-info">
                        <h3>제주도 자연 탐방</h3>
                        <p>제주도의 아름다운 자연을 탐방하는 투어.</p>
                        <p><strong>₩180,000</strong></p>
                        <button class="buy-btn">구매하기</button>
                    </div>
                </div>

                <div class="tour-card">
                    <img src="../image/gr.jpg" alt="Tour Image 5">
                    <div class="tour-info">
                        <h3>강릉 바다 투어</h3>
                        <p>강릉의 푸른 바다와 함께하는 힐링 투어.</p>
                        <p><strong>₩130,000</strong></p>
                        <button class="buy-btn">구매하기</button>
                    </div>
                </div>

                <div class="tour-card">
                    <img src="../image/jj.jpg" alt="Tour Image 6">
                    <div class="tour-info">
                        <h3>전주 한옥마을 투어</h3>
                        <p>전통의 멋을 느낄 수 있는 전주 한옥마을 투어.</p>
                        <p><strong>₩110,000</strong></p>
                        <button class="buy-btn">구매하기</button>
                    </div>
                </div>
            </div><!-- tour-list -->
			
		</div><!-- content -->
	</div><!-- container -->
    
    <!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
</body>
</html>