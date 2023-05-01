<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="use_data.ReviewData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
<link rel="stylesheet" type="text/css" href="css/rent_review_write.css">
<link href="https://fonts.googleapis.com/css?family=Kirang+Haerang:400" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Labrada:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Orbitron&family=Righteous&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>

<%
	String id=(String)session.getAttribute("ID");
	if(id==null){
%>
	<script>
		alert("로그인시에 이용 가능합니다.");
		location.href = "login.jsp";
	</script>
<%
}
%>
<body>
<jsp:include page="Header_baseform.jsp"/>
<section>
	<div id="inner">
		<div class="topArea">
			<h2>후기게시판</h2>
			<p>대여 후기 작성페이지 입니다.</p>
		</div>
		<div id="detail">
			<form action="rent_review_insert.jsp">
				<table border="1" summary="">
					<colgroup>
						<col style="width:130px;">
						<col style="width:auto;">
					</colgroup>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3"><input type="text" name="TITLE" value="" placeholder="제목을 입력해주세요" ></td>
						<tr>
							<th>아이디:</th>
							<td><input type="text" name="ID" value="<%=id %>" readonly ></td>
							<th scope="row">평점</th>
							<td><input type="number" name="RATING" value="" min="1" max="5" placeholder="선택" ></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3"><textarea name="WRITE" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
				</table>
			<a href="rent_review.jsp"><input type="button" class="funcbtn" value="뒤로가기"></a>
	   		<input type="submit" class="funcbtn" value="글 등록" >
	   		</form>
   		</div>
	 </div>
 </section>
 <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>
