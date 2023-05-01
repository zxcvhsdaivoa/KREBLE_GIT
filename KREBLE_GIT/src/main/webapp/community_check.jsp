<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String doing= request.getParameter("do");
	out.println(doing);
	if(doing.equals("ck")){
		String id= (String) session.getAttribute("ID");
		if(id==null){
%>
			<script>
			alert("로그인 후 이용해주세요");
			location.href = "community.jsp?cate=all";
			</script>
<%
	    }
	    else {
			response.sendRedirect("community_write.jsp"); 
	    }
	}
	
	else if(doing.equals("writer")){
		String id= (String) session.getAttribute("ID");
	}
%>