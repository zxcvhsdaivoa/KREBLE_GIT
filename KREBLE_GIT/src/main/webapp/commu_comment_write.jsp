<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="use_data.Db_method_commu"/>
<%@ page import="use_data.CommuCommentData"%>
<%
	CommuCommentData ccd = new CommuCommentData();
	ccd.setUser_id((String) session.getAttribute("ID"));
	ccd.setCommu_no(Integer.parseInt(request.getParameter("commu_no")));
	ccd.setCommuComment(request.getParameter("comment"));
	int insertCount = data.comment_write(ccd);
	
	if(insertCount>0){
		out.println("success");
	}
	else {
		out.println("fail");
	}
%>