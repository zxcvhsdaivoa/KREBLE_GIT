<%@page import="vo.Rent_situation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<jsp:useBean id="ud" class="use_data.Db_method_ECT"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	Rent_situation rent_situation=(Rent_situation) request.getAttribute("rent_situation");
%>
<title>예약 동의</title>
<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
<link rel="stylesheet" type="text/css" href="css/field_rent.css">
<link rel="stylesheet" type="text/css" href="css/field_rent_finish.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
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
					<h1>예약신청</h1>
				</div>
			</div>
			
			<ul class="rent_step">
				<li class="step1"><span class="step_txt">예약선택</span></li>
				<li class="step2"><span class="step_txt">약관동의</span></li>
				<li class="step3"><span class="step_txt3" style="color:#009ce1;">신청완료</span></li>
			</ul>
			<form>
			<div id="content2">
				<div class="content2_box">
					<h3 class="box_text">완료내역</h3>
				</div>
				
				<div class="box_inner">
				  <div class="box_inner_text">
				  	<span style="font-size: 19px;"><b>신청하신 내역입니다.</b></span><br><br>
				  	<div style="background-color: #fff; border: 1px solid #a6a6a6;">
				  		아이디:<br><br>
				  		구장명:<br><br>
				  		예약 날짜: <%=ud.date_format(rent_situation.getRent_date(),"yyyy-mm-dd hh:mm") %><br><br>
				  		금액:<br><br>
				  	</div>
				  </div>
				
				  <div class="calendar" id="calendar">
				  	
				  </div>
				</div>
				
				<div class="btn_area">
					<a class="payment_btn" href="#">처음으로</a>
				</div>
			</div>
			</form>
		</div>

	</section>
	 <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>