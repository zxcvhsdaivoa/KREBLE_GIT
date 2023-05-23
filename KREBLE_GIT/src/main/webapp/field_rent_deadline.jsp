<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<jsp:useBean id="ect" class="use_data.Db_method_ECT"/>
<jsp:useBean id="field" class="svc.Field_rent_deadline_Service"/>


<%
	String loca = request.getParameter("loca");
	int mon =Integer.parseInt(request.getParameter("month"));
	List<Integer> deadline =field.getdeadline(loca,mon);

	
	for(int i=0; i<deadline.size(); i ++){
		out.print(deadline.get(i)+"/");
	}

%>