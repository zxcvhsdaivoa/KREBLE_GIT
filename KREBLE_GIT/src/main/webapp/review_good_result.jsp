<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="use_data.ReviewData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 추천</title>
</head>
<jsp:useBean id="list" class="use_data.Db_method_rent" />
<%
	String num= request.getParameter("num");	
	list.db_good_count(num);
%>

<body>


</body>
</html>