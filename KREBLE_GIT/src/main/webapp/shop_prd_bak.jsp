<%@ page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd" %>
<%@ page import="vo.PageInfo"%>
<%@ page import="java.time.LocalDate, java.time.LocalDateTime, java.time.LocalTime, java.time.format.DateTimeFormatter" %>


<% request.setCharacterEncoding("utf-8"); %>
<% 	String id = (String) session.getAttribute("ID");
	ArrayList<Shop_prd> articleList =(ArrayList<Shop_prd>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
	<jsp:useBean id="cash" class="use_data.Db_method_user"></jsp:useBean>
	<jsp:useBean id="etc" class="use_data.Db_method_ECT"></jsp:useBean>
	<%
		int uc = cash.u_cash(id);
		String deliv ="";
		int q_p = 0;
		int total = 0;
		int delv_pay=0;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/shop_prd_bak.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	<script src="js/shop_prd_number.js"></script>

<title>장바구니</title>
</head>
<body>
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
					<table>
						<colgroup>
							<col style = "width:70px;">
							<col style = "width:100px;">
							<col style = "width:550px;">
							<col style = "width:100px;">
							<col style = "width:200px;">
						</colgroup>
						<tr>
							<th><input type="checkbox" name="allcheck" class="all_ck"></th>
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
					        <td class="td_cen"><input type="checkbox" name="prd_ck" value="<%=prd_no%>/<%=prd_name%>/<%=prd_price%>/<%=prd_qant%>" class="ck_cked"></td>
					        <td class="td_cen"><img src ="<%=im_path%><%=prd_no%>.jpg" alt="no_image" onerror="this.src='image/no_image.PNG'"></td>
					        <td class="p_left_30"><!-- 상품이름/색상/도착일/수량 -->
					        	<div class = "no3_td_d1"><span class="f_bold"><%=prd_name%></span>, &emsp; <%=prd_color%></div>
					        	<div class = "no3_td_d3">
					        		<%
					        		  String a = prd_no;
					        		  char lastChar = a.charAt(a.length() - 1);
					        		  int lastDigit = Character.getNumericValue(lastChar);
					        		  
					        		  boolean isEven = lastDigit % 2 == 0;
					        		  
					        		  if(isEven){
					        		%>
	  									<div class="timer"></div><div>내 주문시 당일 출고</div>
									<%
					        		  }else{
					        			LocalDate now = LocalDate.now();
										DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M월 d일");
										LocalDate date;
									    date = now.plusDays(2);
									    String dateString = date.format(formatter);
									%>
										<div><%= dateString %></div><div>까지 배송 예정</div>
									<%
					        		  }
									%>	
					        	</div>
					        </td>
							<td class="td_cen">
										<input type="number" class="prd_qant" name="sb_qant<%=i %>" value="<%=articleList.get(i).getPrd_qant()%>" min="1" max="<%=articleList.get(i).getPrd_total()%>">
										<input type="hidden" value="<%=articleList.get(i).getPrd_no()%>" name="prd_no<%=i%>">
										<input type="button" value ="수량변경" name="<%=i%>" class="prd_button">
										<input type="hidden" value="<%=id%>" name="id">
										<input type="hidden" value="<%=articleList.get(i).getPrd_total()%>" name="max_qant"><!--  total => 최대수량 -->
					        </td>
					        <td class="td_cen">
								<%//상품 수량*금액 합 / 총합
								q_p = articleList.get(i).getPrd_price()*articleList.get(i).getPrd_qant();
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
				<article id="sb_art_no4"><!-- 전체선택/전체삭제 -->
					<div>
						<a href="sb_back_clear.sp?b_id=<%=id%>"><input type="button" name="no4_del" value="전체삭제"></a>
						<input type="button" name="no4_del" value="선택상품 삭제">
					</div>
				</article>
				<article id="sb_art_no5"><!-- 총 결제금액 -->
					<div class="no5_border"><!-- 테두리 -->
						<div class = "no5_flex">
							[상품합계]<div id="prd_tot"></div>원 + 
							[배송비]<div id="prd_delv"></div>원 =
							[총배송비]<div id="to_cart"></div>원
							
						</div>
					</div>
				</article>
				<article id="sb_art_no6"><!-- 쇼핑홈/구매하기버튼 -->
					<div>
						<a href="shop_list_action.sp"><input type="button" value="계속 쇼핑하기"></a>
						<input type="submit" value="구매하기">
					</div>
				</article>
			</form>
		</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>