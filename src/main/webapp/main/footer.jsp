<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="context" value="${ pageContext.request.contextPath }" />      
<br/><br/>
<div id="footer">
	<dl class="btmnav">
	<dt class = "blind">bottom navigation</dt>
		<dd><a href="${ context }/about/about.do">About</a></dd>
		<dd><a href="${ context }/contact/contact1.do">Contact</a></dd>
		<dd><a href="${ context }/travel/travel1.do">Travel</a></dd>
		<dd><a href="${ context }/flyTour/fly1.do">fly/Tour</a></dd>
	</dl>

  	<p class="copy">
	Copyright &copy; COMPANY Design<br>
	Powered by Webazit, e-mail : <a href="mailto:odiga@company.com>">odiga@company.com</a>
	</p>
</div>
