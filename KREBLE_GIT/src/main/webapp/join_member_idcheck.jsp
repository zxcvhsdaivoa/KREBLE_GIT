<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="data" class="use_data.Db_method_user"/>
<%@ page import="use_data.UserData"%>
<%
	String id = request.getParameter("ID");
	ArrayList<String> idList = data.join_member_idcheck();
	
	for (int i = 0; i < idList.size(); i++) {
		if (idList.get(i).equals(id)) {
			out.print("false"); 
			return;
		}

	}
	out.print("true");
%>