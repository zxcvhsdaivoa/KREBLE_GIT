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
	<jsp:useBean id="ud" class="use_data.Db_method_ECT"/>
	<%
		ClupInfo clup = null;
		if(request.getAttribute("clup")!=null&&request.getAttribute("clup")!=""){
			clup=(ClupInfo)request.getAttribute("clup");
		}
		ArrayList<ClupInfo> memberList=null;
		if(request.getAttribute("clup_member")!=null&&request.getAttribute("clup_member")!=""){
			memberList=(ArrayList<ClupInfo>)request.getAttribute("clup_member");
		}
	%>
		
		<jsp:include page="clup_LeftsideBaseform.jsp"/>
		
		<jsp:include page="clup_RightsideBaseform.jsp"/>
		
		<div class="section_inner clup_room">
				<%
				if(memberList==null){
					out.println("공개된 스쿼드가 없습니다");
				}
				else {
				%><table>
					<tr>
						<th class='width1'><a href="">
						등급<img class="_arrow" src="">
						</a></th>
						<th class='width2'>멤버</th>
						<th class='width1'><a href="">
						가입일<img class="_arrow" src="">
						</a></th>
						<th class='width1'><a href="">
						마지막 접속일<img class="_arrow" src="">
						</a></th>
						
					</tr>
				<%
					for(int i=0; i<memberList.size(); i++){
						out.println("<tr><td>"+memberList.get(i).getClup_rank()+"</td>");
						out.println("<td>"+memberList.get(i).getUser_id()+"</td>");
						out.println("<td>"+ud.date_format(memberList.get(i).getClup_date(),"yyyy-mm-dd")+"</td>");
						out.println("<td>"+ud.date_format(memberList.get(i).getClup_lastday(),"yyyy-mm-dd")+"</td></tr>");
						
					}%></table>
				<%} %>


			<form name="clup_chat">
				<textarea name="chat_box" id="chat_box" placeholder="채팅을 입력해주세요"></textarea>
				<input type="button" value="전송">
			</form>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>