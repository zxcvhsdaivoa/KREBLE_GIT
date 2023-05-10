<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="use_data.Shop_reform_db"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제작의뢰서 등록</title>

	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
</head>
<body>
  	<jsp:useBean id="shop_db" class="use_data.Db_method_shop"/>
<% 
	Shop_reform_db ob = new Shop_reform_db();
	ob.setReid(request.getParameter("w_id"));
	ob.setRecata(request.getParameter("w_cata"));
	ob.setRequnt(Integer.parseInt(request.getParameter("w_qunt")));
	ob.setReprd(request.getParameter("w_prd"));
	ob.setRetrade(request.getParameter("w_trade"));
	ob.setRetitle(request.getParameter("w_title"));
	ob.setRetext(request.getParameter("w_text"));
	ob.setRedate(request.getParameter("w_date"));
	
	shop_db.board_input(ob);
	response.sendRedirect("shop_reform_board.jsp");
%>
</body>
</html>