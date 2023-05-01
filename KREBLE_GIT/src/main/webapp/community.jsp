<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>유저 커뮤니티</title>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/community.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/community.js"></script>

<body>
<jsp:include page="Header_baseform.jsp"/>
	<section>
		<div class="section_inner">
			
			<div class="community">
				<div class="community_header">
					<h3>유저커뮤니티</h3><br>
				</div>
				<div class="community_inner">
					<jsp:useBean id="ud" class="use_data.Db_method_commu"/>
					<%@ page import="java.awt.image.renderable.ParameterBlock" %>
			
				    <%@ page import="use_data.CommunityData"%>
				    <%@ page import="java.util.ArrayList"%>
					<%@ page import="javax.imageio.ImageIO" %>
					<%@ page import="java.awt.Graphics2D" %>
					<%@ page import="java.awt.image.renderable.ParameterBlock" %>
					<%@ page import="java.awt.image.BufferedImage" %>
					<%@ page import="java.io.*" %>
				    <%
					ArrayList<CommunityData> comu= null;
					int listCount=0;
					
					//login_id
					String login_id="0";
					if(session.getAttribute("ID")!=null&& session.getAttribute("ID")!=""&& session.getAttribute("ID")!="null"){
						login_id=(String) session.getAttribute("ID");
					}
					
				    //category
				    String cate="all";
				    if(request.getParameter("cate")!=null){
					    cate = request.getParameter("cate");
				    }
					
				    //mycommu
				    String mycommu="none";
				    if(request.getParameter("mycommu")!=null){
				    	mycommu = request.getParameter("mycommu");
				    }
				    
					//paging
				    int page_no=1;
					int limit=15;
					if(request.getParameter("page")!=null){
						page_no=Integer.parseInt(request.getParameter("page"));
					}
					
			   		//search
					String search="noSearch";
					String search_text="";
			   		if(request.getParameter("search_text")!=null&&request.getParameter("search_text")!=""){
					    search = request.getParameter("search_select");
						search_text = request.getParameter("search_text");
					}
			   		
			   		Date now = new Date();
					SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					
					
					if(search.equals("noSearch")){
						if(mycommu.equals("none")){
							if(cate.equals("all")){
								comu = ud.commu_all(page_no,limit);
								listCount=ud.commu_all_count();
							}
							else {
								comu = ud.commu_cate(cate,page_no,limit);
								listCount=ud.commu_cate_count(cate);
							}
						}
						else {
							comu = ud.commu_mycommu(mycommu,login_id,cate,page_no,limit);
							listCount=ud.commu_mycommu_count(mycommu, login_id, cate);
						}
					}
					else {
						comu = ud.commu_search(mycommu,login_id,search, search_text,cate,page_no,limit);
						listCount=ud.commu_search_count(mycommu,login_id,search, search_text, cate);
						
					}
					
					//paging2
			   		int maxPage=(int)((double)listCount/limit+0.95); 
			   		int startPage = (((int) ((double)page_no / 10 + 0.9)) - 1) * 10 + 1;
			   	    int endPage = startPage+10-1;

			   		if (endPage> maxPage) endPage= maxPage;
			   		
			   		//thumbnail
			   		ServletContext context = request.getServletContext();
					String imagePath=context.getRealPath("commuFile");
					
					int size = 1*1024*1024 ;
					ParameterBlock pb=new ParameterBlock();
				    %>
				    <div class="top_wrap">
						<span class="btn btn_write"><a href="community_check.jsp?do=ck">글쓰기</a></span>
						<ul class="cate">
							<li><a href="community.jsp" <%if(cate.equals("all")){ %>class="select"<%} %>>전체</a></li>
							<li><a href="community.jsp?cate=free" <%if(cate.equals("free")){ %>class="select"<%} %>>자유</a></li>
							<li><a href="community.jsp?cate=debate" <%if(cate.equals("debate")){ %>class="select"<%} %>>토론</a></li>
							<li><a href="community.jsp?cate=qna" <%if(cate.equals("qna")){ %>class="select"<%} %>>질문</a></li>
							<li><a href="community.jsp?cate=info" <%if(cate.equals("info")){ %>class="select"<%} %>>정보</a></li>
						</ul>
						<%if(!login_id.equals("0")){ %>
						<ul class="mycommu">
							<li><a href="community.jsp?mycommu=board<%if(!cate.equals("all")){%>&cate=<%= cate %> <%}%>" <%if(mycommu.equals("board")) {%>class="select"<%} %>>내글보기</a></li>
							<li><a href="community.jsp?mycommu=comment<%if(!cate.equals("all")){%>&cate=<%= cate %> <%}%>" <%if(mycommu.equals("comment")) {%>class="select"<%} %>>내댓글보기</a></li>
						</ul>
						<%} %>
				    </div>
					<%
					if(comu != null && listCount > 0){
					%>
				    <table class="commu_list_table">
					    <tr class="bg1">
					    	<th class="head1">글번호</th>
					    	<th class="head2">작성자</th>
					    	<th class="head2">카테고리</th>
					    	<th class="head3">제목</th>
					    	<th class="head5">조회수</th>
					    	<th class="head5">작성일</th>
					    </tr>
					    <tbody class="style2">
						<%
						
						for(int i=0; i<comu.size(); i++){
							String filename=comu.get(i).getComu_file();
							%>
							<tr class='bt_border'>
							<td><%=comu.get(i).getComu_num() %></td>
							<td><%=comu.get(i).getId()%></td>
							<td class='replace_cate'><%=comu.get(i).getCategory()%></td>
							<td><a href='community_borde.jsp?no=<%=comu.get(i).getComu_num()%>'><%=comu.get(i).getComu_title()%></a>
							<%
							if(comu.get(i).getComu_file()!=null&&comu.get(i).getComu_file()!="null"&&!comu.get(i).getComu_file().equals("null")){
								%>
								<img src="image/img_logo.png" class="img_logo">
								<%
							}
							%>
							</td>
							<td><%=comu.get(i).getCount()%></td>
							<%
							String wdt;
							String writedate = comu.get(i).getComu_date();
							Date wd = fm.parse(writedate);
							long diff = now.getTime() - wd.getTime();
							int daysDiff = (int) (diff / (24 * 60 * 60 * 1000));
							SimpleDateFormat simpleDateFormat;
							if(daysDiff<2){
								simpleDateFormat = new SimpleDateFormat("HH:mm"); 
							}
							else {
								simpleDateFormat = new SimpleDateFormat("MM-dd"); 
							}
							String strNowDate = simpleDateFormat.format(wd);
							 %>
							<td><%=strNowDate%></td>
							</tr>
						<%
						}
						%>
						</tbody>
					</table>
					<div class="paging">
					
						<%if(page_no<=1){ %>
						[이전]&nbsp;
						<%}else{ %>
						<a href="community.jsp?page=<%=page_no-1%><%if(!mycommu.equals("none")){%>&mycommu=<%= mycommu %> <%}%><%if(!cate.equals("all")){%>&cate=<%= cate %> <%}%><%if(search_text!=""){%>&search_select=<%= search %>&search_text=<%=search_text %> <%}%>">[이전]</a>&nbsp;
						<%} %>
					
						<%for(int a=startPage;a<=endPage;a++){
							if(a==page_no){%>
							<span class="select">[<%=a %>]</span>&nbsp;
							<%}else{ %>
								<a href="community.jsp?page=<%=a %><%if(!mycommu.equals("none")){%>&mycommu=<%= mycommu %> <%}%><%if(!cate.equals("all")){%>&cate=<%= cate %> <%}%><%if(search_text!=""){%>&search_select=<%= search %>&search_text=<%=search_text %> <%}%>">[<%=a %>]</a>&nbsp;
							<%} %>
						<%} %>
					
						<%if(page_no>=maxPage){ %>
						[다음]
						<%}else{ %>
						<a href="community.jsp?page=<%=page_no+1 %><%if(!mycommu.equals("none")){%>&mycommu=<%= mycommu %> <%}%><%if(!cate.equals("all")){%>&cate=<%= cate %> <%}%><%if(search_text!=""){%>&search_select=<%= search %>&search_text=<%=search_text %> <%}%>">[다음]</a>
						<%
						}
					    }
						%>
					
					</div>
					<div class="search_box">
						<form name="search" action="community.jsp">
							<input type="hidden" name="cate" value="<%= cate %>">
							<input type="hidden" name="mycommu" value="<%= mycommu %>">
							<select name="search_select" id="search_select" name="search_select" class="search_select">
								<option value="search_title" <% if(search.equals("search_title")){%>selected="selected"<%}%>>제목</option>
								<option value="search_title_write" <% if(search.equals("search_title_write")){%>selected="selected"<%}%>>제목+내용</option>
						    	<option value="search_name" <% if(search.equals("search_name")){%>selected="selected"<%}%>>작성자</option>
							</select>
							<input type="text" name="search_text" class="search_text" <% if(search_text!=null){%>value="<%= search_text%>"<%}%>>
							<input type="submit" value="검색" class="btn_search" >
						</form>
					</div>
				</div>
				
			</div>
		</div>
			
			
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>