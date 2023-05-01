<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 동의</title>
<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
<link rel="stylesheet" type="text/css" href="css/field_rent.css">
<link rel="stylesheet" type="text/css" href="css/field_rent_agree.css">
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
				<li class="step2"><span class="step_txt2" style="color:#009ce1;">약관동의</span></li>
				<li class="step3"><span class="step_txt">신청완료</span></li>
			</ul>
			<form>
			<div id="content2">
				<div class="content2_box">
					<h3 class="box_text">준수사항</h3>
				</div>
				
				<div class="box_inner">
				  <div class="box_inner_text">
				  	<span style="font-size: 19px;"><b>1.이용규칙</b></span><br><br>
				  	<div style="background-color: #fff; border: 1px solid #a6a6a6;">
				  		<span style="font-size: 20px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</span><br><br>
				  	</div>
				  	<br><input type="checkbox"> 동의합니다<br><br>
				  	<span style="font-size: 19px;"><b>2.주의사항</b></span><br><br>
				  	<div style="background-color: #fff; border: 1px solid #a6a6a6;">
				  		<span style="font-size: 20px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</span><br><br>
				  	</div>
				  	<br><input type="checkbox"> 동의합니다
				  </div>
				
				  <div class="calendar" id="calendar">
				  	
				  </div>
				</div>
				
				<div id="info_box">
					<h3 class="box_text">개인정보수집 동의</h3>
				</div>
				<div class="box_inner2">

				</div>
				<div class="btn_area">
					<a class="payment_btn" href="#">다음으로</a>
				</div>
			</div>
			</form>
		</div>

	</section>
	 <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>