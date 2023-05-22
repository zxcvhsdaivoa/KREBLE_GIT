<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="alarm" class="svc.UserAlarmNoreadService"/>
<%
	String id= "null";
	if(session.getAttribute("ID")!=null&&session.getAttribute("ID")!=""&!session.getAttribute("ID").equals("null")){
		id=(String) session.getAttribute("ID");
	}
	int noread= alarm.noread(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
	<header>
    <div class="header_inner">
        <h1><a href="index.jsp"><!-- <img src="image/logo_EX.jpg" style="width: 100px;height: 70px;"> --><img src="image/logo.png" alt="kerble"> </a></h1>
        <ul class="cate_login">
        <%if(id.equals("null")) {%>
            <li class="login"><a href="login.jsp">로그인</a></li>
            <li class="join"><a href="join_member.jsp">회원가입</a></li>
        <%} else {%>
        	<%if(noread==1){ %>
            	<li class="alarm newalarm"><a href="#">알림</a></li>
            <%} else { %>
           		<li class="alarm"><a href="#">알림</a></li>
            <%} %>
            <li class="logout"><a href="logout.jsp">로그아웃</a></li>
            <li class="mypage"><a href="mypage.kb">마이페이지</a></li>
        <%} %>
        </ul>
        <div class="alarm_wrap hide">
        	<span class="myalarm">내 알림 현황</span>
        	<span class="close"></span>
        	<ul class="alarm_box">
        	
        	</ul>
        </div>
       
       <div class="top_nav">
            <ul>
                <li>
                  <a href="notuse.kb">정보소개</a>
                  <ul class="sub">
                    <li><a href="notuse.kb">선수소개</a></li>
                    <li><a href="notuse.kb">감독소개</a></li>
                    <li><a href="notuse.kb">팀소개</a></li>
                  </ul>
                </li>
            
                <li>
                  <a href="squad.sq">#유저공간</a>
                  <ul class="sub">
                    <li><a href="squad.sq">나만의스쿼드</a></li>
                    <li><a href="community.jsp">유저커뮤니티</a></li>
                    <li><a href="clup.do?command=main">KREBLE클럽</a></li>
                  </ul>
                </li>
                
				<li>
                  <a href="fieldInfo.choi?field_id=s_000">#예약/대여</a>
                  <ul class="sub">
                    <li><a href="fieldInfo.choi?field_id=s_000">시민구장 정보</a></li>
                    <li><a href="fieldrent.choi">시민구장 예약</a></li>
                    <li><a href="rent_review.jsp">후기 게시판</a></li>
                  </ul>
                </li>

                <li>
                  <a href="kreble.sp">#쇼핑</a>
                  <ul class="sub">
                    <li><a href="shop_list_action.sp">쇼핑목록</a></li>
                    <li><a href="shop_back_page.sp">장바구니</a></li>
                    <li><a href="shop_buy_list.jsp">구매내역</a></li>
                    <li><a href="shop_re_board.sp">제작의뢰</a></li>
                  </ul>
                </li>
            </ul>
        </div>
    </div>
    <span class="nav_back"></span>
    </header>
</body>
</html>