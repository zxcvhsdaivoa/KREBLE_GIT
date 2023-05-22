<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="vo.KreblechoiData"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="ect" class="use_data.Db_method_ECT"/>
<jsp:useBean id="field" class="svc.Field_rent_Service"/>


<%
	String lc = request.getParameter("loca");
	ArrayList<KreblechoiData> loca =field.getfield_cate_list(lc);

	
	for(int i=0; i<loca.size(); i ++){
		out.print(loca.get(i).getField_name()+"/");
	}

%>