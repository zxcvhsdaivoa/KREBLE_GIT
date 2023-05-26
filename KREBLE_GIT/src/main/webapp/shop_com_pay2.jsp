<%@ page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="use_data.Shop_prd" %>
<jsp:useBean id="sp" class="svc.Shop_buylist_service"/>
<jsp:useBean id="etc" class="use_data.Db_method_ECT"></jsp:useBean>
<% String id = (String) session.getAttribute("ID"); %>
<% int ppap = Integer.parseInt(request.getParameter("page")); %>


<%ArrayList<Shop_prd> spsp = sp.shop_buylistD(id, ppap);%>



<%
	for(int i = 0 ; i < spsp.size(); i++){
		out.print(spsp.get(i).getPrd_odnum()+"|");
		out.print(spsp.get(i).getPrd_date()+"|");
		out.print(spsp.get(i).getPrd_no()+"|");
		out.print(etc.img_link(spsp.get(i).getPrd_no())+spsp.get(i).getPrd_no()+"|");
		out.print(spsp.get(i).getPrd_name()+"|");
		out.print(spsp.get(i).getPrd_price()+"|");
		out.print(spsp.get(i).getPrd_qant()+"|");
		out.print(spsp.get(i).getPrd_addr()+";");
	}



// out.print(ect.rent_time(1,time.getRent_time1(),price)+"/");
// out.print(ect.rent_time(2,time.getRent_time2(),price)+"/");
// out.print(ect.rent_time(3,time.getRent_time3(),price)+"/");
// out.print(ect.rent_time(4,time.getRent_time4(),price)+"/");
// out.print(ect.rent_time(5,time.getRent_time5(),price)+"/");
%>