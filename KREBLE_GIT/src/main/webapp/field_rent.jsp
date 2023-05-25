<%@page import="vo.Rent_situation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.KreblechoiData"%>
<%@page import="vo.Rent_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String id = (String) session.getAttribute("ID");
%>
<title>구장 예약</title>
<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
<link rel="stylesheet" type="text/css" href="css/field_rent.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/field_rent.js"></script>
<script type="text/javascript" ></script>
<body>
	<jsp:include page="Header_baseform.jsp"/>
	<section>
		<div id="topbg">
			<div class="topinner">
				<p class="toptext">KREBLE
					<span class="toptext2">시민구장 예약</span>
				</p>
			</div>
		</div>
		<div id="main_content">
			<div class="content_top">
				<div class="top_text">
					<h1 style="margin-bottom: 10px;">예약신청</h1>
				</div>
			</div>
			
			<ul class="rent_step">
				<li class="step1"><span class="step_txt1" style="color:#009ce1;">예약선택</span></li>
				<li class="step2"><span class="step_txt">약관동의</span></li>
				<li class="step3"><span class="step_txt">신청완료</span></li>
			</ul>
			<form action="rent_agree.choi">
				<div class="selc_list">
					<select class="loca" name="location" id="location">
						<option selected disabled>지역 선택</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
						<option value="대구">대구</option>
						<option value="대전">대전</option>
						<option value="부산">부산</option>
						<option value="제주">제주</option>
					</select>
					<select class="starlist" id="field_selc" name="field_selc">
						<option selected disabled>경기장 목록(지역 우선 선택)</option>
					</select>
						
				</div>
			
			
				<div id="content2">
					<div class="hide_box">
						<div class="content2_box">
							<h3 class="box_text">날짜/시간선택</h3>
						</div>
						
						<div class="box_inner">
							<div class="date_selc">
								<select id="month" name="month" class="month_selc" >
									<option value="" data-month="">날짜를 선택해주세요</option>
									<option value="2023년 04월" data-month="4">2023년 04월</option>
									<option value="2023년 05월" data-month="5">2023년 05월</option>
									<option value="2023년 06월" data-month="6">2023년 06월</option>
									<option value="2023년 07월" data-month="7">2023년 07월</option>
								</select>
							</div>
						
							<div class="calendar" id="calendar">
							
							</div>
						</div>
					</div>
					<div class="hide_box2">
						<div id="info_box">
							<h3 class="box_text">신청정보</h3>
						</div>
						<div class="box_inner2"> <!-- js를 통해 field_rent_time.jsp에서 값을 ajax를 이용해 가져옴 -->
							<input type="radio" name="rent_time" value="" data-price=""><span></span><br>
							<input type="radio" name="rent_time" value="" data-price=""><span></span><br>
							<input type="radio" name="rent_time" value="" data-price=""><span></span><br>
							<input type="radio" name="rent_time" value="" data-price=""><span></span><br>
							<input type="radio" name="rent_time" value="" data-price=""><span></span><br>
						</div>
						<div class="content3_box">
							<h3 class="box_text">
								<input type="hidden" name="rent_price" value="">
								비용:<span style="color: #f24400;">0원</span>
							</h3>
						</div>
					</div>
					<div class="btn_area hide_box3">
						<input type="submit" class="payment_btn" value="다음으로">
						<input type="hidden" name="rentDate" id="rentDate">
					</div>
				</div>
			</form>
		</div>
		</section>
	 <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>
