<%@ page import="vo.Rent_situation"%>
<%@ page import="vo.KreblechoiData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<jsp:useBean id="ud" class="use_data.Db_method_ECT"/>
<%
	String id = (String) session.getAttribute("ID");
	String location= request.getParameter("location");
	String field_name = request.getParameter("field_selc");
 	String rent_price = request.getParameter("rent_price");
	String rent_date =request.getParameter("month")+request.getParameter("rentDate")+request.getParameter("rent_time");
	rent_date=ud.date_format(rent_date, "kortotime");
%>
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
<script src="js/field_rent_agree.js" type="text/javascript"></script>
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
			<form action="rent_insr.choi">
			<div id="content2">
				<div class="content2_box">
					<h3 class="box_text">준수사항</h3>
				</div>
				
				<div class="box_inner">
				  <div class="box_inner_text">
				  	<span style="font-size: 21px;"><b>1. 이용규칙</b></span><br><br>
				  	<div style="background-color: #fff; border: 1px solid #a6a6a6;">
				  		<span style="font-size: 16px;">
							1. 축구장 주변 시설물에는 접근 및 사용할 수 없습니다.(노후화로 인한 안전사고 위험)<br><br>
							2. 축구장내에서 흡연,음주가무,취사행위,고성방가,노상방뇨등 공원이용객의 기본교양에 어긋난 문란행위를 하지 않습니다.<br><br>
							3. 반려동물과 및 가연성 엔진을 사용하는 차량/이륜/장비의 축구장내 반입을 하지 않습니다.<br><br>
							4. 영상/음향 사용은 불가하며 필요시 시설대여담당자와 사전 협의 후 사용한다.<br><br>
							5. 축구장 입장은 사용시간 10분전에 가능하고 종료 후 다음 사용자를 위해 주변정리 후 신속히 축구장에서 퇴장 합니다.<br><br>
							6. 시설대여 참석자 모두는 징(스터드)가 있는 축구화를 착용하지 않습니다.<br><br>
							7. 입장객의 주차비는 유료이며, 축구장내 청경의 출입 제한시에는 사설 주차장을 이용합니다.<br><br>
							8. 경기장 에서 축구경기외 타종목 사용과 축구 단체강습, 개인/그룹 레슨 일체를 금합니다.(시설대여담당자와 협의 가능)<br><br>
							9. 사용자는 사전 준수사항 및 규정을 숙지 후 예약함으로 이행함을 확인합니다.
						</span><br><br>
				  	</div>
				  	<br><input type="checkbox" id="rulecheck"> 동의합니다 <br><br>
				  	<span style="font-size: 21px;">
				  		<b>2 .주의사항</b>
				  	</span><br><br>
				  	<div style="background-color: #fff; border: 1px solid #a6a6a6;">
				  		<span style="font-size: 16px;">
				  			1. 신청자 본인의 실수로 본인 정보기재가 올바르지 않아 발생되는 사고는 책임지지 않습니다.<br><br>
				  			2. 시설대여 중 축구장내에서 발생한 모든 법적인 문제(분실,상해등) 발생시 본인의 귀책사유로써 본인 또는 신청인(단체)가 해결합니다.<br><br>
				  			3. 시설대여 규정을 준수하지 않은 개인 또는 단체는 임대(직원)인의 강제퇴장 명령에 응해야 하며 불이행시 불이익이 발생될 수 있습니다.<br><br>
				  			4. 안전사고 발생시 119신고 및 주변 청경 및 회원안내실에 통보하여야 합니다.<br><br>
				  			5. 다음의 경우 안전을 위해 축구장 이용을 제한합니다.<br><br>
							- 음주 후 또는 향정신성 약물을 투여했다고 판단되는 사람.<br><br>
							- 심장,또는 순환기 계통의 질병,정신질환자, 노약자, 임산부 등<br><br>
							6. 승인된 시설대여를 타인에게 이관 및 매매할 수 없고, 임대(직원)인의 응대요구사항을 협조합니다.<br><br>
							7.축구경기의 시간은 일일2시간으로 제한하고, 원활한 대여 순환을 위해 연속사용은 불가합니다. <br>(시설대여담당자와 협의 가능)
				  		</span><br><br>
				  	</div>
				  	<br><input type="checkbox" id="cautioncheck"> 동의합니다
				  </div>
				
				  <div class="calendar" id="calendar">
				  	
				  </div>
				</div>
				
<!-- 				<div id="info_box"> -->
<!-- 					<h3 class="box_text">개인정보수집 동의</h3> -->
<!-- 				</div> -->
<!-- 				<div class="box_inner2"> -->

<!-- 				</div> -->
				<div class="btn_area">
					<input type="submit" class="payment_btn" value="신청하기">
				</div>
			</div>
			<input type="hidden" name="location" value="<%=location%>">
			<input type="hidden" name="field_name" value="<%=field_name%>">
			<input type="hidden" name="rent_date" value="<%=rent_date%>">
			<input type="hidden" name="rent_price" value="<%=rent_price%>">
			</form>
		</div>

	</section>
	 <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>