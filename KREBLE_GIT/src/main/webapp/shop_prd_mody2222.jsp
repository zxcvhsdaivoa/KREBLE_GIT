<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd"%>

<% request.setCharacterEncoding("utf-8"); %>
<% String id = (String) session.getAttribute("ID"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/shop_prd_detail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	<script src="js/shop_prd_detail.js"></script>
	<% 
	Shop_prd aa = (Shop_prd)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
	%>
	
<title>제품수정페이지</title>
</head>
<body>
			
    <!-- header -->
  
	<jsp:include page="Header_baseform.jsp"/>
	
	<!-- section -->
  
	<section>
	<form action="Shop_prd_mody_action.sp" method ="post">
	<input type="hidden" value="<%=aa.getPrd_no() %>" name ="prd_no">
		<!-- 제품정보 -->
		<article id="pd_detail_no1">
			<div class = "no1_img_info1"><!-- 상품사진 및 필수정보 -->
				<div class="info1_img"><!-- 상품사진 width 400 x 300-->
					<span><!-- 큰사진(호버에서 나오는 사진) -->
						<%=aa.getPrd_img()%>300x250 image
					</span>
					<span><!-- 작은사진(호버용) -->
						<span><%=aa.getPrd_img() %> 100x30 image</span>
						<span><%=aa.getPrd_img() %> 100x30 image</span>
					</span>
				</div>
				<div class="info1_info1"><!-- 필수정보 -->
					<table>
					<colgroup>
						<col style = "width: 150px;">
						<col style = "width: 400px;">
					</colgroup>
						<tr>
						<td>상품이름</td>
						<td><input type="text" value="<%=aa.getPrd_name() %>" name="prd_name"></td>
						</tr>
						
						<tr>
						<td>등록자</td>
						<td><input type="text" readonly value="<%=aa.getPrd_id() %>" name="prd_id"></td>
						</tr>
						
						<tr>
						<td>제품 종류</td>
						<td>
							<select name="prd_cata">
								<option>축구화</option>	
								<option>축구공</option>	
								<option>유니폼</option>	
								<option>기타용품</option>	
							</select>
						</td>
						</tr>
						
						<tr>
						<td>가격</td>
						<td><input type="text" value="<%=aa.getPrd_price() %>" name="prd_price"></td>
						</tr>
						
						<tr>
						<td>사이즈</td>
						<td><input type="text" value="<%=aa.getPrd_size() %>" name="prd_size"></td>
						</tr>
						
						<tr>
						<td>등록일</td>
						<td><input type="text" value="<%=aa.getPrd_date() %>" readonly></td>
						</tr>
						
						<tr>
						<td>남은 수량</td>
						<td><input type="text" value="<%=aa.getPrd_qant() %>" name="prd_qant"></td>
						</tr>
						
					</table>
				</div>
			</div>
			<div class="no1_img_info2"><!-- 추가정보 -->
				<table>
					<colgroup>
						<col style = "width: 150px;">
						<col style = "width: 800px;">
					</colgroup>
					<tr>
						<td>재질</td>
						<td><input type="text" value="<%=aa.getPrd_meter() %>" name="prd_meter"></td>
					</tr>
					<tr>
						<td>색상</td>
						<td><input type="text" value="<%=aa.getPrd_color() %>" name="prd_color"></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><input type="text" value="<%=aa.getPrd_create() %>" name="prd_create"></td>
					</tr>
					<tr>
						<td>품질검사</td>
						<td>
							<select name="prd_qaul">
								<option>검사예정</option>	
								<option>검사중</option>	
								<option>검사완료</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>AS연락처</td>
						<td><input type="text" value="<%=aa.getPrd_as() %>" name="prd_as"></td>
					</tr>
				</table>
			</div>
		</article>
		
		<!-- 제품소개 및 사진 -->
		<article id="pd_detail_no2">
			<div>
				<input type="text" value="<%=aa.getPrd_note() %>" name="prd_note">
				<textarea name="prd_content"><%=aa.getPrd_content() %></textarea>
			</div>
		</article>
				
				
		
		<article id="pd_detail_no3">
			<div class="pd_bt">
				<input type="submit" value="수정">
				<a href="shop_list_action.sp"><input type="button" value="목록"></a>
			</div>
		</article>
		
		
		
	</form>	
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>