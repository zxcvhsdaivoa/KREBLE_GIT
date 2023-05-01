<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_reform_db"%>
<% request.setCharacterEncoding("utf-8"); %>
<% String id = (String) session.getAttribute("ID"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
    <link rel="stylesheet" type="text/css" href="css/shop_board_detail_view.css">
    
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
<title>게시물보기</title>
</head>
<body>
	

 	<jsp:include page="Header_baseform.jsp"/>
	<jsp:useBean id="jsp_ub2" class="use_data.Db_method_shop" />
	<!-- 로그인여부 확인하기 -->
	<%
		if(id==null){
	%>
		<% String urld = request.getRequestURI(); %>
		<script>
		alert("로그인이 필요합니다.");
		location.href="login.jsp";
		</script>
	<%
	}
	%>


	<!-- db불러오기 -->
	<%
	String aa = request.getParameter("renum");
	
	Shop_reform_db aab = jsp_ub2.shop_board_1(aa);
		
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
			<form action = "shop_board_detail_db.jsp" method="post">
			<article id="art_no1"><!-- 의뢰서 타이틀 -->
				<div>
					<input type="text" value="<%=aa%>" readonly id="title_label" name="w_renum">
					<div>.<%=w_id%>님의 제작의뢰서</div>
				</div>
			</article>
		
			<article id="art_no2"><!-- 필수카테고리 -->
				<div><!-- 박스모음 -->
					<div>
						작성일 : <input type="text" value="<%=w_date %>" readonly>
					</div>
					<div>
						체결 : <input type="text" placeholder="<%=w_trade %>" name="w_trade" readonly>
					</div>
				</div>
				<div>
					<div> 종류 : <input type="text" placeholder="<%=w_cata %>" readonly>
					</div>
					<div> 수량 : <input type="number" placeholder="<%=w_qunt %>" name="w_qunt" readonly> </div>
				</div>
			</article>
			
			<!-- 게시판 내용 -->
			<article id="art_no3">
				<div>
					<input type="text" placeholder="<%=w_title %>" name="w_title" readonly>
				</div>
				<div>
			        <textarea placeholder="<%=w_text %>" id="ttarea" name="w_text" readonly></textarea>
				</div>
			</article>
			
			<article id="art_no4">
				<div>
					<div>
						<a href="shop_detail_mod_page.jsp?w_id=<%=w_id %>&renum=<%=aa%>"><input type="button" value="수정"></a>
						<a href="shop_detail_del.jsp?w_id=<%=w_id %>&renum=<%=aa%>"><input type="button" value="삭제"></a>
						<a href="shop_reform_board.jsp">
						<input type="button" value="목록"></a>
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