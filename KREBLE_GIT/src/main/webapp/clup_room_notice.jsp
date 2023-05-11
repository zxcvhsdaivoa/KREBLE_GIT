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
		
		ArrayList<ClupInfo> noticeList=null;
		if(request.getAttribute("clup_notice")!=null&&request.getAttribute("clup_notice")!=""){
			noticeList=(ArrayList<ClupInfo>)request.getAttribute("clup_notice");
		}
		
		String login_id="0";
		if(session.getAttribute("ID")!=null&& session.getAttribute("ID")!=""&& session.getAttribute("ID")!="null"){
			login_id=(String) session.getAttribute("ID");
		}
	%>
		
		
		<jsp:include page="clup_LeftsideBaseform.jsp"/>
		
		<jsp:include page="clup_RightsideBaseform.jsp"/>
		
		<div class="section_inner clup_room">
			<form name="clup_notice">
				<textarea name="notice" id="notice" placeholder="공지사항을 입력해주세요"></textarea>
				<input type="button" value="전송">
			</form>
			
			<ul>
			<%for(int i=0;i<noticeList.size();i++) {%>
				<li>
					<span>작성자 : </span>
					<span>작성일 : </span>
					<textarea><%=noticeList.get(i).getClup_text() %></textarea>
				</li>
			<%} %>
			</ul>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>