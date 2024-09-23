<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to ODIGA!</title>
<link rel="stylesheet" href="../css/firstPage_ODIGA.css">
</head>
<body>
	<div class="background"></div>
    <div class="container">
        <div class="logo">
            <img src="../image/odiga_logo-removebg-preview.png" alt="ODIGA Logo">
        </div>
        <div class="message">
            <p class="loading-text">Welcome to ODIGA!</p>
            <p>여행을 즐기고, 떠나고, 남겨보세요.</p>
        </div>
        <div>
        	<a href="${ pageContext.request.contextPath }/index/index_main.do" id = "gobutton">Let's Go !</a>
        </div>
        <div class="footer">
            <p>&copy; 2024 ODIGA. All rights reserved.</p>
        </div>
    </div>
</body>
</html>