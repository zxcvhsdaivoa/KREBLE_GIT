<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd"%>
<%@ page import="use_data.UserData"%>
<%@ page import="vo.field_save_Data"%>
<%@ page import="vo.SquadInfo"%>

<% request.setCharacterEncoding("utf-8"); %>
<% 
String id = (String) session.getAttribute("ID"); 
%>
	<jsp:useBean id="cash" class="use_data.Db_method_user"></jsp:useBean>
	<%
	int uc = cash.u_cash(id);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/user_mypage.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	<script src="js/user_mypage.js"></script>
	<%
	UserData user_al = (UserData) request.getAttribute("user_al");//유저정보가져오기
// 	field_save_Data field_al = (field_save_Data)request.getAttribute("field_al");//필드 정리되면 수정해야됨
	Shop_prd plike_al = (Shop_prd)request.getAttribute("plike_al");//관심상품 가져오기
	Shop_prd pcart_al = (Shop_prd)request.getAttribute("pcart_al");//장바구니가져오기
	SquadInfo squad_al = (SquadInfo)request.getAttribute("squad_al");//마이스쿼드 가져오기
    String nowPage = (String)request.getAttribute("page");
   
	%>
	
<title>MyPage</title>
</head>
<body>
		
    <!-- header -->
	<jsp:include page="Header_baseform.jsp"/>

	<!-- section -->
	<section>
		<!-- 활동현황/보유캐쉬 -->
		<article>
		<% 
		String sqs = (String) request.getAttribute("sqs");
		    if (sqs != null) {
		        out.println("JSP sqs: " + sqs);
   			}else{
   				out.println("왜 null이지?"+ sqs);
   			}
   		%>
			<ul>
				<li>My<br>Kreble</li>
				<li>작성한 MySquad 게시글 <%= sqs %>개</li>
				<li>대여한 경기장 @@개</li>
				<li>관심품목 @@개</li>
				<li>장바구니에 담아둔 물건 @@개</li>
				<li><div>보유 캐쉬 : \<%=uc%></div>
				<div>캐쉬충전하기</div></li>
			</ul>
		</article>
		
		<!-- 프로필사진 / 닉네임 / 마이스쿼드 -->
		<article>
			<div>
				<div> 프로필사진 / 사진수정 </div>
				<div> 닉네임 / 닉네임수정수정 </div>
			</div>
			<div> 
				<div> ID 님 환영합니다. </div>
				<div> My Squad / 선수사진 12 </div>
			</div>
		</article>
		
		<!-- 경기장 렌트 -->
		<article>
			경기장 대여 현황 라벨
			경기장 대여 리스트
		</article>
		
		<!-- 관심상품리스트 -->
		<article>
			관심품목 라벨
			관심품목 리스트
		</article>
		
		<!-- 장바구니리스트 -->
		<article>
			장바구니 라벨
			장바구니 리스트
		</article>
		
		<article>
			프로필 수정 버튼 / 탈퇴버튼
		</article>
		
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>