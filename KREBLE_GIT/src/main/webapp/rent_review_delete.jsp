<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<%@ page import="use_data.ReviewData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="delete_result" class="use_data.Db_method_rent" />
<%
	String num =request.getParameter("no");
	delete_result.db_review_delete(num);
	response.sendRedirect("rent_review.jsp");
%>
</body>
</html>