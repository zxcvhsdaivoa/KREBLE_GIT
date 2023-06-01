<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd"%>
<%@ page import="use_data.UserData"%>
<%@ page import="use_data.Player_Info"%>
<%@ page import="use_data.Director_Info"%>
<%@ page import="vo.field_save_Data"%>
<%@ page import="vo.SquadInfo"%>
<%@ page import="vo.Rent_situation"%>
<%@ page import="use_data.Player_Info"%>

<% request.setCharacterEncoding("utf-8"); %>
<% 
String id = (String) session.getAttribute("ID"); 
%>
	<jsp:useBean id="cash" class="use_data.Db_method_user"></jsp:useBean>
	<jsp:useBean id="player" class="use_data.Db_method_player" />
	<jsp:useBean id="shop" class="use_data.Db_method_shop" />
	<jsp:useBean id="rent" class="use_data.Db_method_rent" />
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
	ArrayList<Rent_situation> myrent = (ArrayList<Rent_situation>)request.getAttribute("myrent");//대여 내역 가져오기
    String nowPage = (String)request.getAttribute("page");
	String sqs = (String) request.getAttribute("sqs");
	String cas = (String) request.getAttribute("cas");
	String lis = (String) request.getAttribute("lis");
	int rent_si = (int) request.getAttribute("rent");
	
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
						<th class = "no1_td2 onhover" rowspan="2">MySquad 게시글</th>
						<th class = "no1_td3 onhover" rowspan="2">경기장 임대 현황</th>
						<th class = "no1_td4 onhover" rowspan="2">관심 품목</th>
						<th class = "no1_td5 onhover" rowspan="2">장바구니 등록</th>
						<th class = "no1_td6">보유캐쉬</th>
					</tr>
					<tr>
						<td class = "no1_td1" rowspan="2">My<br>KEABLE</td>
						<td class = "no1_td6">&#x20A9;<%=uc%></td>
					</tr>
					<tr>
						<td class = "no1_td2 onhover"><%=sqs%>개</td>
						<td class = "no1_td3 onhover"><%=rent_si%>개</td>
						<td class = "no1_td4 onhover"><%=lis%>개</td>
						<td class = "no1_td5 onhover"><%=cas%>개</td>
						<td class = "no1_td6"><input type="hidden" value="<%=id%>">
						<input type="button" name="cash_re" value = "캐쉬충전" class="cash_re"></td>
					</tr>
				</table>
			</div>
		</article>
		
		<!-- 프로필사진 / 닉네임 / 마이스쿼드 -->
		<article id="article_no2">
			<div class="commu_wrap wrap1">
				<h4>
					<%=user_al.getNick()%>님의 베스트 스쿼드
					<a href="squadList.sq"><input type="button" value="바로가기" class="p_right"></a>
				</h4>
				<div class = "center_only">
					<div class = "arti_no2_prof_img">
						<img onerror="this.src='image/no_image.PNG'" src="image/user_p_img/<%=id%>.jpg">
					</div>
					<div class="squad_wrap">
	    				<%if(!squad_al.getUser_id().equals("nosquad")) {%>
	    				<p class="squad_name">스쿼드 이름 : <%=squad_al.getSquad_name() %></p>
						<ul>
						<%
						Director_Info hotsquad_director = player.hot_squad_director(squad_al.getDirector());
						%>
							<li class="director"><span class="player_img"><img src="image/player_img/<%=hotsquad_director.getDirector_name() %>.jpg" onerror="this.src='image/no_image.PNG'"></span><p class="name"><%=hotsquad_director.getDirector_ko_name() %></p></li>
						<%
						ArrayList<Player_Info> hotsquad_player = player.hot_squad_player(squad_al);
						for(int i=0; i<11; i++){
						%>
							<li class="player"><span class="player_img"><img src="image/player_img/<%=hotsquad_player.get(i).getPlayer_name() %>.jpg" onerror="this.src='image/no_image.PNG'"></span><p class="name"><%=hotsquad_player.get(i).getPlayer_ko_name() %></p></li>
						<%} %>
						</ul>
					<%} else {%>
						<div class = "sq_no_data">스쿼드가 존재하지 않습니다<br>
						<div class = "sqmk_go"><a href = "squad.sq">스쿼드 만들러가기</a></div>
						</div>
					<%} %>
					</div>
				</div>
			</div>
		</article>
		
		<!-- 경기장 렌트 -->
		<article id="article_no3">
			<div><!-- 경기장렌트 라벨 -->
				<h4><%=user_al.getNick()%>님의 경기장 대여 리스트</h4>
			</div>
			<div class="center_only">
				<table>
					<tr>
						<th>지역</th>
						<th>구장 명</th>
						<th>대여 일자</th>
						<th>대여 가격</th>
					</tr>
				<%
				for(int l = 0; l < myrent.size(); l++){
				%>
					<tr>
						<td><a href ="#"><%=myrent.get(l).getRent_location()%></a></td>
						<td><a href ="#"><%=myrent.get(l).getField_name()%></a></td>
						<td><a href ="#"><%=myrent.get(l).getRent_date()%></a></td>
						<td><a href ="#"><%=myrent.get(l).getRent_price()%>원</a></td>
					</tr>	
				<%	
				}	
				%>				
				</table>
			</div>
		</article>
		
		<!-- 관심상품리스트 -->
		<article id="article_no4">
			<div><!-- 관심품목 라벨 -->
				<h4><%=user_al.getNick()%>님의 관심상품
				<a href="shop_list_action.sp"><input type="button" value="바로가기" class="p_right"></a>
				</h4>
			</div>
			<div class="center_only"><!-- 관심품목 리스트 -->
				<table>
					<tr>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 색상</th>
						<th>재고량</th>
					</tr>
				<%
				for(int l = 0; l < plike_al.size(); l++){
					String impt = ect.img_link(plike_al.get(l).getPrd_no());
				%>
					<tr>
						<td><a href ="#"><img onerror="this.src='image/no_image.PNG'" src="<%=impt%><%=plike_al.get(l).getPrd_img()%>"></a></td>
						<td><a href ="shop_prd_detail.sp?prd_no=<%=plike_al.get(l).getPrd_no()%>&page=<%=nowPage%>"><%=plike_al.get(l).getPrd_name()%></a></td>
						<td><a href ="#"><%=plike_al.get(l).getPrd_price()%></a></td>
						<td><a href ="#"><%=plike_al.get(l).getPrd_color()%></a></td>
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
				<h4><%=user_al.getNick()%>님의 장바구니
				<a href="shop_back_page.sp"><input type="button" value="바로가기" class="p_right"></a>
				</h4>
			</div>
			<div class="center_only"><!-- 장바구니 리스트 -->
				<table>
					<tr>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 색상</th>
						<th>재고량</th>
					</tr>
				<%
				for(int l = 0; l < pcart_al.size(); l++){
					String impt = ect.img_link(pcart_al.get(l).getPrd_no());
				%>
					<tr>
						<td><a href ="#"><img onerror="this.src='image/no_image.PNG'" src="<%=impt%><%=pcart_al.get(l).getPrd_img()%>"></a></td>
						<td><a href ="shop_prd_detail.sp?prd_no=<%=pcart_al.get(l).getPrd_no()%>&page=<%=nowPage%>"><%=pcart_al.get(l).getPrd_name()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_price()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_color()%></a></td>
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
				<input type="button" name= "p_update" value="회원정보수정" class = "p_update hide_only">
				<input type="button" name= "p_delete" value="회원탈퇴" class = "p_delete hide_only">
			</div>
		</article>
	</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>