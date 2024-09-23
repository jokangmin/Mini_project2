<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body class = "main_window">
	<!-- header -->
    <jsp:include page="../main/header.jsp" />
    
    <!-- content -->    
	<jsp:include page="../main/content.jsp" />
	    
	<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script>
	//카드리스트 클릭 이벤트 js
    document.addEventListener('DOMContentLoaded', function () {
        const scrollContainer = document.querySelector('.scroll-container');
        const scrollContent = document.querySelector('.scroll-content');
        const leftBtn = document.querySelector('.left-btn');
        const rightBtn = document.querySelector('.right-btn');
        const cardWidth = document.querySelector('.card').offsetWidth + 16; // card + margin-right

        leftBtn.addEventListener('click', () => {
            scrollContainer.scrollLeft -= cardWidth;
        });

        rightBtn.addEventListener('click', () => {
            scrollContainer.scrollLeft += cardWidth;
        });
    });

</script>
</body>
</html>
