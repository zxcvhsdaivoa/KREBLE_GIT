<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.KreblechoiData" %>
<!doctype html>
<html>
<head> <!-- 문서정보 -->
	<meta charset="utf-8">
	<title>kreble</title>
	<style>

	</style>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/kreblechoi.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/kreblechoi.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<!--<jsp:useBean id="info" class="use_data.Db_method_rent" />-->


<body >


  <jsp:include page="Header_baseform.jsp"/>
	<section>
		<div class="section_inner">
			<div class="stadium">
				<div class="content_head">
					<!-- <h3>시민구장 정보</h3> -->
				</div>
				<div class="stadium_inner">
					<div class="sub_nav">
						<ul>
							<li><a href="#">홈</a></li>
							<li><a href="#">예약/대여</a></li>
							<li><a href="#" style="color: blue;"><b>시민구장 정보</b></a></li>
						</ul>
					</div>
					<div class="stadium_list">
						<span>자주가는 구장</span>
						
						
						<div class="favorite_stadium">
							<ul>
								<li class="default"><a href="#">구장1</a></li>
								<li class="default"><a href="#">구장2</a></li>
								<li class="default"><a href="#">구장3</a></li>
								<li class="default"><a href="#">구장4</a></li>
								<li id="savebtn"><span id="plusbu"><a href="#"></a></span></li>
								<li><span id="minusbu"><a href="#"></a></span></li>
							</ul>
						</div>
						<ul class="local_stadium">
							<li class="local">
								<a href="#">서울</a>
								<ul>
									<li id="s_000"><a>잠실종합운동장</a></li>
									<li id="s_001"><a>노량진 축구장</a></li>
									<li id="s_002"><a>월곡인조잔디<br>축구장</a></li>
									<li id="s_003"><a>은평구립 축구장</a></li>
									<li id="s_004"><a>천마공원 축구장</a></li>
									<li id="s_005" style="border-right: none;"><a>창골 축구장</a></li>
								</ul>
							</li>
							<li class="local">
								<a href="#">인천</a>
								<ul>
									<li id="i_000"><a>인천대공원<br>축구장</a></li>
									<li id="i_001"><a>인천축구전용<br>경기장</a></li>
									<li id="i_002"><a>강서개화 축구장</a></li>
									<li id="i_003"><a>드림파크문화재단 <br>축구장</a></li>
									<li id="i_004"><a>주안더월드<br>스테이트</a></li>
								</ul>
							</li>
							<li class="local">
								<a href="#">경기</a>
								<ul>
									<li id="g_000"><a>부천체육관<br>축구장</a></li>
									<li id="g_001"><a>솔터 축구장</a></li>
									<li id="g_002"><a>의왕 축구장</a></li>
									<li id="g_003"><a>수원종합 운동장</a></li>
									<li id="g_004"><a>광명시 축구장</a></li>
									<li style="border-right: none;"><a href="#">구리시체육회<br>축구장</a></li>
								</ul>
							</li>
							<li class="local">
								<a href="#">대구</a>
								<ul>
									<li id="d_000"><a>대구경북<br>과학기술원축구장</a></li>
									<li id="d_001"><a>논공축구장</a></li>
									<li id="d_002"><a>DGB대구<br>은행파크</a></li>
								</ul>
							</li>
							<li class="local">
								<a href="#">대전</a>
								<ul>
									<li id="dd_000"><a>유등천 축구장</a></li>
									<li id="dd_001"><a>중구체육복지센터<br>축구장</a></li>
									<li id="dd_002"><a>사정동<br>잔디축구장</a></li>
									<li id="dd_003"><a>관저체육공원</a></li>
								</ul>
							</li>
							<li class="local">
								<a href="#">부산</a>
								<ul>
									<li id="b_000"><a>영도마린 축구장</a></li>
									<li id="b_001"><a>남부환경체육공원</a></li>
									<li id="b_002"><a>삼락강변체육공원</a></li>
									<li id="b_003"><a>다대풋살센터</a></li>
									<li id="b_004"><a>기장군<br>월드컵빌리지</a></li>
								</ul>
							</li>
							<li class="local">
								<a href="#">제주</a>
								<ul>
									<li id="j_000"><a>중문단지 축구장</a></li>
									<li id="j_001"><a>사라봉 축구장</a></li>
									<li id="j_002"><a>외도 축구장</a></li>
								</ul>
							</li>
						</ul>
					</div>
			</div>
			<%
				KreblechoiData field_list=(KreblechoiData) request.getAttribute("field_list");
			%>
			<form>
				<div class="stadium_name">
					<span><%= field_list.getFullname()%></span>
				</div>
				<div class="stadium_info">
					<div class="stadium_img">
					<img style="width: 100%; height:100%; border-radius: 7px;" src="image/rent_stardium/<%=field_list.getField_image() %>.jpg">
					</div>	
					<div class="detail_info">
						<table style="height: 507px">
							<tr>
								<th>위치</th>
								<td><%= field_list.getField_location() %>
									<a href="<%=field_list.getField_map() %>" target="black"><img class="mapbtn" src="image/rent_stardium/kakaobu.jpg"></a> 
								</td>
							</tr>
							<tr>
								<th>명칭</th>
								<td><%= field_list.getField_name() %></td>
							</tr>
							<tr>
								<th>대지면적</th>
								<td><%= field_list.getField_area() %> ㎡</td>
							</tr>
							<tr>
								<th>이용시간</th>
								<td><%= field_list.getField_usetime() %></td>
							</tr>
							<tr>
								<th>주요시설</th>
								<td><%= field_list.getField_facility() %></td>
							</tr>
							<tr>
							<th>전화</th>
								<td><%= field_list.getField_call() %></td>
							</tr>
						</table>
						<input type="button" value="예약하기" class="rent_btn" style="display: none;">
					</div>
				</div>
			</form>
			<div class="topbutton"><a href="#"><img src="image/arrow_bu.png"></a></div>
			<div class="botmessage">입장 지연의 불편을 최소화 하기 위해 10분 전 퇴실 준비를 부탁드립니다.<br>자세한 문의사항은 기재되어 있는 연락망을 통해 문의바랍니다.<br>더욱 안정적이고 편리한 서비스를 제공하는 <img src="image/logo_ver3.png"> 이 되겠습니다.
			<br>감사합니다.
			</div>
		</div>
	</div>
	</section>

	
	<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>
