<%@page import="vo.ClupInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KREBLE 클럽</title>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/clup_style.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<body>
<jsp:include page="Header_baseform.jsp"/>
	<section>
		<div class="section_inner">
		<%
		ClupInfo clup =(ClupInfo) request.getAttribute("clup");
		
		out.println(clup.getClup_no());
		out.println(clup.getClup_name());
		%>
		



		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>