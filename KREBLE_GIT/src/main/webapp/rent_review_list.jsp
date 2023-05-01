<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="use_data.ReviewData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 페이지</title>

<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
<link rel="stylesheet" type="text/css" href="css/rent_review_list.css">
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
	String num= request.getParameter("num");//
	ReviewData review= list.review_list_check(num);	
	list.db_review_count(num);
%>
<script>
function goodcount(){
	$.ajax({
		url:"review_good_result.jsp?num=<%= review.getNum() %>" ,
        type:"post" ,
        dataType:"html",

        success:function(re){ 
          alert("추천되었습니다.");
        }
	});		
}
</script>

<body>
<jsp:include page="Header_baseform.jsp"/>
<section>
<div id="inner">
	<div class="topArea">
		<h2>후기게시판</h2>
		<p>대여 후기입니다.</p>
	</div>
	<div id="detail">
		<form>
			<table border="1" summary="">
				<colgroup>
					<col style="width:130px;">
					<col style="width:auto;">
				</colgroup>
				<tr>
					<th scope="row">글번호</th>
					<td><span><%=review.getNum()%></span></td>
					<th scope="row">평점</th>
					<td><span><%=review.getRating()%></span></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><span><%=review.getId()%></span></td>
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
					<td colspan="3"><span><%=review.getTitle()%></span></td>	
				</tr>
				<tr>
					<th scope="row">글 내용</th>
					<td colspan="3"><textarea readonly><%=review.getPut()%></textarea></td>
				</tr>
			</table>
			<a href="rent_review.jsp"><span class="normalbtn">글 목록</span></a>
			<span onclick="goodcount()" class="normalbtn">추천</span>
			<a href="rent_review_update.jsp?no=<%= review.getNum()%>"><span class="funcbtn">글 수정하기</span></a>
			<a href="rent_review_delete.jsp?no=<%= review.getNum()%>"><span class="funcbtn">글 삭제</span></a>
		</form>
	</div>
	
</div>
</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>
