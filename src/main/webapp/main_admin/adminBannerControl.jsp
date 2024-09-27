<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">   
    <title>ODIGA</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/banner.css">
    <link rel="icon" href="../image/odiga_logo.jpeg" type="image/jpeg" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    
    <style>
     #button{margin:15px 400px;}
    </style>
    
</head>
<body class="main_window">
    <!-- Header -->
    <jsp:include page="../main/bannerHeader.jsp" />
    <jsp:include page="../main/bannerimage.jsp" />

	<div id= "button" >
    <input type="button" value="배너 목록" id="bannerlistbutton" onclick="bannerlist()" class="modern-button">
	</div>
 
    <div id="bannerContainer"></div>

   
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function bannerlist() {
            $("#bannerContainer").load("imagebannerboardList.jsp"); // Load content dynamically
        }
    </script>
</body>
</html>