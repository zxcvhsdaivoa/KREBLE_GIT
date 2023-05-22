<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="vo.AlarmInfo"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="ect" class="use_data.Db_method_ECT"/>
<jsp:useBean id="alarm" class="svc.UserAlarmSelectListService"/>


<%
	String id = ect.login_check(request);
	ArrayList<AlarmInfo> ail =alarm.selectAlarm(id);

	
	for(int i=0; i<ail.size(); i ++){
		out.print(ail.get(i).getAlarm_view()+"/");
		out.print(ect.alarm_text(ail.get(i).getAlarm_type())+"/");
		out.print(ail.get(i).getAlarm_time()+"/");
		out.print(ail.get(i).getAlarm_pk()+";");
	}

%>