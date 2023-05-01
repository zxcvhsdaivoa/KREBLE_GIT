<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.sql.*"%>

<jsp:useBean id="data" class="use_data.Db_method_user"/>
<%@ page import="use_data.UserData"%>
<%
	UserData ud= new UserData();
	ud.setId(request.getParameter("uid"));
	ud.setName(request.getParameter("uname"));
	ud.setPw(request.getParameter("pw"));
	ud.setNick(request.getParameter("nick"));
	ud.setBirth(request.getParameter("birth"));
	ud.setGender((String) request.getParameter("gender"));
	String phsec=request.getParameter("ph_select");
	String[] ph_text=request.getParameterValues("ph_text");
	ud.setPh(phsec+"-"+ ph_text[0] +"-"+ph_text[1]);
	String[] emailarr=request.getParameterValues("email");
	ud.setEmail(emailarr[0] + "@" + emailarr[1]);
	String[] addresst=request.getParameterValues("address_text");
	ud.setAddress(addresst[0]+addresst[1]+addresst[2]+addresst[3]+addresst[4]);
	data.join_member_succass(ud);
%>
<%
RequestDispatcher dp=request.getRequestDispatcher("login.jsp");
dp.forward(request, response);
%>