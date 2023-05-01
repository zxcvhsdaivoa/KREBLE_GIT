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
	<link rel="stylesheet" type="text/css" href="css/shop_prd_mody.css">
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
  
	<!-- section -->
  
	<section>
	<form action="Shop_prd_mody_action.sp?page=<%=nowPage %>" method ="post">
	<input type="hidden" name="prd_no" value="<%=aa.getPrd_no()%>">
		<!-- 제품정보 -->
	<%
	String pp_no = aa.getPrd_no();
	char p_no = pp_no.charAt(0);
	String impath="";
	switch(p_no){
	case 's':
		impath = "image/shopimg/sue/"+pp_no+".jpg";
		break;
	case 'u':
		impath = "image/shopimg/uni/"+pp_no+".jpg";
		break;
	case 'b':
		impath = "image/shopimg/ball/"+pp_no+".jpg";
		break;
	case 'e':
		impath = "image/shopimg/etc/"+pp_no+".jpg";
		break;
	}
	%>
		<article id="pd_detail_no1">
			<div class = "no1_img_info1"><!-- 상품사진 및 필수정보 -->
				<table>
				<colgroup>
					<col style = "width: 100px;">
					<col style = "width: 300px;">
					<col style = "width: 100px;">
					<col style = "width: 300px;">
				</colgroup>
						<tr>
							<td colspan="2" rowspan="7" class = "f_table_field">
							<img src="<%=impath%>" class = "b_img">
							</td>
							<td class = "f_table_label">상품이름</td>
							<td class = "f_table_field"><input type="text" name = "prd_name" value="<%=aa.getPrd_name()%>"class="in_f_s"></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">등록자</td>
							<td class = "f_table_field"><input type="text" name = "prd_id" value="<%=aa.getPrd_id() %>"class="in_f_s"></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">제품 종류</td>
							<td class = "f_table_field">
								<select name="prd_cata"class="in_f_s">
									<option <%if(p_no=='s'){%>selected<%}%>>축구화</option>	
									<option <%if(p_no=='b'){%>selected<%}%>>축구공</option>	
									<option <%if(p_no=='u'){%>selected<%}%>>유니폼</option>	
									<option <%if(p_no=='e'){%>selected<%}%>>기타용품</option>	
								</select>
							</td>
						</tr>
						
						<tr>
							<td class = "f_table_label">가격</td>
							<td class = "f_table_field"><input type="text" name = "prd_price" value="<%=aa.getPrd_price() %>"class="in_f_s"></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">사이즈</td>
							<td class = "f_table_field"><input type="text" name = "prd_size" value="<%=aa.getPrd_size() %>"class="in_f_s"></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">등록일</td>
							<td class = "f_table_field"><input type="text" name = "prd_date" value="<%=aa.getPrd_date() %>"class="in_f_s"></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">남은 수량</td>
							<td class = "f_table_field"><input type="text" name = "prd_qant" value="<%=aa.getPrd_qant() %>"class="in_f_s"></td>
						</tr>
						<tr>
							<td class = "f_table_label">재질</td>
							<td colspan="3" class = "f_table_field"><input type="text" name = "prd_meter" value="<%=aa.getPrd_meter() %>"class="in_f_s"></td>
						</tr>
						<tr>
							<td class = "f_table_label">색상</td>
							<td colspan="3" class = "f_table_field"><input type="text" name = "prd_color" value="<%=aa.getPrd_color() %>"class="in_f_s"></td>
						</tr>
						<tr>
							<td class = "f_table_label">제조사</td>
							<td colspan="3" class = "f_table_field"><input type="text" name = "prd_create" value="<%=aa.getPrd_create() %>"class="in_f_s"></td>
						</tr>
						<tr>
							<td class = "f_table_label">품질검사</td>
							<td colspan="3" class = "f_table_field"><input type="text" name = "prd_qaul" value="<%=aa.getPrd_qaul() %>"class="in_f_s"></td>
						</tr>
						<tr>
							<td class = "f_table_label">AS연락처</td>
							<td colspan="3" class = "f_table_field"><input type="text" name = "prd_as" value="<%=aa.getPrd_as() %>"class="in_f_s"></td>
						</tr>
						<tr>
							<td class = "f_table_label">비고</td>
							<td colspan="3" class = "f_table_field"><input type="text" name = "prd_note" value="<%=aa.getPrd_note() %>"class="in_f_s"></td>
						</tr>
						<tr>
							<td class = "f_table_label">상세정보</td>
							<td colspan="4" rowspan="4" class = "f_table_field"><textarea name = "prd_content" class="in_f_s in_t_f"><%=aa.getPrd_content()%></textarea></td>
						</tr>
				</table>
			</div>
		</article>
		<article id="pd_detail_no3">
			<div class="pd_bt">
				<a href = "shop_mody_form.sp?prd_no=<%=aa.getPrd_no()%>&page=<%=nowPage%>">
					<input type="submit" value="수정"class = "r_d_b_b">
				</a>
				<a href ="shop_list_action.sp">
					<input type="button" value="목록" class = "list_b">
				</a>				
			</div>
		</article>
		
		
		
	</form>	
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>