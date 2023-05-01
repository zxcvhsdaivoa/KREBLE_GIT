<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
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
        <h1><a href="index.jsp"><img src="image/logo_EX.jpg" style="width: 100px;height: 70px;"><img src="image/logo.png" alt="kerble"></a></h1>
        <ul class="cate_login">
            <li class="login_false"><a href="login.jsp">로그인</a></li>
            <li class="login_false"><a href="join_member.jsp">회원가입</a></li>
            <li class="login_true"><a href="logout.jsp">로그아웃</a></li>
            <li class="login_true"><a href="mypage.kb">마이페이지</a></li>
        </ul>
       
       <div class="top_nav">
            <ul>
                <li>
                  <a href="#">정보소개</a>
                  <ul class="sub">
                    <li><a href="#">선수소개</a></li>
                    <li><a href="#">감독소개</a></li>
                    <li><a href="#">팀소개</a></li>
                  </ul>
                </li>
            
                <li>
                  <a href="squadList.sq">#유저공간</a>
                  <ul class="sub">
                    <li><a href="squadList.sq">나만의스쿼드</a></li>
                    <li><a href="community.jsp">유저커뮤니티</a></li>
                    <li><a href="#">승부예측</a></li>
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
                    <li><a href="shop_prd_buy_list.sp">구매내역</a></li>
                    <li><a href="shop_re_board.sp">제작의뢰</a></li>
                  </ul>
                </li>

                <li>
                  <a href="#">고객센터</a>
                  <ul class="sub">
                    <li><a href="FAQ.csc">자주하는질문</a></li>
                    <li><a href="FAQ_Announce.sp">공지사항</a></li>
                    <li><a href="FAQ_Event.sp">이벤트안내</a></li>
                    <li><a href="FAQ_one.sp">1:1문의</a></li>
                  </ul>
                </li>
            </ul>
        </div>
    </div>
    <span class="nav_back"></span>
    </header>
</body>
</html>