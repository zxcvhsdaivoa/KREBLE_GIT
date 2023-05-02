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
		<!-- 활동현황/보유캐쉬 -->
		<article id="article_no1">
			<div>
				<ul>
					<li>
						<span>My</span><br>
						<span>Kreble</span>
					</li>
					<li>
						<span>MySquad 게시글</span><br>
						<span><%=sqs%>개</span>
					</li>
					<li>
						<span>경기장 대여</span><br>
						<span>@@개</span>
					</li>
					<li>
						<span>관심 품목</span><br>
						<span><%=lis%>개</span>
					</li>
					<li>
						<span>장바구니</span><br>
						<span><%=cas%>개</span>
					</li>
					<li>
						<span>보유 캐쉬 : &#x20A9;<%=uc%></span><br>
						<span>캐쉬충전하기</span>
					</li>
				</ul>
			</div>
		</article>
		
		<!-- 프로필사진 / 닉네임 / 마이스쿼드 -->
		<article id="article_no2">
			<div class = "f_div">
				<div> 프로필사진 / 사진수정 </div>
				<div> 닉네임 / 닉네임수정수정 </div>
			</div>
			<div class = "l_div"> 
				<div> ID 님 환영합니다. </div>
				<div class="commu_wrap wrap1">
				<h4>베스트 스쿼드</h4>
    			<div class="squad_wrap">
    				<p class="squad_name">스쿼드 이름 : <%=squad_al.getSquad_name()%></p>
    				<p class="squad_make">작성자 : <%= id %></p>
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
				<h4><%=id%>님의 경기장 대여 리스트</h4>
			</div>
			<div>
				<span>경기장 대여 리스트</span>
			</div>
		</article>
		
		<!-- 관심상품리스트 -->
		<article id="article_no4">
			<div><!-- 관심품목 라벨 -->
				<h4><%=id%>님의 관심상품</h4>
			</div>
			<div><!-- 관심품목 리스트 -->
				<table>
					<tr>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 색상</th>
						<th>상품 평점</th>
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
				<h4><%=id%>님의 장바구니</h4>
			</div>
			<div><!-- 장바구니 리스트 -->
				<table>
					<tr>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 색상</th>
						<th>상품 평점</th>
					</tr>
				<%
				for(int l = 0; l < plike_al.size(); l++){
					String impt = ect.img_link(pcart_al.get(l).getPrd_no());
				%>
					<tr>
						<td><a href ="#"><img src="<%=impt%><%=pcart_al.get(l).getPrd_img()%>"></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_name()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_price()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_color()%></a></td>
						<td><a href ="#"><%=pcart_al.get(l).getPrd_re_sc()%></a></td>
					</tr>	
				<%	
				}	
				%>				
				</table>
			</div>
		</article>
		
		<article id="article_no6">
			프로필 수정 버튼 / 탈퇴버튼
		</article>
	</div>
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>