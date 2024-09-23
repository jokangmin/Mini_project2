<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-Travel-Food</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/foodreview.css">
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
				<li id="select"><a href="${ context }/travel/travel2.do">맛집</a></li>
				<li><a href="${ context }/travel/travel3.do">관광</a></li>
				<li><a href="${ context }/travel/travel4.do">숙소</a></li>
			</ul>
		</div><!-- snb -->
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/travel/travel1.do">Travel</a> &gt;
				<strong>맛집</strong>
			</p>
			
			<h2>🍔 맛집은 어디??</h2>
			
			<p class="food">
				<img src="../image/food_main.png" alt="foodMain_image">
			</p>
			<br/>
			<div class="food_content">
				<h3 id="food_header">맛집 게시판</h3>
				<table class="custom-table">
				  	<thead>
					    <tr>
					      <th class="no">번호</th>
					      <th class="subject">제목</th>
					      <th class="id">작성자</th>
					      <th class="date">날짜</th>
					    </tr>
				  	</thead>
					<tbody>
					    
				  	</tbody>
				</table>
				총 게시물 수: <span></span>
			</div>
			<input type="button" value="글쓰기" id="review_add_button" />
		</div><!-- content -->
	</div><!-- container -->
	    
	<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script type="text/javascript" src="../js/reviewList.js"></script>
</body>
</html>