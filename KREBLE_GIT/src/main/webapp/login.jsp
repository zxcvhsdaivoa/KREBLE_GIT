<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!doctype html>
<html>
 <head>
   <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
   <title>
    축구팀프
   </title>
 </head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/login.js"></script>

<script>
  <% String log = (String) request.getAttribute("login"); %>;
  var if_login = <%=log%>;
  if(if_login==false){
    alert("아이디와 비밀번호를 확인해주세요");
  }

</script>
 <body>

    <!-- header -->
  <jsp:include page="Header_baseform.jsp"/>

  

    <!--section-->
  <div id="img_login">
	  <section>
	    <div class="section_inner">
	      <!--article 시작-->
	      <article>
	        <form name="user_login" action="login_data.jsp" method="post">
	        <div>
	          <div class = "loginlabel">로그인</div>
	          <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요"><br><br>
	          <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요"><br><br>
	          <input type="submit" value="Login">
	
	          <div class="links">
	            <a href="#">아이디 찾기</a>
	            <a href="#">비밀번호 찾기</a>
	            <a href="join_member.jsp">회원가입</a>
	          </div>
			  <div class = "etc_login">
			  	<div>SNS계정으로 로그인</div> 
				  	<span>
				  		<span class="KakaoL">K</span>
				  		<span>KAKAO LOGIN</span>
				  	</span>
				  	<span>
				  		<span class="NaverL">N</span>
				  		<span>NAVER LOGIN</span>
				  	</span>
				  </div>
			  </div>
	        </form>
	      </article>
	    </div>
	 </section>
 </div>
 </body>
</html>