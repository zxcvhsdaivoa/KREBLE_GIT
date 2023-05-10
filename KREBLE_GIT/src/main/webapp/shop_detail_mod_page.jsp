<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_reform_db"%>
<% request.setCharacterEncoding("utf-8"); %>
<% String id = (String) session.getAttribute("ID"); %>
<%
String r_id = request.getParameter("w_id");
String renum = request.getParameter("renum");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물수정</title>
    <link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
    <link rel="stylesheet" type="text/css" href="css/shop_board_detail_view.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
</head>
	<!-- 로그인여부 확인하기 -->
	<%
		if(r_id.equals(id)){
		}else{
	%>
	<script>
		alert("본인의 게시물만 수정이 가능합니다.");
		location.href="shop_reform_board.jsp";
	</script>
	<%
		}
	%>
<body>
 	<jsp:include page="Header_baseform.jsp"/>
	<jsp:useBean id="jsp_ub2" class="use_data.Db_method_shop" />
	<%
	Shop_reform_db aab = jsp_ub2.shop_board_1(renum);
	String aa = request.getParameter("renum");
		
	String w_id = aab.getReid();
	String w_date = aab.getRedate();
	String w_cata = aab.getRecata();
	int w_qunt = aab.getRequnt();
	String w_prd = aab.getReprd();
	String w_trade = aab.getRetrade();
	String w_title = aab.getRetitle();
	String w_text = aab.getRetext();
	%>
	<section>
		<div>
			<form action = "shop_detail_mod.jsp?renum=<%=renum%>" method="post">
			<article id="art_no1"><!-- 의뢰서 타이틀 -->
				<div>
					<input type="text" value="<%=aa%>" readonly id="title_label" name="w_renum">
					<div>.<%=w_id%>님의 제작의뢰서</div>
				</div>
			</article>
		
			<article id="art_no2"><!-- 필수카테고리 -->
				<div><!-- 박스모음 -->
					<div> 작성일 : <input type="text" value="<%=w_date%>" name="w_date" readonly> </div>
					<div> 체결 : 
						<select name="w_trade">
							<option>미체결</option>
							<option>진행중</option>
							<option>거래완료</option>
						</select>
					</div>
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
					<div> 수량 : <input type="number" value="<%=w_qunt %>" name="w_qunt" required> </div>
				</div>
			</article>
			
			<!-- 게시판 내용 -->
			<article id="art_no3">
				<div>
					<input type="text" value="<%=w_title %>" name="w_title" required>
				</div>
			    <div>
			        <textarea id="ttarea" name="w_text" required><%=w_text%></textarea>
			    </div>
			</article>
			
			<article id="art_no4">
				<div>
					<div>
						<input type="submit" value="수정">
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