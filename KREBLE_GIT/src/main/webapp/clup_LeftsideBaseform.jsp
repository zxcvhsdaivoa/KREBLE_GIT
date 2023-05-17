<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="vo.ClupInfo"%>
	<%@ page import="java.util.ArrayList"%>
	<%
		ClupInfo clup = null;
		if(request.getAttribute("clup")!=null&&request.getAttribute("clup")!=""){
			clup=(ClupInfo)request.getAttribute("clup");
		}
		
		String login_id="0";
		if(session.getAttribute("ID")!=null&& session.getAttribute("ID")!=""&& session.getAttribute("ID")!="null"){
			login_id=(String) session.getAttribute("ID");
		}
	%>
		<div class="left_list">
			<ul>
				<li><a href="clup.do?command=room&clup_no=<%=clup.getClup_no()%>">클럽Main</a></li>
				<li><a href="clup.do?command=roommember&clup_no=<%=clup.getClup_no()%>">클럽 멤버 목록</a></li>
				<li><a href="clup.do?command=roomnotice&clup_no=<%=clup.getClup_no()%>">클럽 공지사항</a></li>
				<li><a href="#">클럽 채팅</a></li>
				<%if(login_id.equals(clup.getUser_id())){ %><li><a href="clup.do?command=roommanage&clup_no=<%=clup.getClup_no()%>">클럽 관리하기</a></li><%} %>
			</ul>
		</div>
</body>
</html>