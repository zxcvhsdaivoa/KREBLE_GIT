<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="vo.AlarmInfo"%>
<jsp:useBean id="ect" class="use_data.Db_method_ECT"/>
<jsp:useBean id="alarm" class="svc.UserAlarmSelectOneService"/>
<jsp:useBean id="alarmview" class="svc.UserAlarmUpdateViewService"/>


<%
	String id = ect.login_check(request);
	int no = Integer.parseInt(request.getParameter("no"));
	AlarmInfo ail =alarm.selectAlarm(id,no);
	alarmview.updateView(id, no);
	
	out.print(ect.alarm_link(ail.getAlarm_type())+ail.getAlarm_no());

%>