<%@ page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd" %>
<%@ page import="vo.PageInfo"%>
<%@ page import="java.time.LocalDate, java.time.LocalDateTime, java.time.LocalTime, java.time.format.DateTimeFormatter" %>

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
	<jsp:useBean id="etc" class="use_data.Db_method_ECT"></jsp:useBean>
	
	<!-- section -->
  
	<section>
		<div id="section_wrap">
			<form action="shop_buy_list.sp" method = "post" onsubmit="return moneycheck()">
				<article id="sb_art_no1"><!-- 장바구니 타이틀 / 결제진행상황 -->
					<div><!-- 아래 div들 묶는용도 및 크기 -->
						<div class ="no1_left">
						<img src ="image/shopimg/cart.png"> 배송지 입력
						</div><!-- 장바구니 타이틀 -->
						<div class ="no1_right">01 장바구니 -><span> 02 주문/결제 -> </span>  03 주문완료</div><!-- 결제진행현황 -->
					</div>
				</article>
				<article id="sb_art_no2"><!-- 일반구매 라벨 -->
					<div>
						<div id="prd_ls" class="no2_left">구매목록(<%=articleList.size()%>)
						</div>
						<div id="in_adrs" class="no2_right">배송지 입력
						</div>
					</div>
				</article>
				<article id="sb_art_no3"><!-- 장바구니리스트Table -->
				<table>
						<colgroup>
							<col style = "width:100px;">
							<col style = "width:550px;">
							<col style = "width:100px;">
							<col style = "width:200px;">
						</colgroup>
						<tr>
							<th>상품사진</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>상품금액</th>
						</tr>
					<%
					    int articleListSize = articleList.size(); // articleList의 크기를 미리 계산하여 변수에 저장
					    for(int i=0; i<articleListSize; i++){
					    	String prd_no = articleList.get(i).getPrd_no();
					    	String prd_name = articleList.get(i).getPrd_name();
					    	int prd_price = articleList.get(i).getPrd_price();
					    	String prd_color = articleList.get(i).getPrd_color();
					    	int prd_qant = articleList.get(i).getPrd_qant();
					    	String im_path = etc.img_link(prd_no);
					%>
					    <tr id="sdfd<%=i%>"><!-- 체크박스/이미지/상품이름(수량)/총합/배송비 -->
					        <td class="td_cen"><img src ="<%=im_path%><%=prd_no%>.jpg" alt="no_image" onerror="this.src='image/no_image.PNG'"></td>
					        <td class="p_left_30"><!-- 상품이름/색상/도착일/수량 -->
					        	<div class = "no3_td_d1"><span class="f_bold"><%=prd_name%></span>, &emsp;색상 : <%=prd_color%></div>
					        </td>
							<td class="td_cen">
										<input type="number" class="prd_qant" name="sb_qant<%=i %>" value="<%=articleList.get(i).getPrd_qant()%>" min="1" max="<%=articleList.get(i).getPrd_total()%>" readonly>
					        </td>
					        <td class="td_cen">
								<%//상품 수량*금액 합 / 총합
								int q_p = articleList.get(i).getPrd_price()*articleList.get(i).getPrd_qant();
								int total = 0;
								total = q_p+total;
								%>
								<%=q_p%>
					        </td>
					    </tr>
					<%
					    }
					%>
					</table>
				</article>
				<article id="sb_art_no4"><!-- 배송지/주문자번호 입력 -->
					<input type="text">
					<input type="text">
					<input type="text">
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
						<a href="#"><input type="button" value="배송지입력"></a>
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