<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UnBlock</title>
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	alert("${message}");
	location.href = "${ pageContext.request.contextPath }/admin/adminMember.do";
}	
</script>
</body>
</html>