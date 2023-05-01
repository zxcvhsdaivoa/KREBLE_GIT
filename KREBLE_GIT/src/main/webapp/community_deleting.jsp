<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="use_data.Db_method_commu"/>
<%@ page import="use_data.CommunityData"%>
<%
	String comu_no = request.getParameter("no");
	String id = (String) session.getAttribute("ID");
	data.commu_delete(comu_no, id);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function(){
		alert("게시글 삭제가 완료되었습니다");
		location.href="community.jsp";
	})
</script>