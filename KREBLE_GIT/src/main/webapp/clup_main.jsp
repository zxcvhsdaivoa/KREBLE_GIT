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
		<div class="section_inner clup_main">
			<jsp:useBean id="ud" class="use_data.Db_method_ECT"/>
			<%@ page import="vo.ClupInfo"%>
			<%@ page import="java.util.ArrayList"%>
			<%
			ArrayList<ClupInfo> cll = null;
			if(request.getAttribute("ClupList")!=null&&request.getAttribute("ClupList")!=""){
				cll=(ArrayList<ClupInfo>)request.getAttribute("ClupList");
			}
			%>
			
			
			<%
			if(cll!=null){
			%>
			<ul class="clup_list">
				<%
				for(int i=0; i<cll.size(); i++){
					String howjoin = cll.get(i).getClup_howjoin();
					howjoin=ud.howjoin(howjoin);
				%>
				<li>
					<a href="clup.do?command=room&clup_no=<%=cll.get(i).getClup_no()%>">
					<%
					if(cll.get(i).getClup_logo()!=null)
					{
						out.println("<div class='clupLogo'><img src='clupLogo/"+cll.get(i).getClup_logo()+"'></div>");
					}
					else {
						out.println("<div class='clupLogo'><img src='image/img_logo.png'></div>");
					}
					%>
						<span class="clup_name">클럽 명 : <%=cll.get(i).getClup_name() %></span>
						<span class="clup_admin">클럽 장 : <%=cll.get(i).getUser_id() %></span>
						<span class="clup_member_count">총 인원수 : <%=ud.select_clup_member_count(cll.get(i).getClup_no())%></span>
						<span class="clup_how_join">가입 방식 : <%=howjoin %></span>
					</a>
				</li>
				<%
				}
				%>
			</ul>
			<%
			}
			%>
			<a href="clup.do?command=clupmake" class="btn make_clup">클럽 만들기</a>
			
			<a href="clup.do?command=test">테스트</a>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>