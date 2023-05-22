<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="vo.AlarmInfo"%>
<jsp:useBean id="ect" class="use_data.Db_method_ECT"/>
<jsp:useBean id="alarm" class="svc.UserAlarmDeleteService"/>


<%
	String id = ect.login_check(request);
	int no = Integer.parseInt(request.getParameter("no"));
	boolean success = alarm.dlelteAlarm(id,no);
	
	out.print(success);

%>