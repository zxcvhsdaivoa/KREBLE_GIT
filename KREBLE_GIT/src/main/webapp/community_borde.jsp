<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<jsp:useBean id="ud" class="use_data.Db_method_commu"/>
				<%@ page import="use_data.CommunityData"%>
				<%@ page import="use_data.CommuCommentData"%>
				<%@ page import="java.util.ArrayList"%>
				<%@ page import="java.awt.image.renderable.ParameterBlock" %>
				<%
				String login_id = (String) session.getAttribute("ID");
				int comu_no = Integer.parseInt(request.getParameter("no"));
				int read_count = ud.getReadCount(comu_no);
				ud.updateReadCount(read_count, comu_no);
				CommunityData comu = ud.commu_one(comu_no);
				CommunityData next_board=ud.next_board(comu_no);
				CommunityData prev_board=ud.prev_board(comu_no);
				
				ServletContext context = request.getServletContext();
				String imagePath=context.getRealPath("commuFile");
				
				int size = 1*1024*1024 ;
				String filename=comu.getComu_file();
				ParameterBlock pb=new ParameterBlock();
				
				%>
				<div class="community_inner">
					<div class="top_box">
						<span class="writer"><%= comu.getId()%></span>
						<span class="writing_time"><%= comu.getComu_date()%></span>
						<span class="category replace_cate">[<%= comu.getCategory()%>]</span>
						
					</div>
					<div class="content_box">
						<span class="title"><%= comu.getComu_title()%></span>
						<%
						if(filename!= null&&!filename.equals("null")&&filename!="null"){
							%>
						<img src="commuFile/<%= filename%>">
							<%
						}
						%>
						<textarea class="write" readonly><%= comu.getComu_write()%></textarea>
					</div>
				
					<div class="btn_box">
						<a href="community.jsp?cate=all" class="btn btn_list"><span>목록</span></a>
					<%
					if(login_id == null) {
						
					}
					else if(comu.getId()==null){
						
					}
					else if(comu.getId().equals(login_id)){
						out.println("<span class='btn btn_delete' data-communo="+comu.getComu_num()+">삭제하기</span>");
						out.println("<span class='btn btn_change'><a href='community_change.jsp?no="+comu_no+"'>수정하기</a></span>");
					}
					%>
					</div>
			
			
					<table class="nextprev">
					<tr>
						<td>다음글</td>
						<td><%if(next_board.getComu_title()!=null){ %><a href="community_borde.jsp?no=<%= next_board.getComu_num()%>" class="btn_next"><%= next_board.getComu_title() %></a><%}else{ %>다음글이 없습니다<%} %></td>
					</tr>
					<tr>
						<td>이전글</td>
						<td><%if(prev_board.getComu_title()!=null){ %><a href="community_borde.jsp?no=<%= prev_board.getComu_num()%>" class="btn_prev"><%= prev_board.getComu_title() %></a><%}else{ %>이전글이 없습니다<%} %></td>
					</tr>
					</table>
					
					
					<div class="comment_list">
						
						<ul>
						<%
						ArrayList<CommuCommentData> ccd = ud.comment_list(comu_no);
						for(int i=0; i<ccd.size(); i++) {
							%>
							<li>
								<div>
									<%if(comu.getId().equals(ccd.get(i).getUser_id())) {%><span class="writer">작성자</span><%}%>
									<span class="comment_id "><%= ccd.get(i).getUser_id() %>님의 댓글</span>
									<span class="comment_time">(<%= ccd.get(i).getComment_wrdate() %>)</span>
								</div>
								<span class="comment_text"><%= ccd.get(i).getCommuComment() %></span>
							</li>
							<%
						}
						%>
						</ul>
					</div>
					
					
					<div class="comment_write">
						
						<form name="comment_form">
							<span class="login_id"><%=login_id %></span>
							<input type="hidden" name="commu_no" id="commu_no" value="<%=comu_no%>">
							<textarea id="comment" name="comment" class="comment_textarea"></textarea>
							<input type="button" value="댓글입력" class="btn btn_comment" onclick="comment_write();">
						</form>
					
					</div>
				</div>
			</div>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>