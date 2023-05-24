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
			<%
			if(articleList.size()==0){
			%>
			<article id="sb_art_no5">
				<div> 구매내역이 없습니다.</div>	
			</article>
			
			<%}else{ %>
			
			<article id="sb_art_no3"><!-- 구매내역리스트Table -->
			<table>
			<%
				for(int i = 0; i < articleList.size(); i++){
				String impt = etc.img_link(articleList.get(i).getPrd_no());
			%>
				<%if(i==0){%><!-- 첫행 -->
					<tr>
						<th>주문번호</th>
						<th>주문일자</th>
						<th>상품사진</th>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>배송지</th>
					</tr>
					<tr>
						<td><%=articleList.get(i).getPrd_odnum()%></td>
						<td><%=articleList.get(i).getPrd_date()%></td>
						<td><img onerror="this.src='image/no_image.PNG'" src="<%=impt + articleList.get(i).getPrd_no()%>.jpg"></td>
						<td><%=articleList.get(i).getPrd_name()%></td>
						<td><%=articleList.get(i).getPrd_qant()%></td>
						<td><%=articleList.get(i).getPrd_price()%></td>
						<td><%=articleList.get(i).getPrd_addr()%></td>
					</tr>
				<%}else if(i==1){%><!-- 주문번호 동일 / 마지막아님 -->
				<%}else if(i==2){%><!-- 주문번호 다름 / 마지막아님 -->
				<!-- 테이블 닫고 열고 -->
				<%}else if(i==3){ %><!-- 마지막 -->
				<!-- 테이블 닫고 -->
				<%	
						}
					}
				%>
				</table>
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