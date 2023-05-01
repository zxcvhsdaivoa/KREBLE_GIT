<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="use_data.Db_method_commu"/>
<%@ page import="use_data.CommunityData"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	CommunityData cmd = new CommunityData();
	
	String realFolder="";
	String saveFolder="/commuFile";
	int fileSize=5*1024*1024;
	ServletContext context = request.getServletContext();
	realFolder=context.getRealPath(saveFolder);   		
	MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,
			"UTF-8",
			new DefaultFileRenamePolicy());

	cmd.setId((String) session.getAttribute("ID"));
	cmd.setCategory(multi.getParameter("cate"));
	cmd.setComu_title(multi.getParameter("title"));
	cmd.setComu_write(multi.getParameter("write"));
	cmd.setComu_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
	data.commu_write(cmd);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function(){
		alert("게시글 작성이 완료되었습니다");
		location.href="community.jsp";
	})
</script>