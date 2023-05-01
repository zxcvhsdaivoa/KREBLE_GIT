<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id= (String) session.getAttribute("ID");
	out.println(id);

%>