<%@ page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd" %>
<%@ page import="vo.PageInfo"%>

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
	<%
		int uc = cash.u_cash(id);
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
		<div>
		<form action="shop_buy_list.sp" method = "post" onsubmit="return moneycheck()">
		<article id="sb_art_no1"><!--아이디 / 보유캐시 타이틀 -->
			<div id="sb_subtitle">
				<div class="sb_subt1"> 장바구니 </div>
				<div class="sb_subt2"> <%=id %> 님의 보유 캐시는 <%= uc %>입니다.
				<input type="hidden" name="iid" value="<%=uc %>">
				</div>
			</div>
		</article>
		<article id="sb_art_no2"><!-- 장바구니 리스트 -->
		
		
		
			<div class="no2_center"><!-- 장바구니 TH-->
				<table>
					<tr>
						<th>  </th>
						<th>사진</th>
						<th>상품명</th>
						<th>색상</th>
						<th>수량</th>
						<th>가격</th>
						<th>총합</th>
						<th>비고</th>
					</tr>
					<%
					int q_p = 0;
					int total = 0;
					int aa =0;
					if(articleList != null && listCount > 0){
					for(int i=0;i<articleList.size();i++){
					%>
					
					<tr>
						<td><input type="hidden" name="sb_id<%=i %>" value=<%=articleList.get(i).getPrd_id() %>></td>
						<td><input type="text" name="sb_img<%=i%>" value="<%=articleList.get(i).getPrd_img()%>"readonly></td>
						<td><input type="text" name="sb_name<%=i%>" value="<%=articleList.get(i).getPrd_name()%>"readonly></td>
						<td><input type="text" name="sb_color" value="<%=articleList.get(i).getPrd_color()%>"readonly></td>
						<td>
						<input type="number" class="prd_qant" name="sb_qant<%=i %>" value="<%=articleList.get(i).getPrd_qant()%>" min="1" max="<%=articleList.get(i).getPrd_total()%>">
						<input type="hidden" value="<%=articleList.get(i).getPrd_no()%>" name="prd_no<%=i%>">
						<input type="button" value ="수량변경" name="<%=i%>" class="prd_button">
						<input type="hidden" value="<%=id%>" name="id">
						<input type="hidden" value="<%=articleList.get(i).getPrd_total()%>" name="max_qant"><!--  total => 최대수량 -->
						</td>
						<td><input type="number" name="sb_price<%=i%>" value="<%=articleList.get(i).getPrd_price()%>" readonly></td>
						<% q_p = articleList.get(i).getPrd_price()*articleList.get(i).getPrd_qant();%>
						<td><input type="number" name="q_p" value="<%= q_p %>"readonly></td>
						<td><a href="shop_bak_one_delete.sp?b_id=<%=id%>&prd_no=<%=articleList.get(i).getPrd_no()%>"><input type="button" value="삭제"></a></td>
						<% total = total + q_p;%>
					</tr>
					<%} %>
					<tr>
						<td colspan="2">장바구니 총합 금액 : </td>
						<td colspan="2"><input type="text" name="total" value="<%=total%>" readonly></td>
						<td><a href ="sb_back_clear.sp?b_id=<%=id%>"><input type="button" value="전부삭제"></a></td>
						<td><input type="submit" value="구매"></td>
						<td><a href="kreble.sp"><input type="button" value="쇼핑홈"></a></td>
					</tr>
				</table>	
			</div>
		</article>
			
		
		<%String prd_cata="shop_back_page.sp?page=";%>
		<!-- 페이지 이전/다음 넘김 -->
		<article id="pl_art_no5">
				<%if(nowPage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
			<a href="<%=prd_cata %><%=nowPage-1%>">[이전]</a>&nbsp;
				<%} %>
		
				<%for(int a=startPage;a<=endPage;a++){
						if(a==nowPage){%>
				[<%=a %>]
				<%}else{ %>
			<a href="<%=prd_cata %><%=a %>">[<%=a %>]
			</a>&nbsp;
				<%} %>
				<%} %>
		
				<%if(nowPage>=maxPage){ %>
				[다음]
				<%}else{ %>
			<a href="<%=prd_cata %><%=nowPage+1 %>">[다음]</a>
				<%} %>
		</article>
				<%
			    }
				else
				{
				%>
		<article id="emptyArea">
			<div>
				등록된 글이 없습니다.
			</div>
		</article>
				<%
				}
				%>
		<!-- 여분 -->
		<article id="sb_art_no4">
		</article>	
	
		<!-- 여분 -->
		<article id="sb_art_no5">
		</article>
	</form>
	</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>