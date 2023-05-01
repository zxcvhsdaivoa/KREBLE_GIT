<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.ReviewData" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
<link rel="stylesheet" type="text/css" href="css/rent_review.css">
<link href="https://fonts.googleapis.com/css?family=Kirang+Haerang:400" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Labrada:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Orbitron&family=Righteous&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">



<title>글 목록</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>

<body>

<jsp:include page="Header_baseform.jsp"/>


<section>
	<form>
		<div id="inner">
			<div class="review_title">
				<img alt="" src="image/review_tit2.jpg" style="width:500px">
			</div>
			<div class="review_body">
				<div class="category">
				<table>
					<tr>
						<td class="style1">분류별 검색</td>
						<td>
							<select class="serchtext1">
								<option>대분류 선택</option>
								<option>아이디</option>
								<option>제목</option>
								<option>좋아요 순</option>
								<option>조회순</option>
								<option>평점 순</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="style1">검색</td>
						<td><input type='text' value="" class="serchtext"  placeholder="검색 내용을 입력해주세요."></td>
						<td><input type="button" value="검색" class="serchbtn"></td>
					</tr>
				</table>
				</div>
				<div class="contents">
					<table style="width:100%">
						<thead>
						<tr class="bg1">
							<th class="head2">글번호</th>
							<th class="head3">제목</th>
							<th class="head1">아이디</th>
							<th class="head4">추천</th>
							<th class="head5">조회</th>
							<th class="head6">날짜</th>
							<th class="head4">평점</th>
						</tr>
						</thead>				
						
						<jsp:useBean id="rent_review" class="use_data.Db_method_rent" />
						<%
							ArrayList<ReviewData> reviewList= rent_review.db_review_select();
						%>	
						<tbody class="style2">
						<%
							for(int i=0; i<reviewList.size(); i++){
							out.println("<tr>");
							out.println("<td>"+ reviewList.get(i).getNum()+ "</td>");						
							out.println("<td>"+"<a class='fontstyle' href='rent_review_list.jsp?num="+reviewList.get(i).getNum()+"'>"+ reviewList.get(i).getTitle()+"</a>");
							// 페이지 별 getpara("no"와"num"의 차이)
							// review_list는 ?num으로 설정했으니 getpara를 num으로 받고 다른 곳 no로 설정한 곳은 넘겨받을때 no로 받는다
							out.println("<br>"+"<span>"+reviewList.get(i).getPut()+"</span>"+"</td>");
							out.println("<td>"+ reviewList.get(i).getId()+"</td>");
							out.println("<td>"+ reviewList.get(i).getGood()+"</td>");
							out.println("<td>"+ reviewList.get(i).getView()+"</td>");
							out.println("<td>"+ reviewList.get(i).getDate()+"</td>");
							out.println("<td>"+ reviewList.get(i).getRating()+"</td>");
							out.println("</tr>");
							}
						%>
						</tbody>
					</table>
					<a href="rent_review_write.jsp"><input type='button' class="writebtn" value="글 쓰기"></a>
					<div>
						<div></div>
					</div>
				</div>
			</div>		
		</div>
	</form>
	</section>
	 <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>