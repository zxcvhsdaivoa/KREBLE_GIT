<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
   <link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
   <link rel="stylesheet" type="text/css" href="css/page24.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
 <script src="js/page2.js"></script>
 <script src="js/map.js"></script>
<body>

  <jsp:include page="Header_baseform.jsp"/>


<!--section-->
  <section>
 	<div class="content_bg">
 	</div>
 	
    <div class="content">
    <h2>회원가입</h2>
    <p class="head_text">서비스 이용약관에 동의해주세요</p>
    <form name="joinmember" action="join_member_after.jsp" method="post" onsubmit="return memberjoin()">
      <div class="page page1">
        <div class="agree_box">
          <span><p>
          	여러분을 환영합니다.
			<br>KREBLE 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 
			<br>본 약관은 다양한 KREBLE 서비스의 이용과 관련하여 KREBLE 서비스를 제공하는 KREBLE 주식회사(이하 ‘KREBLE’)와 이를 이용하는 KREBLE 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 KREBLE 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.

				KREBLE 서비스를 이용하시거나 KREBLE 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
          </p></span>
          <label for="agree1">이용약관 동의</label>
          <input type="checkbox" id="agree1" name="agree" value="agree1">
        </div>

        <div class="agree_box">
          <span><p>
          개인정보보호법에 따라 KREBLE에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
          </p></span>
          <label for="agree2">개인정보 수집 및 이용 동의</label>
          <input type="checkbox" id="agree2" name="agree" value="agree2">
        </div>

        <span class="page_button prev_button">이전으로</span>
        <span class="page_button next_button">다음으로</span>
      </div>

      <div class="page page2">
        <div class="type1">
          <label for="uid">아이디</label>
          <input type="text" id="uid" name="uid">
          <input type="button" name="checkid" value="아이디 중복확인" id="checkid">
        </div>

        <label for="uname">이름</label>
        <input type="text" id="uname" name="uname">

        <label for="pw">비밀번호</label>
        <input type="password" class="pass" id="pw" name="pw">

        <label for="repw">비밀번호 재확인</label>
        <input type="password" class="pass" id="repw" name="repw">
        <p id="pwck_text"></p>

        <label for="nick">닉네임</label>
        <input type="text" id="nick" name="nick">
        
        <span class="page_button prev_button">이전으로</span>
        <span class="page_button next_button">다음으로</span>
      </div>

      <div class="page page3">
        <label for="birth">생년월일</label>
        <input type="date" name="birth" id="birth">
        

        <label for="gneder">성별</label>
        <select name="gender">
          <option checked>남</option>
          <option>여</option>
        </select>

        <div class="phone">
          <label for="ph1">전화번호</label>
          <select name="ph_select">
            <option value="010" selected>010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
          </select>
          <input type="text" name="ph_text" class="ph" id="ph1" maxlength="4" onlynum>
          <input type="text" name="ph_text" class="ph" maxlength="4" onlynum>
          <input type="button" id="authen" value="인증번호 발송">
        </div>

        <label for="email">e-mail</label>
        <input type="text" id="email" name="email">
        <span class="at">@</span>
        <select name="email" class="email">
          <option value="naver.com" selected>naver.com</option>
          <option value="google.com">google.com</option>
          <option value="daum.net">daum.net</option>
          <option value="nate.com">nate.com</option>
        </select>

        <label for="sample4_postcode">주소</label>
        <div class="address">
          <input type="text" name="address_text" id="sample4_postcode" placeholder="우편번호">
          <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
          <input type="text" name="address_text" id="sample4_roadAddress" placeholder="도로명주소">
          <input type="text" name="address_text" id="sample4_jibunAddress" placeholder="지번주소">
          <span id="guide" style="color:#999;display:none"></span>
          <input type="text" name="address_text" id="sample4_detailAddress" placeholder="상세주소">
          <input type="text" name="address_text" id="sample4_extraAddress" placeholder="참고항목">
        </div>

        <label for="inauthen">인증번호 입력</label>
        <input type="text" id="inauthen" name="inauthen">

        <span class="page_button prev_button">이전으로</span>
        <input type="submit" id="joinmem" value="회원가입">
      </div>

      
    </form>
  </div>
  </section>

	<!--<jsp:include page="Footer_baseform.jsp"/>-->
</body>
</html>