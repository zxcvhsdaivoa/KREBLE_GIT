<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="clup_rightside">
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
		
		if(clup.getClup_logo()!=null){ %>
				<div class="logo_wrap"><img src='clupLogo/<%=clup.getClup_logo()%>'></div>
			<%}else{ %>
				<div class="logo_wrap"><img src='image/img_logo.png' class='no_img'></div>
			<%} %>
			<span class="clup_name"><%=clup.getClup_name() %></span>
		</div>
</body>
</html>