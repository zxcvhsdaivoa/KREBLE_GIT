<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!doctype html>
<html>
 <head>
   <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link href="https://fonts.googleapis.com/css?family=Kirang+Haerang:400" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Labrada:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron&family=Righteous&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
   <title>
    축구팀프
   </title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/index.js" ></script>
<script>
    
</script>
 <body>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="comu" class="use_data.Db_method_commu" />
<jsp:useBean id="player" class="use_data.Db_method_player" />
<jsp:useBean id="shop" class="use_data.Db_method_shop" />
<jsp:useBean id="rent" class="use_data.Db_method_rent" />
<jsp:useBean id="ect" class="use_data.Db_method_ECT" />
<jsp:useBean id="nick" class="svc.IdToNickService" />
<%@ page import="use_data.CommunityData"%>
<%@ page import="use_data.Player_Info"%>
<%@ page import="use_data.Director_Info"%>
<%@ page import="use_data.Shop_prd"%>
<%@ page import="use_data.Shop_reform_db"%>
<%@ page import="vo.SquadInfo"%>
<%@ page import="vo.KreblechoiData"%>
  <jsp:include page="Header_baseform.jsp"/>
  <!--section-->
  <section>
    <div id="content1">
    	<div class="content_inner">
    		<div class="title_box">
    			<h3>정보소개</h3>
    			<a href="#" class="link_button">정보소개 바로가기</a>
    		</div>
    		<div class="info_wrap">
    			<div class="even_slick slick_box">
    				
    			</div>
    			<div class="odd_slick slick_box">
    				
    			</div>
    		</div>
    	</div>
    </div>
    <div id="content2">
    	<div class="content_inner">
    		<div class="title_box">
    			<h3>유저커뮤니티</h3>
    			<a href="#" class="link_button">커뮤니티 바로가기</a>
    		</div>
    		<div class="commu_wrap wrap1">
    		<%SquadInfo hot_squad= player.hotSquad(); %>
    			<h4>베스트 스쿼드</h4>
    			<div class="squad_wrap">
    			<%if(!hot_squad.getUser_id().equals("nosquad")) {%>
    				<p class="squad_name">스쿼드 이름 : <%=hot_squad.getSquad_name() %></p>
    				<p class="squad_make">작성자 : <%=nick.getNickname(hot_squad.getUser_id()) %></p>
					<ul>
					<%
					Director_Info hotsquad_director = player.hot_squad_director(hot_squad.getDirector());
					%>
						<li class="director"><span class="player_img"><img src="image/player_img/<%=hotsquad_director.getDirector_name() %>.jpg"></span><p class="name"><%=hotsquad_director.getDirector_ko_name() %></p></li>
					<%
					ArrayList<Player_Info> hotsquad_player = player.hot_squad_player(hot_squad);
					for(int i=0; i<11; i++){
					%>
						<li class="player"><span class="player_img"><img src="image/player_img/<%=hotsquad_player.get(i).getPlayer_name() %>.jpg"></span><p class="name"><%=hotsquad_player.get(i).getPlayer_ko_name() %></p></li>
					<%} %>
					</ul>
				<%} else {%>
				스쿼드가 존재하지 않습니다
				<%} %>
				</div>
    		</div>
    		<div class="commu_wrap wrap2">
    			<h4>화제의 게시글</h4>
    			<div class="hot_commu free_hot">
    			<%
    			CommunityData hot_free = comu.hot_commu("free");
    			%>
    				<span>자유게시판 화제글</span>
    			<%if(!hot_free.getId().equals("nocommu")){ %>
    				<div class="board">
    					<div class="board_top">
    						<p class="title"><%=hot_free.getComu_title() %></p>
    						<span class="writer"><%=nick.getNickname(hot_free.getId()) %></span>
    					</div>
						<textarea readonly><%=hot_free.getComu_write() %></textarea>
    				</div>
    			<%}else{ %>
    			게시글이 존재하지 않습니다
    			<%} %>
    			</div>
    			<div class="hot_commu debate_hot">
    			<%
    			CommunityData hot_debate = comu.hot_commu("debate");
    			%>
    				<span>토론게시판 화제글</span>
    			<%if(!hot_debate.getId().equals("nocommu")){ %>
    				<div class="board">
    					<div class="board_top">
    						<p class="title"><%=hot_debate.getComu_title() %></p>
    						<span class="writer"><%=nick.getNickname(hot_debate.getId()) %></span>
    					</div>
						<textarea readonly><%=hot_debate.getComu_write() %></textarea>
    				</div>
    			<%}else{ %>
    			게시글이 존재하지 않습니다
    			<%} %>
    			</div>
    			<div class="hot_commu info_hot">
    			<%
    			CommunityData hot_info = comu.hot_commu("info");
    			%>
    				<span>정보게시판 화제글</span>
    			<%if(!hot_info.getId().equals("nocommu")){ %>
    				<div class="board">
    					<div class="board_top">
    						<p class="title"><%=hot_info.getComu_title() %></p>
    						<span class="writer"><%=nick.getNickname(hot_info.getId()) %></span>
    					</div>
						<textarea readonly><%=hot_info.getComu_write() %></textarea>
    				</div>
    			<%}else{ %>
    			게시글이 존재하지 않습니다
    			<%} %>
    			</div>
    		</div>
    	</div>
    </div>
        <div id="content3">
    	<div class="content_inner">
    		<div class="title_box">
    			<h3>예약/대여</h3>
    		</div>
    		<div class="rent_wrap wrap1">
    			<span class="rent_wrap1_content">사용자님들의 잊고 싶지 않았던 구장!</span><br>
    			<span>진땀승부의 추억을 공유했던 그 때 그 장소</span>
    			<i></i>
    			<p class="rent_wrap1_content2">다양한 KREBLE에서 제공되는 서비스를 사용하실 수 있는 기회를 놓치지마세요.</p>
    			<a href="fieldInfo.choi?field_id=s_000" class="rent_wrap1_content3">바로가기</a>
    			<div class="back-bg"></div>
    		</div>
    		<div class="rent_wrap wrap3">
    		<%
    		String[] mostfield= rent.most_rent();
    		KreblechoiData mostField=null;
    		for(int i=0; i<3; i++){
    			mostField = rent.most_field(mostfield[i]);
    			int count = rent.rent_count(mostfield[i]);
    		%>
	    			<table <%if(i==0){%>class="hovered"<%} %>>
	    				<tr class="top">
	    					<td colspan="4">인기 대여구장<p></p>Top<%=i+1 %> : <%= mostField.getField_name() %></td>
	    				</tr>
						<tr class="notop">
							<td>위치</td>
							<td><%= mostField.getField_location() %></td>
							
							<td>전화</td>
							<td><%= mostField.getField_call() %></td>
						</tr>
						<tr class="notop">
							<td>총 대여자 현황</td>
							<td><%= count %> 명</td>
							
							<td>대여료</td>
							<td><%= mostField.getField_price() %> 원</td>
						</tr>
						<tr class="hidden"><td><%=mostField.getField_iframe() %></td></tr>
					</table>
			<%
				}
    		%>
    		</div>
    		<div class="rent_wrap wrap4">
    			<iframe src="<%=rent.most_field(mostfield[0]).getField_iframe() %>" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
<!--     			<a href="fieldrent.choi">구장 대여하러 가기</a> -->
    		</div>
    	</div>
    </div>
    <div id="content4">
    	<div class="content_inner">
    		<div class="title_box">
    			<h3>쇼핑</h3>
    			<a href="#" class="link_button">쇼핑 바로가기</a>
    		</div>
    		<div id="best_seller">
    			<div class= "b_s_no1">
    				
    			</div>	
    		</div>
    		<div class="shop_wrap wrap1">
	    		<%
	    		String[] bestprdNo = shop.prd_re_best_no();
	    		%>
	    		<h4>BEST평점 제품</h4>
	    		<div class="best3wrap">
	    		<%for(int k=0; k<3; k++){ %>
	    		<%
	    		Shop_prd best_prd = shop.prd_re_best(bestprdNo[k]);
	    		ArrayList<Shop_prd> re_list = shop.shop_prde_reply(best_prd.getPrd_no());
	    		String imglink=ect.img_link(best_prd.getPrd_no());
	    		%>
		    		<div class="best3">
			    		<a href = "shop_prd_detail.sp?prd_no=<%=best_prd.getPrd_no()%>&page=1">
			    			<span class="prd_wrap">
			    				<img src="<%=imglink+best_prd.getPrd_no()%>.jpg">
			    				<span class="best_like_name">제품명 : <%=best_prd.getPrd_name() %></span>
			    				<span class="best_list_price">가격 : &#x20a9;<%=best_prd.getPrd_price() %></span>
			    			</span>
			    		</a>
		    			<table>
							<tr class="re_title">
								<td colspan="3" class = "h40">&#x203B;댓글은 최근 순으로 5개만 표기됩니다.</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td>평점</td>
								<td>내용</td>
							</tr>
							<%
							if(re_list!=null){
								for (int i=0; i<re_list.size();i++) {
								    out.println("<tr>");
								    out.println("<td class ='re_conten'>"+re_list.get(i).getPrd_re_id()+"</td>");
								    out.println("<td class ='re_conten'>"+re_list.get(i).getPrd_re_sc()+"</td>");
								    out.println("<td class ='re_conten'>"+re_list.get(i).getPrd_re_text()+"</td>");
								    out.println("</tr>");
								}
							}else{
							    out.println("<tr>");
							    out.println("<td colspan='4' class ='re_conten'>"+"입력된 평점이 없습니다."+"</td>");
							    out.println("</tr>");
							}
							%>
						</table>
	    			</div>
	    			<%} %>
    			</div>
    		</div>
    	</div>
    </div>
  </section>
  <jsp:include page="Footer_baseform.jsp"/>

 </body>
</html>



