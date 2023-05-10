<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<% request.setCharacterEncoding("utf-8"); %>
<% String id = (String) session.getAttribute("ID"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/shop_buy_list.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	
	
	
<title>구매기록</title>
</head>
<body>
    <!-- header -->
  
	<jsp:include page="Header_baseform.jsp"/>
	
	<!-- section -->
  
	<section>
		
		<!-- 구매기록 타이틀 -->
		<article id="bl_art_no1">
		</article>
		
		<!-- 구매기록 -->
		<article id="bl_art_no2">
			<div>주문일자</div>
			<div>구매리스트
				<div>구매리스트(테이블)</div>
				<div>주문취소</div>
			</div>	
		</article>
		
		<!-- 여분 -->
		<article id="bl_art_no3">
		</article>
	
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>