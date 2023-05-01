<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="use_data.ReviewData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>

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
<jsp:useBean id="list" class="use_data.Db_method_rent" />
<%
	String no= request.getParameter("no");
	String id=(String)session.getAttribute("ID");
	ReviewData review= list.review_list_check(no);	
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
			<p>대여 후기 수정페이지 입니다.</p>
		</div>
		<div id="detail">
			<form action="rent_update_result.jsp">
				<table border="1" summary="">
					<colgroup>
						<col style="width:130px;">
						<col style="width:auto;">
					</colgroup>
						<tr>
							<th scope="row">글번호</th>
							<td><input type="text" name="NUM" value="<%= no%>" readonly></td>
							<th scope="row">평점</th>
							<td><input type="number" name="RATING" value="" min="1" max="5" placeholder="선택" ></td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td><input type="text" name="ID" value="<%=id %>" readonly ></td>
							<th scope="row">작성일</th>
							<td><span><%=review.getDate()%></span></td>
						</tr>
						<tr>
							<th scope="row">추천 수</th>
							<td><span><%=review.getGood()%></span></td>
							<th scope="row">조회수</th>
							<td><span><%=review.getView()%></span></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3"><input type="text" name="TITLE" value="" placeholder="수정할 제목을 입력해주세요"></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3"><textarea name="WRITE"></textarea></td>
						</tr>
				</table>
				<input type="submit" class="funcbtn" value="수정하기" >
			    <a href="rent_review.jsp"><input type="button"  class="funcbtn" value="취소"></a>
	   		</form>
   		</div>
	 </div>
 </section>
 <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>

