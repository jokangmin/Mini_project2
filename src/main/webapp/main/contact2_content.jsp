<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header-placeholder"></div>

   <div id="container">
	<div class="snb">
		<h2>Contact</h2>
		<ul>
			<li><a href="${ pageContext.request.contextPath }/contact/contact_place.do">위치 및 연락처</a></li>
			<li id="select"><a href="${ pageContext.request.contextPath }/contact/contact_company.do">회사 연혁</a></li>
		</ul>
	</div><!-- snb -->
	
	<div id="content">
		<p class="locate">
			<a href="${ pageContext.request.contextPath }/index/index_main.do">Home</a> &gt;
			<a href="${ pageContext.request.contextPath }/contact/contact_place.do">Contact</a> &gt;
			<strong>회사 연혁</strong>
		</p>
		
		<h2>회사 연혁</h2>
		<section class="timeline">
		<img id="timeline_img" src="../image/trip_travel.jpeg" alt="연혁 이미지">
           <div class="event">
               <h2>창립과 초기 성장 (20XX년)</h2>
               <p>ODIGA는 김OO 대표에 의해 창립되었습니다. 여행을 사랑하는 창립자의 비전은 전 세계 사람들이 쉽게 여행 계획을 세우고, 즐길 수 있는 플랫폼을 만드는 것이었습니다. 창립 초기에는 주로 항공권 예약 서비스를 중심으로 사업을 시작했습니다.</p>
           </div>
           <div class="event">
               <h2>서비스 확장 (20XX-20XX년)</h2>
               <p>ODIGA는 항공권 예약 외에도 호텔 및 리조트 숙박 예약 서비스를 도입하며, 고객들에게 더 다양한 여행 옵션을 제공하기 시작했습니다. 또한 맛집 커뮤니티 서비스를 통해 고객들이 여행지에서의 맛집 정보를 쉽게 공유할 수 있게 되었습니다.</p>
           </div>
           <div class="event">
               <h2>여행 가이드 투어 서비스 도입 (20XX년)</h2>
               <p>ODIGA는 여행 가이드 투어 서비스를 도입하여 여행의 전반적인 경험을 더욱 풍부하게 만들었습니다. 현지 가이드와의 투어, 맞춤형 여행 코스 제공 등을 통해 고객들에게 깊이 있는 여행 경험을 제공하고 있습니다.</p>
           </div>
           <div class="event">
               <h2>글로벌 확장과 기술 혁신 (20XX-20XX년)</h2>
               <p>ODIGA는 글로벌 시장으로 확장하고 인공지능(AI) 및 빅데이터 기술을 도입하여 개인 맞춤형 여행 추천 서비스와 실시간 가격 비교 기능 등을 제공하기 시작했습니다.</p>
           </div>
           <div class="event">
               <h2>현재와 미래 (20XX년~현재)</h2>
               <p>ODIGA는 현재 수백만 명의 사용자를 보유한 글로벌 여행 플랫폼으로 성장하였으며, 지속 가능한 여행과 차세대 기술을 통해 고객 경험을 혁신하고 있습니다.</p>
           </div>
       </section>
		
	</div><!-- content -->
</div><!-- container -->