<%@page import="vo.ClupInfo"%>
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
		<div class="section_inner clup_join">
		<jsp:useBean id="ud" class="use_data.Db_method_ECT"/>
		<%
		ClupInfo clup =(ClupInfo) request.getAttribute("clup");
		
		String login_id="0";
		if(session.getAttribute("ID")!=null&& session.getAttribute("ID")!=""&& session.getAttribute("ID")!="null"){
			login_id=(String) session.getAttribute("ID");
		}
		%>
			<div class="clup_info">
			<%if(clup.getClup_logo()!=null){ %>
				<div class="logo_wrap"><img src='clupLogo/<%=clup.getClup_logo()%>'></div>
			<%}else{ %>
				<div class="logo_wrap"><img src='image/img_logo.png' class='no_img'></div>
			<%} %>
				<div class="clup_box">
					<span class="clup_name">클럽 명 : <%=clup.getClup_name() %></span>
					<span class="clup_admin">클럽 장 : <%=clup.getClup_user() %></span>
					<span class="clup_howjoin">가입 방식 : <%=ud.howjoin(clup.getClup_howjoin()) %></span>
					<span class="clup_member_count">총 인원수 : <%=ud.select_clup_member_count(clup.getClup_no())%></span>
					<span class="clup_makedate">생성일 : <%=ud.date_format(clup.getClup_makedate(),"yyyy-mm-dd hh:mm") %></span>
					<textarea class="no_line">클럽 소개 : <%if(clup.getClup_text()!=null&&clup.getClup_text()!=""){%><%=clup.getClup_text() %><%}else{ %>이 클럽은 소개문구가 없습니다<%} %></textarea>
				</div>
			</div>
			<form name="clupjoin" action="clupJoining.cl">
				<input type="hidden" name="no" value="<%=request.getParameter("clup_no")%>">
				<input type="hidden" name="how" value="<%=clup.getClup_howjoin()%>">
				<%if(clup.getClup_howjoin().equals("request")) {%><textarea class="join_text" name="join_text" placeholder="자신의 소개문구를 적어보세요!"></textarea><%}
				else if(clup.getClup_howjoin().equals("password")){ %><input type="password" name="pw" placeholder="비밀번호 일치시 가입됩니다"><%} %>
				<input type="submit" value="가입신청" class="btn <%if(clup.getClup_howjoin().equals("free")){%>freein<%}%>">
			</form>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>