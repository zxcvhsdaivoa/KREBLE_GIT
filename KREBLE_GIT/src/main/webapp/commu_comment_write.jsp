<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="use_data.Db_method_commu"/>
<jsp:useBean id="alarm" class="svc.UserAlarmInsertService"/>
<%@ page import="use_data.CommuCommentData"%>
<%@ page import="vo.AlarmInfo"%>
<%
	CommuCommentData ccd = new CommuCommentData();
	int no =Integer.parseInt(request.getParameter("commu_no"));
	ccd.setUser_id((String) session.getAttribute("ID"));
	ccd.setCommu_no(no);
	ccd.setCommuComment(request.getParameter("comment"));
	int insertCount = data.comment_write(ccd);
	
	AlarmInfo ai = new AlarmInfo();
	ai.setUser_id(request.getParameter("writer"));
	ai.setAlarm_no(no);
	boolean success = alarm.insertAlarm(ai, "commu_comment");
	if(insertCount>0){
		out.println("<script>");
		out.println("alert('댓글이 작성되었습니다')");
		out.println("location.href='community_borde.jsp?no="+no+"';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('댓글작성에 실패했습니다')");
		out.println("history.back()");
		out.println("</script>");
	}
%>
a