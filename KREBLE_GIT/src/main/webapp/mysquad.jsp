<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="ud" class="use_data.Db_method_player"/>
<%@ page import="use_data.Player_Info"%>
<%@ page import="use_data.Director_Info"%>
<%@ page import="vo.SquadInfo"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>나만의 스쿼드</title>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link href="css/squad_style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/squad.js" ></script>

<body>
	
  <jsp:include page="Header_baseform.jsp"/>
	<section>
		<div class="section_inner">
			<div class="mysquad">
				<div class="squad_wrap"> 
				<%
					String login_id="0";
					if(session.getAttribute("ID")!=null&& session.getAttribute("ID")!=""&& session.getAttribute("ID")!="null"){
						login_id=(String) session.getAttribute("ID");
					}
					SquadInfo squad =null;
					squad = (SquadInfo) request.getAttribute("squad");
					boolean nullck = false;
					if(squad==null){
						nullck = false;
					}
					else if(squad.getUser_id()==null){
						nullck=false;
					}
					else {
						nullck = true;
					}
				%>
					<form class="squad_form" name="squad_form" action="squadSavePro.sq" method="post" onsubmit="return memberjoin()">
						<input type="hidden" id="user_id" name="user_id" value="<%= (String) session.getAttribute("ID")%> ">
						<ul>
							<%
							if(nullck==true){
							Director_Info director = ud.squad_director(squad);
							%>
							<li class="director">
								<input type="hidden" value="<%=director.getDirector_name()%>"name="director" id="director" class="squad_member">
								<img src="image/player_img/<%= director.getDirector_name() %>.jpg" class="player_image">
								<p class="ko_name"><%=director.getDirector_ko_name()%></p>
								<p class="eng_name"><%=director.getDirector_name()%></p>
								<%if(squad.getUser_id().equals(login_id)){%><span class="x_bu"></span><%} %>
							</li>
							<%
							} else{
							%>
							<li class="director">
								<input type="hidden" value="" name="director" id="director" class="squad_member">
								<img src="image/player_img/null_image.png" class="player_image">
								<p class="ko_name">감독</p>
								<p class="eng_name"></p>
								<span class="plus"></span>
							</li>
							<%
							}
							for(int i=1; i<=11; i++){
								if(nullck==true) {
								Player_Info player = ud.squad_player(squad, i);
							%> 
								<li class="player">
									<input type="hidden" value="<%= player.getPlayer_name() %>" name="player<%=i %>" id="player<%=i %>" class="squad_member">
									<img src="image/player_img/<%= player.getPlayer_name() %>.jpg" class="player_image">
									<p class="ko_name"><%= player.getPlayer_ko_name() %></p>
									<p class="eng_name"><%= player.getPlayer_name() %></p>
									<p class="posi on"><%= player.getPlayer_position() %></p>
									<%if(squad.getUser_id().equals(login_id)){%><span class="x_bu"></span><%} %>
								</li>
							<%
								}
								else {
							%>
								<li class="player">
									<input type="hidden" value="" name="player<%=i %>" id="player<%=i %>" class="squad_member">
									<img src="image/player_img/null_image.png" class="player_image">
									<p class="ko_name">선수<%=i %></p>
									<p class="eng_name"></p>
									<p class="posi"></p>
									<span class="plus"></span>
								</li>
							<%
								}
							}
							%>
							
						<%
						if(nullck==true){
						String forma = squad.getFormation();
						%>
						<script>forma_change("<%= forma %>");</script>
						<%}else{%><script>forma433();</script><%} %>
						</ul>
						<button type="button" class="open_squad">나의 스쿼드 불러오기</button>
						<label for="squad_name" class="blind">스쿼드의 이름을 입력하세요</label>
						<input type="text" <%if(nullck==true&&squad.getUser_id().equals(login_id)||nullck==false&&login_id!="0"){%>style="width:565px"<%}%> id="squad_name" name="squad_name" <% if(nullck==true){%> value="<%= squad.getSquad_name()%>" <%if(!squad.getUser_id().equals(login_id)){%>readonly<%} } %>>
						<%if(nullck==true&&squad.getUser_id().equals(login_id)||nullck==false&&login_id!="0"){ %><button type="submit" class="save_squad">스쿼드 저장</button><%} %>
						<span class="back"><a href="squad.sq">새 스쿼드 만들기</a></span>
						<span class="all_squad"><a href="squadList.sq">전체 스쿼드 목록</a></span>
						<label for="formation" class="blind" >포메이션</label>
						<select id="formation" name="formation" <%if(nullck==true){ if(!squad.getUser_id().equals(login_id)){ %> disabled <%}} %>>
							<option <%if(nullck==true){ if(squad.getFormation().equals("4-3-3")){ %>selected="selected"<% } } %>>4-3-3</option>
							<option <%if(nullck==true){ if(squad.getFormation().equals("4-2-3-1")){ %>selected="selected"<% } } %>>4-2-3-1</option>
							<option <%if(nullck==true){ if(squad.getFormation().equals("4-2-2-2")){ %>selected="selected"<% } } %>>4-2-2-2</option>
							<option <%if(nullck==true){ if(squad.getFormation().equals("4-1-2-3")){ %>selected="selected"<% } } %>>4-1-2-3</option>
							<option <%if(nullck==true){ if(squad.getFormation().equals("5-2-3")){ %>selected="selected"<% } } %>>5-2-3</option>
						</select>
						<%if(nullck==true){%><input type="hidden" id="squad_no" name="squad_no" value="<%= squad.getSquad_num() %>"><%} %>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="Footer_baseform.jsp"/>
	<div class="player_wrap sub_wrap">
		<div class="player_inner inner">
			<span class="exit">나가기</span>
			<div class="list_header">
				<ul>
					<li>All Players</li>
					<li>FW</li>
					<li>MF</li>
					<li>DF</li>
					<li>GK</li>
				</ul>	
			</div>
			<div class="player_list select_list">
				<ul>
				<%
				ArrayList<Player_Info> pl = ud.player();
				
				for(int i=0; i<pl.size(); i++) {
				%>
					<li>
						<span class="p_img"><img src="image/player_img/<%= pl.get(i).getPlayer_name() %>.jpg"></span>
						<p class="p_name"><span class="name_ko"><%= pl.get(i).getPlayer_ko_name() %></span><br><span class="name_eng"><%= pl.get(i).getPlayer_name() %></span></p>
						<p class="p_profile"><%= pl.get(i).getPlayer_birth() %><br><%= pl.get(i).getPlayer_gender() %></p>
						<p class="p_position"><%= pl.get(i).getPlayer_position() %></p>
					</li>
				<% }%>
				</ul>
			</div>
		</div>
	</div>
	<div class="director_wrap sub_wrap">
		<div class="director_inner inner">
			<span class="exit">나가기</span>
			<div class="director_box select_list">
				<ul>
				<%
				ArrayList<Director_Info> dl = ud.director();
				for(int i=0; i<dl.size(); i++) {
				%>
					<li>
						<span class="p_img"><img src="image/player_img/<%= dl.get(i).getDirector_name() %>.jpg"></span>
						<p class="p_name">이름 : <span class="name_ko"><%= dl.get(i).getDirector_ko_name() %></span>(<span class="name_eng"><%= dl.get(i).getDirector_name() %></span>)<br></p>
						<p class="p_profile">생일 : <%= dl.get(i).getDirecotr_birth() %><br>성별 : <%= dl.get(i).getDirector_gender() %><br>국적 : <%= dl.get(i).getDirector_nation() %></p>
					</li>
				<% }%>
				</ul>
			</div>
		</div>
	</div>
	<div class="mysquad_wrap sub_wrap">
		<div class="mysquad_inner inner">
			<span class="exit">나가기</span>
			
			<%
			ArrayList<SquadInfo> squadlist =null; 
			squadlist = (ArrayList<SquadInfo>) request.getAttribute("squadList");
			
			if(squadlist==null){
				out.println("저장된 스쿼드가 없습니다");
			}
			else {
			%>
			<div class="scroll_inner">
			<table id="mysquad_table">
				<thead>
					<tr>
						<th class='width1'>스쿼드 번호</th>
						<th class='width2'>스쿼드 이름</th>
						<th class='width1'>포메이션</th>
						<th class='width1'>공개 여부</th>
						<th class='width1'>공개 설정</th>
						<th class='width1'>삭제</th>
					</tr>
				</thead>
			<%
				for(int i=0; i<squadlist.size(); i++){
					out.println("<tr><td>"+squadlist.get(i).getSquad_num()+"</td>");
					out.println("<td><a href='squad.sq?no="+squadlist.get(i).getSquad_num()+"'>"+squadlist.get(i).getSquad_name()+"</a></td>");
					out.println("<td>"+squadlist.get(i).getFormation()+"</td>");
					out.println("<td class='dc'>"+squadlist.get(i).getDisclose()+"</td>");
					if(squadlist.get(i).getDisclose().equals("yes")){ 
						out.println("<td><div class='toggle_button yes' data-squadNo="+squadlist.get(i).getSquad_num()+" data-disclose="+squadlist.get(i).getDisclose()+"><span class='toggle'></span></div></td>");
					} else if(squadlist.get(i).getDisclose().equals("no")) {
						out.println("<td><div class='toggle_button no' data-squadNo="+squadlist.get(i).getSquad_num()+" data-disclose="+squadlist.get(i).getDisclose()+"><span class='toggle'></span></div></td>");
					}
					out.println("<td><span class='delete_squad' data-squadNo="+squadlist.get(i).getSquad_num()+">삭제하기</span></td></tr>");
				}
			}
			%>
			</table>
			</div>
		</div>
	</div>
</body>


</html>