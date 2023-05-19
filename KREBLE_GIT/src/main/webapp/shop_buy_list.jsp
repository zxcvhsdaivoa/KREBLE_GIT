<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd" %>

<% request.setCharacterEncoding("utf-8"); %>
<% String id = (String) session.getAttribute("ID");
	ArrayList<Shop_prd> articleList =(ArrayList<Shop_prd>) request.getAttribute("spb_prd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/shop_buy_list.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	
	
	
<title>구매기록</title>
</head>
<body>
    <!-- header -->
  
	<jsp:include page="Header_baseform.jsp"/>
	
	<!-- section -->
  
	<section>
		<div id="section_wrap">
			<form action="shop_buy_list.sp" method = "post" onsubmit="return moneycheck()">
				<article id="sb_art_no1"><!-- 장바구니 타이틀 / 결제진행상황 -->
					<div><!-- 아래 div들 묶는용도 및 크기 -->
						<div class ="no1_left">
						<img src ="image/shopimg/cart.png"> 장바구니
						</div><!-- 장바구니 타이틀 -->
						<div class ="no1_right">01 장바구니 -><span> 02 주문/결제 -> </span>  03 주문완료</div><!-- 결제진행현황 -->
					</div>
				</article>
				<article id="sb_art_no2"><!-- 일반구매 라벨 -->
					<div>
						<div class="no2_left">일반구매(size)
						</div>
						<div class="no2_right">
						</div>
					</div>
				</article>
				<article id="sb_art_no3"><!-- 장바구니리스트Table -->
				</article>
				<article id="sb_art_no4"><!-- 전체선택/전체삭제 -->
					<div>
						<a href="#"><input type="button" name="no4_del" value="전체삭제"></a>
						<input type="button" name="no4_del" value="선택상품 삭제">
					</div>
				</article>
				<article id="sb_art_no5"><!-- 총 결제금액 -->
					<div class="no5_border"><!-- 테두리 -->
						<div class = "no5_flex">
							[상품합계]<div id="prd_tot">0</div> + 
							[배송비]<div id="prd_delv">0</div> =
							[총배송비]<div id="to_cart">0</div>
							
						</div>
					</div>
				</article>
				<article id="sb_art_no6"><!-- 쇼핑홈/구매하기버튼 -->
					<div>
						<a href="shop_list_action.sp"><input type="button" value="계속 쇼핑하기"></a>
						<input type="submit" value="결제하기">
					</div>
				</article>
			</form>
		</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>