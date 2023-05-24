<%@ page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd" %>
<%@ page import="vo.PageInfo"%>
<%@ page import="use_data.UserData"%>
<%@ page import="java.time.LocalDate, java.time.LocalDateTime, java.time.LocalTime, java.time.format.DateTimeFormatter" %>

<% request.setCharacterEncoding("utf-8"); %>
<% String id = (String) session.getAttribute("ID");
	ArrayList<Shop_prd> articleList = (ArrayList<Shop_prd>) request.getAttribute("spb_prd");
	String code = (String) request.getAttribute("ord_code");
	request.setAttribute("art", articleList);
	int total = 0;
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
	<script src="js/shop_prd_dleAddr.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<jsp:useBean id="cash" class="use_data.Db_method_user"></jsp:useBean>
<%
int uc = cash.u_cash(id);
%>
<title>구매기록</title>
</head>
<body>
    <!-- header -->
  
	<jsp:include page="Header_baseform.jsp"/>
	<jsp:useBean id="etc" class="use_data.Db_method_ECT"></jsp:useBean>
<%
	UserData ud = new UserData();
	ud = cash.u_info(id);
%>
	<!-- section -->
	<section>
		<div id="section_wrap">
			<form action="shop_payment.sp" method = "post" onsubmit="return inputcheck()">
			 <input type="hidden" name="spb_prd" value="<%= articleList %>">
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
						<div id="prd_ls" class="no2_on">구매목록(<%=articleList.size()%>)
						</div>
						<div id="in_adrs" class="no2_off">배송지 입력
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
					        	<input type ="hidden" name="prd_nq" value="<%=prd_no%>/<%=prd_qant%>">
					        </td>
							<td class="td_cen">
								<input type="number" class="prd_qant" name="sb_qant<%=i %>" value="<%=articleList.get(i).getPrd_qant()%>" readonly>
					        </td>
					        <td class="td_cen">
								<%//상품 수량*금액 합 / 총합
								int q_p = articleList.get(i).getPrd_price()*articleList.get(i).getPrd_qant();
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
					<div id="no4_center">
						<div class = "no4 fr"><!-- 주문자 정보 -->
							<h2> 주문자 정보 </h2>
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: 630px;">
								</colgroup>
								<tr>
									<td>주문자명 : </td>
									<td><input type="text" id="ord_name" value="<%=ud.getName()%>" readonly></td>
								</tr>
								<tr>
									<td>배송지 : </td>
									<td><input type="text" id="ord_addr" value="<%=ud.getAddress() %>" readonly></td>
								</tr>
								<tr>
									<td>연락처 : </td>
									<td><input type="text" id="ord_call" value="<%=ud.getPh()%>" readonly></td>
								</tr>
							</table>
						</div>
						<div class = "no4 sc"><!-- 받는사람 정보 입력 -->
							<h2> 받는 사람 정보
							<input type="hidden" name = "ord_code" value="<%=code%>">
								<span>
									<input type="radio" name="radio_addr" class="input_order"> 주문자와 정보가 동일
									<input type="radio" name="radio_addr" class="input_new"> 새로운 배송지 입력
								</span>
							</h2>
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: 630px;">
								</colgroup>
								<tr>
									<td>받으시는 분의 성함 : </td>
									<td>
									<div><input type="text" name = "buy_name" readonly></div>
									<div><input type="button" name = "in_addr" value = "배송지 입력" onclick="sample6_execDaumPostcode()"></div>
									</td>
								</tr>
								<tr>
									<td>배송지 : </td>
									<td>
									<div>
									<input type="text" id ="buy_addr" name = "buy_addr" readonly>
									</div>
									<div></div>
									</td>
								</tr>
								<tr>
									<td>연락처 : </td>
									<td>
									<div><input type="text" id ="buy_call" name = "buy_call" readonly>
									</div>
									<div></div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</article>
				<article id="sb_art_no5"><!-- 총 결제금액 -->
					<div class="no5_border"><!-- 테두리 -->
						<div class = "no5_flex">
							[상품합계]<div id="prd_tot"><%=String.format("%,d",total)%></div> + 
							[배송비]<div id="prd_delv">
							<%
							int d_crg = 0;
							if(total>=100000){
								d_crg= 0;
							}else{
								d_crg= 3000;
							}
							%>
							<%= d_crg %>
							</div> =
							[총 결제 금액]<div id="to_cart"> <%=String.format("%,d",total + d_crg)%>원</div>
							
						</div>
					</div>
				</article>
				<article id="sb_art_no7"><!-- 보유금액 확인 -->
					<div><!-- 중앙정렬 -->
						<h2> 결제 정보
						</h2>
						<table>
							<colgroup>
								<col style="width: 200px;">
								<col style="width: 630px;">
							</colgroup>
							<tr>
								<td>보유금액 : </td>
								<td>
									<div id="hav_cash"><%=uc %></div>
									<div><input type="button" value="캐시충전" class = "cash_re"></div>
								</td>
							</tr>
							<tr>
								<td>결제금액 : </td>
								<td>
									<div id="payment"><%=total + d_crg%></div>
									<div></div>
								</td>
							</tr>
							<tr>
								<td>캐시잔액 : </td>
								<td>
									<div id="balance"><%=uc-(total+d_crg)%></div>
									<div id="cash_charge">캐시부족</div>
									<input type="hidden" value="<%=uc-(total+d_crg)%>" name="re_cash">
								</td>
							</tr>
						</table>
					</div>
				</article>
				<article id="sb_art_no6"><!-- 쇼핑홈/구매하기버튼 -->
					<div>
						<a href="#sb_art_no4"><input type="button" value="배송지입력" class="inp_addr"></a>
						<input type="button" value="계속 쇼핑하기" class = "go_shop">
						<input type="submit" value="결제하기" class="pay_bill">
					</div>
				</article>
			</form>
		</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>