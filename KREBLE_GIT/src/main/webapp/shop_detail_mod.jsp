<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_reform_db"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
</head>
<body>
  	<jsp:useBean id="shop_db" class="use_data.Db_method_shop"/>
<%
	Shop_reform_db ob = new Shop_reform_db();
	ob.setRenum(Integer.parseInt(request.getParameter("w_renum")));
	ob.setReid(request.getParameter("w_id"));
	ob.setRecata(request.getParameter("w_cata"));
	ob.setRequnt(Integer.parseInt(request.getParameter("w_qunt")));
	ob.setRetrade(request.getParameter("w_trade"));
	ob.setRetitle(request.getParameter("w_title"));
	ob.setRetext(request.getParameter("w_text"));
	ob.setRedate(request.getParameter("w_date"));
	
	shop_db.board_mody(ob);
	response.sendRedirect("shop_reform_board.jsp");
%>
</body>
</html>