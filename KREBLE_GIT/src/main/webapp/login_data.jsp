<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="data" class="use_data.Db_method_user"/>
<%@ page import="use_data.UserData"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");

	String login = data.login_data(id,pw);
	
	if(login.equals("true")){
		session.setAttribute("ID",id);
		RequestDispatcher dp = request.getRequestDispatcher("index.jsp");
		dp.forward(request, response);
	}
	else if(login.equals("false")){
		request.setAttribute("login",login);
		RequestDispatcher dp = request.getRequestDispatcher("login.jsp");
		dp.forward(request, response);
	}
%>