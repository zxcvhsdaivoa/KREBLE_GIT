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
			<form action="shop_buy_list.sp" method = "post" onsubmit="return cb_click()">
				<article id="sb_art_no1"><!-- 장바구니 타이틀 / 결제진행상황 -->
					<div><!-- 아래 div들 묶는용도 및 크기 -->
						<div class ="no1_left">
						<img src ="image/shopimg/cart.png"> 장바구니
						</div><!-- 장바구니 타이틀 -->
						<div class ="no1_right"><span>01 장바구니 </span> -> 02 주문/결제 -> 03 주문완료</div><!-- 결제진행현황 -->
					</div>
				</article>
				<article id="sb_art_no2"><!-- 일반구매 라벨 -->
					<div>
						<div class="no2_left">일반구매(<%=articleList.size()%>)
						</div>
						<div class="no2_right">
						</div>
					</div>
				</article>
				<article id="sb_art_no3"><!-- 장바구니리스트Table -->
				</article>
				<article id="sb_art_no4"><!-- 전체선택/전체삭제 -->
				</article>
				<article id="sb_art_no5"><!-- 총 결제금액 -->
				</article>
				<article id="sb_art_no6"><!-- 쇼핑홈/구매하기버튼 -->
				</article>
			</form>
		</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
	
	<a href = "shop_back_page.sp">도착예정일</a>
</body>
</html>