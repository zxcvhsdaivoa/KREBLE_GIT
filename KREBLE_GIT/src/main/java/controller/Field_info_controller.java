package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.Field_list_action;
import action.Field_rent_finish_action;
import action.Field_rent_insr_action;
import action.Field_rent_select_action;
import vo.ActionForward;

@SuppressWarnings("serial")
@WebServlet("*.choi")
public class Field_info_controller extends javax.servlet.http.HttpServlet  {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/fieldInfo.choi")){ // url 변경할 주소 입력
			action = new Field_list_action();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/fieldrent.choi")){
			action = new Field_rent_select_action();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//예약 약관동의 페이지
		else if(command.equals("/rent_agree.choi")){
			forward = new ActionForward();
			forward.setPath("/field_rent_agree.jsp");
		}
		
		//예약 인서트 메소드
		else if(command.equals("/rent_insr.choi")){
			action = new Field_rent_insr_action();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//예약 신청완료 셀렉 메소드
		else if(command.equals("/rent_finish.choi")){
			action = new Field_rent_finish_action();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		if(forward != null){
					
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}

