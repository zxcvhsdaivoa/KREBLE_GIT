<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd"%>

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
	<link rel="stylesheet" type="text/css" href="css/shop_prd_detail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script src="js/Header_Footer_Aside_baseform.js"></script>
	<script src="js/shop_prd_detail.js"></script>
	<jsp:useBean id="sp_de" class="use_data.Db_method_shop"></jsp:useBean>
	<%
	Shop_prd aa = (Shop_prd)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
	ArrayList<Shop_prd> spr = sp_de.shop_prde_reply(aa.getPrd_no());
	%>
	
<title>제품상세페이지</title>
</head>
<body>
			
    <!-- header -->
  
	<jsp:include page="Header_baseform.jsp"/>
	
	<!-- section -->
  
	<section>
	<form action="prd_re_insert.sp?page=<%=nowPage %>" method="post" onsubmit="return log_ck();">
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
	
		<article id="pd_detail_no0">
			<div class="prdC">
			<span><a href = "index.jsp">홈</a> </span>
			<span><a href = "shop_list_action.sp">&#11116; KREBLE SHOP </a> </span>
			<span><a href = "shop_calist_action.sp?prd_cata=<%=aa.getPrd_cata()%>">&#11116; <%= aa.getPrd_cata() %></a> </span>
			<span class = "f_blue">&#11116; <%= aa.getPrd_name() %></span>
			</div>
			<div class="prdN"> <%=aa.getPrd_name() %> </div>
		</article>
	
		<article id="pd_detail_no1">
			<div class = "no1_img_info1"><!-- 상품사진 및 필수정보 -->
				<table>
				<colgroup>
					<col style = "width: 90px;">
					<col style = "width: 280px;">
					<col style = "width: 90px;">
					<col style = "width: 280px;">
				</colgroup>
						<tr>
							<td colspan="2" rowspan="7" class = "f_table_field1">
							<img src="<%=impath%>" class = "b_img" onerror="this.src='image/no_image.PNG'">
							</td>
							<td class = "f_table_label">상품이름</td>
							<td class = "f_table_field"><%=aa.getPrd_name() %></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">등록자</td>
							<td class = "f_table_field"><%=aa.getPrd_id() %></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">제품 종류</td>
							<td class = "f_table_field"><%=aa.getPrd_cata() %></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">가격</td>
							<td class = "f_table_field">&#128176;<%=aa.getPrd_price() %></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">사이즈</td>
							<td class = "f_table_field"><%=aa.getPrd_size() %></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">등록일</td>
							<td class = "f_table_field"><%=aa.getPrd_date() %></td>
						</tr>
						
						<tr>
							<td class = "f_table_label">남은 수량</td>
							<td class = "f_table_field"><%=aa.getPrd_qant() %></td>
						</tr>
				</table>
			</div>
		</article>
		
		<article id="pd_detail_no7">
			<div class="flex">
				<input type="button" value="상세보기" class="text_right black">
				<input type="button" value="리뷰/평점" class="text_left black">
			</div>
		</article>
		<article id="pd_detail_no6">
			<div class = "center_only">
				<table>
						<tr>
							<td class = "f_table_label">재질</td>
							<td class = "f_table_field"><%=aa.getPrd_meter() %></td>
						</tr>
						<tr>
							<td class = "f_table_label">색상</td>
							<td class = "f_table_field"><%=aa.getPrd_color() %></td>
						</tr>
						<tr>
							<td class = "f_table_label">제조사</td>
							<td class = "f_table_field"><%=aa.getPrd_create() %></td>
						</tr>
						<tr>
							<td class = "f_table_label">품질검사</td>
							<td class = "f_table_field"><%=aa.getPrd_qaul() %></td>
						</tr>
						<tr>
							<td class = "f_table_label">AS연락처</td>
							<td class = "f_table_field"><%=aa.getPrd_as() %></td>
						</tr>
						<tr>
							<td class = "f_table_label">비고</td>
							<td class = "f_table_field"><%=aa.getPrd_note() %></td>
						</tr>
						<tr>
							<td class = "f_table_label">상세정보</td>
							<td rowspan="4" class = "f_table_field">
							<textarea class = "textA_table_field" readonly><%=aa.getPrd_content() %></textarea></td>
						</tr>
				</table>
			</div>
		</article>
		
		
		<!-- 리뷰 -->
		<article id="pd_detail_no4">
			<div>
				<table>
					<colgroup>
					<col style="width:110px" />
					<col style="width:90px" />
					<col style="width:440px" />
					<col style="width:100px" />
					</colgroup>
					<tr>
					<td colspan="4" class = "h40">&#x203B;댓글은 최근 순으로 5개만 표기됩니다.</td>
					</tr>
					<tr class = "re_title">
					<td>작성자</td>
					<td>평점</td>
					<td>내용</td>
					<td>삭제</td>
					</tr>
					<%
					if(spr!=null){
					int n = spr.size();
					if(n>5){
						n=5;
						};
					for (int i=0; i<n;i++) {
						String sc = "";
						sc = sp_de.prd_score(spr.get(i).getPrd_re_sc());
					    out.println("<tr>");
					    out.println("<td class ='re_conten'>"+spr.get(i).getPrd_re_id()+"</td>");
					    out.println("<td class ='re_conten'>"+sc+"</td>");
					    out.println("<td class ='re_conten'>"+spr.get(i).getPrd_re_text()+"</td>");
					    
					    if(spr.get(i).getPrd_re_id().equals(id)){
					    	out.println("<td><a href='shop_re_del.sp?re_no="+spr.get(i).getPrd_re_num()+"&prd_no="+aa.getPrd_no()+"'><input type='button' class='del_check' value='댓글삭제'></a></td>");
					    }else{
					    	out.println("<td></td>");	
					    }
					    
					    out.println("</tr>");
					}
					}else{
					    out.println("<tr>");
					    out.println("<td colspan='4' class ='re_conten'>"+"입력된 평점이 없습니다."+"</td>");
					    out.println("</tr>");
					}
					%>
				</table>		
			</div>
		</article>	
		<!-- 수정/삭제/리뷰 -->
		<%
		if(aa.getPrd_id().equals(id)){
		%>
			
			<article id="pd_detail_no3">
				<div class="pd_bt">
					<a href = "shop_mody_form.sp?prd_no=<%=aa.getPrd_no()%>&page=<%=nowPage%>">
						<input type="button" value="수정" class = "r_d_b_b">
					</a>
					<a href = "Prd_delete_action.sp?prd_no=<%=aa.getPrd_no()%>&page=<%=nowPage%>">
						<input type="button" value="삭제" class = "r_d_b_b">
					</a>
					<a href ="shop_list_action.sp">
						<input type="button" value="목록" class = "list_b">
					</a>				
				</div>
			</article>
		<% 
		}else{
		%>
			<article id="pd_detail_no3">
				<div class="pd_review_ti">
					<a href ="#">
						<input type="button" value="구매" class = "r_d_b_b">
					</a>
					<a href = "shop_bak.sp?prd_no=<%=aa.getPrd_no()%>&b_id=<%=id%>&page=<%=nowPage%>">
						<input type="button" value="장바구니" class = "r_d_b_b">
					</a>
					<a href ="shop_list_action.sp">
						<input type="button" value="목록" class = "list_b">
					</a>	
				</div>
			</article>
		<%
		}
		%>
			
		
		
		<!-- 댓글작성 -->
		<article id="pd_detail_no5">
		<div>
			<div>
				<p>작성자 : </p>
				<input type="text" value="<%= id %>" readonly name="prd_re_id">
				<p>평점 : </p>
				<select name = "prd_re_sc" class = "sel_sc">
					<option value="10">&#10030;&#10030;&#10030;&#10030;&#10030;</option>
					<option value="9">&#10030;&#10030;&#10030;&#10030;&#10032;</option>
					<option value="8">&#10030;&#10030;&#10030;&#10030;</option>
					<option value="7">&#10030;&#10030;&#10030;&#10032;</option>
					<option value="6">&#10030;&#10030;&#10030;</option>
					<option value="5">&#10030;&#10030;&#10032;</option>
					<option value="4">&#10030;&#10030;</option>
					<option value="3">&#10030;&#10032;</option>
					<option value="2">&#10030;</option>
					<option value="1">&#10032;</option>
				</select>
			</div>
			<div>
				<p>내용 : </p>
				<textarea name="prd_re_text"></textarea>
				<input type="hidden" name="prd_no" value="<%=aa.getPrd_no()%>">
				<input type="submit" value="등록">
			</div>
		</div>
		</article>
		
	</form>	
	</section>
	
    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
</body>
</html>