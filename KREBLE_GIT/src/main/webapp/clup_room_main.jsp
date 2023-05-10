<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KREBLE 클럽</title>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/clup_style.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<body>
<jsp:include page="Header_baseform.jsp"/>
	<section>
		<%@ page import="vo.ClupInfo"%>
	<%@ page import="java.util.ArrayList"%>
	<%
		ClupInfo clup = null;
		if(request.getAttribute("clup")!=null&&request.getAttribute("clup")!=""){
			clup=(ClupInfo)request.getAttribute("clup");
		}
	%>
		
		<jsp:include page="clup_LeftsideBaseform.jsp"/>
		
		<div class="section_inner clup_room">

			


			<form name="clup_chat">
				<textarea name="chat_box" id="chat_box" placeholder="채팅을 입력해주세요"></textarea>
				<input type="button" value="전송">
			</form>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>