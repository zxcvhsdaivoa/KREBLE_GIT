<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
 <%@ page import="java.sql.*" %>
<%@ page import="use_data.ReviewData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="insert_result" class="use_data.Db_method_rent" />
<%
	ReviewData review_insr= new ReviewData();
	review_insr.setId(request.getParameter("ID"));
	review_insr.setTitle(request.getParameter("TITLE"));
	review_insr.setPut(request.getParameter("WRITE"));
	review_insr.setRating(Integer.parseInt(request.getParameter("RATING")));
	insert_result.db_review_insert(review_insr);
	response.sendRedirect("rent_review.jsp");
%>
</body>
</html>