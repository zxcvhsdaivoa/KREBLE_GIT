<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd"%>
<%@ page import="use_data.UserData"%>
<%@ page import="vo.field_save_Data"%>
<%@ page import="vo.SquadInfo"%>
<%@ page import="use_data.Player_Info"%>

<% request.setCharacterEncoding("utf-8"); %>
<% 
String id = (String) session.getAttribute("ID"); 
%>
	<jsp:useBean id="cash" class="use_data.Db_method_user"></jsp:useBean>
	<jsp:useBean id="player" class="use_data.Db_method_player" />
	<jsp:useBean id="shop" class="use_data.Db_method_shop" />
	<jsp:useBean id="ect" class="use_data.Db_method_ECT" />
	<%
	int uc = cash.u_cash(id);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/user_mypage.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	<script src="js/user_mypage.js"></script>
	<%
	UserData user_al = (UserData) request.getAttribute("user_al");//유저정보가져오기
// 	field_save_Data field_al = (field_save_Data)request.getAttribute("field_al");//필드 정리되면 수정해야됨
	ArrayList<Shop_prd> plike_al = (ArrayList<Shop_prd>)request.getAttribute("plike_al");//관심상품 가져오기
	ArrayList<Shop_prd> pcart_al = (ArrayList<Shop_prd>)request.getAttribute("pcart_al");//장바구니가져오기
	SquadInfo squad_al = (SquadInfo)request.getAttribute("squad_al");//마이스쿼드 가져오기
    String nowPage = (String)request.getAttribute("page");
	String sqs = (String) request.getAttribute("sqs");
	String cas = (String) request.getAttribute("cas");
	String lis = (String) request.getAttribute("lis");
	
	%>
	
<title>MyPage</title>
</head>
<body>
		
    <!-- header -->
	<jsp:include page="Header_baseform.jsp"/>

	<!-- section -->
	<section>
	<div id="center_margin"><!-- 중앙정렬용 div -->
		<article id="article_no0">
			<H1> <%=user_al.getNick()%>님의 활동 내역</H1>
		</article>
		<!-- 활동현황/보유캐쉬 -->
		<article id="article_no1">
			<div>
				<table>
					<tr>
						<th class = "no1_td1"><%=id%></th>
						<th class = "no1_td2">MySquad</th>
						<th class = "no1_td3">경기장 임대</th>
						<th class = "no1_td4">관심</th>
						<th class = "no1_td5">장바구니</th>
						<th class = "no1_td6">보유캐쉬</th>
					</tr>
					<tr>
						<td class = "no1_td1" rowspan="2">My<br>KEABLE</td>
						<td class = "no1_td2">게시글</td>
						<td class = "no1_td3">현황</td>
						<td class = "no1_td4">품목</td>
						<td class = "no1_td5">등록</td>
						<td class = "no1_td6">&#x20A9;<%=uc%></td>
					</tr>
					<tr>
						<td class = "no1_td2"><%=sqs%>개</td>
						<td class = "no1_td3">@@개</td>
						<td class = "no1_td4"><%=lis%>개</td>
						<td class = "no1_td5"><%=cas%>개</td>
						<td class = "no1_td6"><input type="hidden" value="<%=id%>">
						<input type="button" name="cash_re" value = "캐쉬충전" class="cash_re"></td>
					</tr>
				</table>
			</div>
		</article>
		
		<!-- 프로필사진 / 닉네임 / 마이스쿼드 -->
		<article id="article_no2">
			<div class = "f_div">
				<h4> <%=user_al.getNick()%></h4>
				<div> 프로필사진 </div>
			</div>
			<div class = "l_div"> 
				<div class="commu_wrap wrap1">
				<h4>베스트 스쿼드</h4>
    			<div class="squad_wrap">
    				<p class="squad_name">스쿼드 이름 : <%=squad_al.getSquad_name()%></p>
					<ul>
						<li class="director"><span class="player_img"><img src="image/player_img/<%=squad_al.getDirector()%>.jpg"></span><p class="name"><%=squad_al.getDirector()%></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer1() %>.jpg"></span><p class="name"><%=squad_al.getPlayer1() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer2() %>.jpg"></span><p class="name"><%=squad_al.getPlayer2() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer3() %>.jpg"></span><p class="name"><%=squad_al.getPlayer3() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer4() %>.jpg"></span><p class="name"><%=squad_al.getPlayer4() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer5() %>.jpg"></span><p class="name"><%=squad_al.getPlayer5() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer6() %>.jpg"></span><p class="name"><%=squad_al.getPlayer6() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer7() %>.jpg"></span><p class="name"><%=squad_al.getPlayer7() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer8() %>.jpg"></span><p class="name"><%=squad_al.getPlayer8() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer9() %>.jpg"></span><p class="name"><%=squad_al.getPlayer9() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer10() %>.jpg"></span><p class="name"><%=squad_al.getPlayer10() %></p></li>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=squad_al.getPlayer11() %>.jpg"></span><p class="name"><%=squad_al.getPlayer11() %></p></li>
					</ul>
				</div>
				</div>
			</div>
		</article>
		
		<!-- 경기장 렌트 -->
		<article id="article_no3">
			<div><!-- 관심품목 라벨 -->
				<h4><%=user_al.getNick()%>님의 경기장 대여 리스트</h4>
			</div>
			<div>
				<span>경기장 대여 리스트</span>
			</div>
		</article>
		
		<!-- 관심상품리스트 -->
		<article id="article_no4">
			<div><!-- 관심품목 라벨 -->
				<h4><%=user_al.getNick()%>님의 관심상품</h4>
			</div>
			<div class="center_only"><!-- 관심품목 리스트 -->
				<table>
					<tr>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 색상</th>
						<th>상품 평점</th>
						<th>재고량</th>
					</tr>
				<%
				for(int l = 0; l < plike_al.size(); l++){
					String impt = ect.img_link(plike_al.get(l).getPrd_no());
				%>
					<tr>
						<td><a href ="#"><img alt="No Data" src="<%=impt + plike_al.get(l).getPrd_img()%>"></a></td>
						<td><a href ="#"><%=plike_al.get(l).getPrd_name()%></a></td>
						<td><a href ="#"><%=plike_al.get(l).getPrd_price()%></a></td>
						<td><a href ="#"><%=plike_al.get(l).getPrd_color()%></a></td>
						<td><a href ="#"><%=plike_al.get(l).getPrd_re_sc()%></a></td>
						<td><a href ="#"><%=plike_al.get(l).getPrd_qant()%></a></td>
					</tr>	
				<%	
				}	
				%>				
				</table>
			
			</div>
			
		</article>
		
		<!-- 장바구니리스트 -->
		<article id="article_no5">
			<div><!-- 장바구니 라벨 -->
				<h4><%=user_al.getNick()%>님의 장바구니</h4>
			</div>
			<div class="center_only"><!-- 장바구니 리스트 -->
				<table>
					<tr>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 색상</th>
						<th>상품 평점</th>
						<th>재고량</th>
					</tr>
				<%
				for(int l = 0; l < pcart_al.size(); l++){
					String impt = ect.img_link(pcart_al.get(l).getPrd_no());
				%>
					<tr>
						<td><a href ="#"><img src="<%=impt%><%=pcart_al.get(l).getPrd_img()%>"></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_name()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_price()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_color()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_re_sc()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_qant()%></a></td>
					</tr>	
				<%	
				}	
				%>				
				</table>
			</div>
		</article>
		
		<article id="article_no6">
			<div>
				<input type="button" name= "p_update" value="회원정보수정" class = "p_update">
				<input type="button" name= "p_delete" value="회원탈퇴" class = "p_delete">
			</div>
		</article>
	</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>