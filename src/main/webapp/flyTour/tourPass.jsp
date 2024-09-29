<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
<style type="text/css">
.pagination {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.pagination div {
    padding: 10px;
    border-radius: 5px; 
    transition: background-color 0.3s;
}

.pagination div:hover {
    background-color: rgba(255, 165, 0, 0.3);
    cursor: pointer;
}
</style>
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
				<c:forEach var="tour" items="${list}">
	                <div class="tour-card">
	                	<a href="${ context }/flyTour/tourDetail.do?tourId=Seoul" class="tour-link">
		                    <img src="${context}/storage/${tour.tourImage}" alt="Tour Image">
		                    <input type="hidden" name="seq" value="${tourDTO.seq}">
		                    <div class="tour-info">
		                        <h3>${tour.tourId}</h3>
                                <p><pre>${tour.description}</pre></p>
                                <p><strong>
								    <c:choose>
								        <c:when test="${not empty tour.price and tour.price.trim() ne ''}">
								            \<fmt:formatNumber value="${tour.price}" type="number" pattern="#,##0" />
								        </c:when>
								        <c:otherwise>
								            0
								        </c:otherwise>
								    </c:choose>
								</strong></p>
							</div>
						</a>
							<button class="buy-btn">구매하기</button>
	                </div>
                </c:forEach>

            </div><!-- tour-list -->
			
		</div><!-- content -->
	</div><!-- container -->
	
    <div class="pagination" >
		${tourListPaging.pagingHTML }
	</div>
	
    <!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script type="text/javascript">
function tourListPaging(pg){
	location.href = "${ context }/flyTour/tourPass.do?pg=" + pg;
}
</script>
</body>
</html>