<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
	<head>
		<tiles:insertAttribute name="head"/>
	</head>
	<body class="home-page is-dropdn-click">
		<tiles:insertAttribute name="loading"/>   
		<div class="hdr-wrap">
			<tiles:insertAttribute name="header"/> 
			<tiles:insertAttribute name="slide"/> 
		</div>
		<tiles:insertAttribute name="main"/>
		<tiles:insertAttribute name="footer"/>
		<tiles:insertAttribute name="wishlist"/> 
	</body>
	<script src="js/app.js"></script>
</html>


