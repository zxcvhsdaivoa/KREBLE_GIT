<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vo.SquadInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 스쿼드 목록</title>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link href="css/squad_list_style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/squad_list.js"></script>
<body>
  <jsp:include page="Header_baseform.jsp"/>
	<section>
		<div class="section_inner">
			<div class="squad_list">
				<h3>전체 스쿼드 목록</h3>
				<span class="btn"><a href="squad.sq">스쿼드 만들러가기</a></span>
				<%
				//paging
				int page_no=1;
				int limit=15;
				if(request.getParameter("page")!=null){
					page_no=Integer.parseInt(request.getParameter("page"));
				}
				
				
				ArrayList<SquadInfo> allList =null; 
				allList = (ArrayList<SquadInfo>) request.getAttribute("List");
				
				//paging2
				int listCount =(int) request.getAttribute("count");
		   		int maxPage=(int)((double)listCount/limit+0.95); 
		   		int startPage = (((int) ((double)page_no / 10 + 0.9)) - 1) * 10 + 1;
		   	    int endPage = startPage+10-1;

		   		if (endPage> maxPage) endPage= maxPage;
		   		
		 	  	//orderby
				String[] order="notorder asc".split(" ");
				if(request.getParameter("order")!=null&&request.getParameter("order")!=""&&!request.getParameter("order").equals("")) {
					order = request.getParameter("order").split(" ");
				}
				
				//search
				String search="noSearch";
				String search_text="";
		   		if(request.getParameter("search_select")!=null&&request.getParameter("search_select")!=""){
				    search = request.getParameter("search_select");
				    if(search.equals("mysquad_name")) {
						search_text=request.getParameter("mysquad_name");
					}else if(search.equals("user_id")) {
						search_text=request.getParameter("user_id");
					}else if(search.equals("formation")) {
						search_text=request.getParameter("formation");
					}
				}
				
				if(allList==null){
					out.println("공개된 스쿼드가 없습니다");
				}
				else {
				%><table>
					<tr>
						<th class='width1'><a href="squadList.sq?<%if(order[0].equals("mysquad_no")&&order[1].equals("asc")){ %>order=mysquad_no+desc<%}else if(order[0].equals("mysquad_no")&&order[1].equals("desc")){ %><%}else if(!order[0].equals("mysquad_no")) {%>order=mysquad_no+asc<%}%>&page=1<%if(!search.equals("noSearch")){%>&search_select=<%=search %>&<%=search %>=<%=search_text %><%} %>">
						스쿼드 번호<img class="order_arrow" src="image/<%if(order[0].equals("mysquad_no")&&order[1].equals("asc")){ %>arrow2<%}else if(order[0].equals("mysquad_no")&&order[1].equals("desc")){ %>arrow1<%}else if(!order[0].equals("mysquad_no")) {%>arrow3<%}%>.png">
						</a></th>
						<th class='width1'>작성자</th>
						<th class='width2'>스쿼드 이름</th>
						<th class='width1'>포메이션</th>
						<th class='width1'><a href="squadList.sq?<%if(order[0].equals("view_count")&&order[1].equals("asc")){ %>order=view_count+desc<%}else if(order[0].equals("view_count")&&order[1].equals("desc")){ %><%}else if(!order[0].equals("view_count")) {%>order=view_count+asc<%}%>&page=1<%if(!search.equals("noSearch")){%>&search_select=<%=search %>&<%=search %>=<%=search_text %><%} %>">
						조회수<img class="order_arrow" src="image/<%if(order[0].equals("view_count")&&order[1].equals("asc")){ %>arrow2<%}else if(order[0].equals("view_count")&&order[1].equals("desc")){ %>arrow1<%}else if(!order[0].equals("view_count")) {%>arrow3<%}%>.png">
						</a></th>
						<th class='width1'><a href="squadList.sq?<%if(order[0].equals("make_date")&&order[1].equals("asc")){ %>order=make_date+desc<%}else if(order[0].equals("make_date")&&order[1].equals("desc")){ %><%}else if(!order[0].equals("make_date")) {%>order=make_date+asc<%}%>&page=1<%if(!search.equals("noSearch")){%>&search_select=<%=search %>&<%=search %>=<%=search_text %><%} %>">
						작성일<img class="order_arrow" src="image/<%if(order[0].equals("make_date")&&order[1].equals("asc")){ %>arrow2<%}else if(order[0].equals("make_date")&&order[1].equals("desc")){ %>arrow1<%}else if(!order[0].equals("make_date")) {%>arrow3<%}%>.png">
						</a></th>
					</tr>
				<%
					for(int i=0; i<allList.size(); i++){
						out.println("<tr><td>"+allList.get(i).getSquad_num()+"</td>");
						out.println("<td>"+allList.get(i).getUser_id()+"</td>");
						out.println("<td><a href='squad.sq?no="+allList.get(i).getSquad_num()+"'>"+allList.get(i).getSquad_name()+"</a></td>");
						out.println("<td>"+allList.get(i).getFormation()+"</td>");
						out.println("<td>"+allList.get(i).getView_count()+"</td>");
						out.println("<td>"+allList.get(i).getMake_date()+"</td></tr>");
						
					}%></table>
				<div class="paging">
				
					<%if(page_no<=1){ %>
					[이전]&nbsp;
					<%}else{ %>
					<a href="squadList.sq?page=<%=page_no-1%><%if(!search.equals("noSearch")){%>&search_select=<%=search %>&<%=search_text %><%} %><%if(!order[0].equals("notorder")){%>&order=<%=order[0]%>+<%=order[1] %><%}%>">[이전]</a>&nbsp;
					<%} %>
				
					<%for(int a=startPage; a<=endPage; a++){
						if(a==page_no){%>
						<span class="select">[<%=a %>]</span>&nbsp;
						<%}else{ %>
							<a href="squadList.sq?page=<%=a %><%if(!search.equals("noSearch")){%>&search_select=<%=search %>&<%=search %>=<%=search_text %><%} %><%if(!order[1].equals("notorder")){%>&order=<%=order[0]%>+<%=order[1] %><%}%>">[<%=a %>]</a>&nbsp;
						<%} %>
					<%} %>
				
					<%if(page_no>=maxPage){ %>
					[다음]
					<%}else{ %>
					<a href="squadList.sq?page=<%=page_no+1 %><%if(!search.equals("noSearch")){%>&search_select=<%=search %>&<%=search %>=<%=search_text %><%} %><%if(!order[0].equals("notorder")){%>&order=<%=order[0]%>+<%=order[1] %><%}%>">[다음]</a>
					<%
					}
				    }
					%>
				
				</div>
				<div class="search_box">
					<form name="search" action="squadList.sq">
						<input type="hidden" name="order" value="">
						<select name="search_select" id="search_select" class="search_select">
							<option value="mysquad_name" <%if(search.equals("mysquad_name")){ %>selected="selected"<%} %>>제목</option>
					    	<option value="user_id" <%if(search.equals("user_id")){ %>selected="selected"<%} %>>작성자</option>
							<option value="formation" <%if(search.equals("formation")){ %>selected="selected"<%} %>>포메이션</option>
						</select>
						<input type="text" name="mysquad_name" class="search_name search_text <%if(!search.equals("mysquad_name")&&!search.equals("noSearch")){ %>hide<%}%>" <%if(search.equals("mysquad_name")){ %>value=<%=search_text%><%} %>>
						<input type="text" name="user_id" class="search_user search_text <%if(!search.equals("user_id")){ %>hide<%}%>" <%if(search.equals("user_id")){ %>value=<%=search_text%><%} %>>
						<select name="formation" id="formation" class="search_formation <%if(!search.equals("formation")){ %>hide<%}%>">
							<option value="4-3-3" <%if(search.equals("formation")&&search_text.equals("4-3-3")){ %>selected="selected"<%} %>>4-3-3</option>
							<option value="4-2-3-1" <%if(search.equals("formation")&&search_text.equals("4-2-3-1")){ %>selected="selected"<%} %>>4-2-3-1</option>
							<option value="4-2-2-2" <%if(search.equals("formation")&&search_text.equals("4-2-2-2")){ %>selected="selected"<%} %>>4-2-2-2</option>
							<option value="4-1-2-3" <%if(search.equals("formation")&&search_text.equals("4-1-2-3")){ %>selected="selected"<%} %>>4-1-2-3</option>
							<option value="5-2-3" <%if(search.equals("formation")&&search_text.equals("5-2-3")){ %>selected="selected"<%} %>>5-2-3</option>
						</select>
						<input type="submit" value="검색" class="btn_search" >
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>