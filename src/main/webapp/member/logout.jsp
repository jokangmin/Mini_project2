<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	alert("로그아웃 되었습니다.");
	location.href = "${ pageContext.request.contextPath }/index/index_main.do";
}	
</script>
</body>
</html>