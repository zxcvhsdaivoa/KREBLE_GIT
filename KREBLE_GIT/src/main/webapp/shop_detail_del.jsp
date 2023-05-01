<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="use_data.Shop_reform_db"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete title here</title>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
</head>
<body>
  	<jsp:useBean id="shop_db" class="use_data.Db_method_shop"/>
<%
	String r_id = request.getParameter("w_id");
	String r_num = request.getParameter("renum");
	String s_id = (String) session.getAttribute("ID");
	String ilc;
	if(r_id.equals(s_id)){
		ilc = "true";
		%>
		<script>
		alert("삭제되었습니다.");
		location.href = "shop_reform_board.jsp";
		</script>
		<%
		
		shop_db.dbdelete(r_num);
		
		
	}else{
		%>
		<script>
		alert("삭제할수 없습니다");
		location.href = "shop_reform_board.jsp";
		</script>
		<%
	}
	
	
	
	
%>
</body>
</html>