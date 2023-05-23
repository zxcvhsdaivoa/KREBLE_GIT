<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="vo.Rent_info"%>
<jsp:useBean id="ect" class="use_data.Db_method_ECT"/>
<jsp:useBean id="field" class="svc.Field_rent_time_Service"/>
<jsp:useBean id="field_price" class="svc.Field_price_Service"/>


<%
	String lc = request.getParameter("loca");
	int month =Integer.parseInt(request.getParameter("month"));
	int day =Integer.parseInt(request.getParameter("day"));
	Rent_info time =field.getfield_rent_time(lc, month, day);
	int price = field_price.field_price(lc);

	
	out.print(ect.rent_time(1,time.getRent_time1(),price)+"/");
	out.print(ect.rent_time(2,time.getRent_time2(),price)+"/");
	out.print(ect.rent_time(3,time.getRent_time3(),price)+"/");
	out.print(ect.rent_time(4,time.getRent_time4(),price)+"/");
	out.print(ect.rent_time(5,time.getRent_time5(),price)+"/");
	

%>