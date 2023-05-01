<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
 <%@ page import="java.sql.*" %>
<%@ page import="use_data.ReviewData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 조회수 갱신</title>
</head>
<body>
<jsp:useBean id="update_result" class="use_data.Db_method_rent" />
<%
	ReviewData review_upda= new ReviewData();
	review_upda.setNum(Integer.parseInt(request.getParameter("NUM")));
	review_upda.setTitle(request.getParameter("TITLE"));
	review_upda.setPut(request.getParameter("WRITE"));
	review_upda.setRating(Integer.parseInt(request.getParameter("RATING"))); 
	update_result.db_review_update(review_upda);
	response.sendRedirect("rent_review.jsp");
%>
</body>
</html>