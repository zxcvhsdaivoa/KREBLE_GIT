<%@ page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd" %>


<% request.setCharacterEncoding("utf-8"); %>
<% 	String id = (String) session.getAttribute("ID");
	ArrayList<Shop_prd> articleList =(ArrayList<Shop_prd>) request.getAttribute("articleList");
%>
	<jsp:useBean id="cash" class="use_data.Db_method_user"></jsp:useBean>
	<jsp:useBean id="etc" class="use_data.Db_method_ECT"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/shop_com_pay.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	<script src="js/shop_com_pay.js"></script>

<title>구매 내역</title>
	<%
		int uc = cash.u_cash(id);
		if(id==null){
	%>
		<script>
		alert("로그인이 필요합니다.");
		location.href="login.jsp";
		</script>
	<%
		}
	%>
</head>
<body>
    <!-- header -->
	<jsp:include page="Header_baseform.jsp"/>
	<section>
		<div id="section_wrap">
			<article id="sb_art_no1"><!-- 구매내역 타이틀-->
				<div class = "no1_div"><!-- 아래 div들 묶는용도 및 크기 -->
					<div>구매내역</div>
				</div>
			</article>
			<article id="sb_art_no2"><!-- 배송상황 -->
				<div class = "no2_flex">
					<div>전체
					</div>
					<div>배송중
					</div>
					<div>배송완료
					</div>
				</div>
			</article>
			<article id="sb_art_no3"><!-- 구매내역리스트Table -->
			<%
				for(int i = 0; i < articleList.size(); i++){
			%>
					<%=articleList.get(i).getPrd_no()%>
					<%=articleList.get(i).getPrd_name()%>
					<%=articleList.get(i).getPrd_date()%>
					<%=articleList.get(i).getPrd_addr()%>
					<%=articleList.get(i).getPrd_price()%>
			<%	
				}
			%>
			
			
			</article>
			<article id="sb_art_no4"><!-- 크래블홈 / 쇼핑하러가기 버튼 -->
				<div class="no4_flex">
					<form>
						<a href="#sb_art_no1"><INPUT TYPE="BUTTON" VALUE="TOP"></a>
					</form>
				</div>
			</article>
		</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
	
	<a href = "shop_back_page.sp">도착예정일</a>
</body>
</html>