<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-Fly2</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/fly.css">
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
				<li id="select"><a href="${ context }/flyTour/fly2.do">국내 여행</a></li>
				<li><a href="${ context }/flyTour/tourPass.do">투어 패스</a></li>
			</ul>
		</div><!-- snb -->
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/flyTour/fly1.do">Fly/Tour</a> &gt;
				<strong>국내 여행</strong>
			</p>
			
			<h2>️🛫 국내 항공권</h2>
			            <!-- 항공권 검색 섹션 -->
            <div class="search-box">
                <div class="top-inputs">
			        <input type="text" id="departure" placeholder="출발지" />
			        <input type="text" id="destination" placeholder="도착지" />
			    </div>
			    <div class="date-input">
			        <input type="date" id="departure-date" placeholder="출발일" />
			        <input type="date" id="return-date" placeholder="귀국일" />
			    </div>
			    <button onclick="filterFlights()">검색</button>
            </div>
            
                        <div class="flight-list" id="flight-list">
                <div class="flight-card" data-departure="서울" data-destination="제주" data-departure-date="2024-09-05" data-return-date="2024-09-12">
                    <div class="flight-details">
                        <img src="../image/airline_logo1.png" alt="항공사 로고">
                        <div class="flight-info">
                            <p><strong>KE1234</strong> | 대한항공</p>
                            <p>서울(GMP) → 제주(CJU)</p>
                            <p>출발: 10:00 | 도착: 11:00</p>
                        </div>
                    </div>
                    <div class="flight-price">₩80,000</div>
                </div>

                <div class="flight-card" data-departure="부산" data-destination="서울" data-departure-date="2024-09-10" data-return-date="2024-09-17">
                    <div class="flight-details">
                        <img src="../image/airline_logo6.png" alt="항공사 로고">
                        <div class="flight-info">
                            <p><strong>OZ5678</strong> | 아시아나항공</p>
                            <p>부산(PUS) → 서울(GMP)</p>
                            <p>출발: 12:00 | 도착: 13:10</p>
                        </div>
                    </div>
                    <div class="flight-price">₩70,000</div>
                </div>

                <div class="flight-card" data-departure="광주" data-destination="양양" data-departure-date="2024-09-15" data-return-date="2024-09-22">
                    <div class="flight-details">
                        <img src="../image/airline_logo4.png" alt="항공사 로고">
                        <div class="flight-info">
                            <p><strong>LJ1111</strong> | 진에어</p>
                            <p>광주(KWJ) → 양양(YNY)</p>
                            <p>출발: 15:00 | 도착: 16:20</p>
                        </div>
                    </div>
                    <div class="flight-price">₩65,000</div>
                </div>

                <div class="flight-card" data-departure="대구" data-destination="제주" data-departure-date="2024-09-07" data-return-date="2024-09-14">
                    <div class="flight-details">
                        <img src="../image/airline_logo2.png" alt="항공사 로고">
                        <div class="flight-info">
                            <p><strong>TW2020</strong> | 티웨이항공</p>
                            <p>대구(TAE) → 제주(CJU)</p>
                            <p>출발: 08:00 | 도착: 09:10</p>
                        </div>
                    </div>
                    <div class="flight-price">₩50,000</div>
                </div>

                <div class="flight-card" data-departure="서울" data-destination="울산" data-departure-date="2024-09-12" data-return-date="2024-09-19">
                    <div class="flight-details">
                        <img src="../image/airline_logo4.png" alt="항공사 로고">
                        <div class="flight-info">
                            <p><strong>LJ9900</strong> | 진에어</p>
                            <p>서울(GMP) → 울산(USN)</p>
                            <p>출발: 17:00 | 도착: 18:20</p>
                        </div>
                    </div>
                    <div class="flight-price">₩60,000</div>
                </div>

                <div class="flight-card" data-departure="청주" data-destination="제주" data-departure-date="2024-09-18" data-return-date="2024-09-25">
                    <div class="flight-details">
                        <img src="../image/airline_logo7.png" alt="항공사 로고">
                        <div class="flight-info">
                            <p><strong>7C3000</strong> | 제주항공</p>
                            <p>청주(CJJ) → 제주(CJU)</p>
                            <p>출발: 14:00 | 도착: 15:10</p>
                        </div>
                    </div>
                    <div class="flight-price">₩55,000</div>
                </div>
            </div>
		</div><!-- content -->
	</div><!-- container --> 
    
    <!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script>
    function filterFlights() {
        var departure = document.getElementById("departure").value.toLowerCase();
        var destination = document.getElementById("destination").value.toLowerCase();
        var departureDate = document.getElementById("departure-date").value;
        var returnDate = document.getElementById("return-date").value;

        var flightCards = document.getElementsByClassName("flight-card");

        for (var i = 0; i < flightCards.length; i++) {
            var card = flightCards[i];
            var cardDeparture = card.getAttribute("data-departure").toLowerCase();
            var cardDestination = card.getAttribute("data-destination").toLowerCase();
            var cardDepartureDate = card.getAttribute("data-departure-date");
            var cardReturnDate = card.getAttribute("data-return-date");

            if ((departure === "" || cardDeparture === departure) &&
                (destination === "" || cardDestination === destination) &&
                (departureDate === "" || cardDepartureDate === departureDate) &&
                (returnDate === "" || cardReturnDate === returnDate)) {
                card.style.display = "flex";
            } else {
                card.style.display = "none";
            }
        }
    }
</script>
</body>
</html>