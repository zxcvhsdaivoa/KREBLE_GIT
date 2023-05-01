<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_reform_db"%>
<% request.setCharacterEncoding("utf-8"); %><%
  java.util.Date today = new java.util.Date();
  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMdd");
  String formattedDate = sdf.format(today);
%>
<% String id = (String) session.getAttribute("ID"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
    <link rel="stylesheet" type="text/css" href="css/shop_board_detail.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	<script src="js/shop_reform_board.js"></script>
<title>제작(리폼)의뢰서 작성</title>
</head>
<body>
	

 	<jsp:include page="Header_baseform.jsp"/>
	<jsp:useBean id="jsp_ub2" class="use_data.Db_method_shop" />

	<%
	if(id==null){
		%>
		<script>
		alert("로그인이 필요합니다.");
		location.href="login.jsp";
		</script>
		<%
		}
		%>
	<section>
		<div>
			<article id="art_no1"><!-- 의뢰서 타이틀 -->
				<div>제작 의뢰서 작성</div>
			</article>
		
			<form action = "shop_board_detail_db.jsp" method="post">
			<article id="art_no2"><!-- 필수카테고리 -->
				<div><!-- 박스모음 -->
					<div> 의뢰자 : <input type="text" value="<%=id%>" name="w_id" readonly> </div>
					<div> 작성일 : <input type="text" value="<%= formattedDate %>" name="w_date" readonly> </div>
				</div>
				<div>
					<div> 종류 : 
						<select name="w_cata">
						<option>축구공</option>
						<option>축구화</option>
						<option>유니폼</option>
						<option>기타용품</option>
						</select>
					</div>
					<div> 수량 : <input type="number" placeholder="수량을 입력해주세요" max="99999" name="w_qunt" required> </div>
				</div>
				<div>
					<div> 모델명 : <input type="text" placeholder="모델명 입력해주세요" name="w_prd" required> </div>
					<div> 체결 : 
						<select name="w_trade">
							<option>미체결</option>
							<option>진행중</option>
							<option>거래완료</option>
						</select>
					</div>
				</div>
			</article>
			
			<!-- 게시판 내용 -->
			<article id="art_no3">
				<div>
					<input type="text" placeholder="제목을 입력해주세요" name="w_title" maxlength="45" required>
				</div>
			    <div>
			        <textarea placeholder="요청사항을 자세하게 입력해주세요" id="ttarea" name="w_text" required></textarea>
			    </div>
			</article>
			
			<article id="art_no4">
				<div>
					<div>
						<input type="submit" value="등록">
					</div>
					<div>
						<a href="shop_reform_board.jsp">
						<input type="button" value="취소"></a>
					</div>
				</div>
			</article>
			</form>
		</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>