package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.Shop_detail_action;
import vo.ActionForward;

@SuppressWarnings("serial")
@WebServlet("*.csc")
public class Csc_controller extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;


//		자주하는질문&고객센터 메인
		if(command.equals("/FAQ.csc")){
			forward=new ActionForward();
			forward.setPath("/faq_main.jsp");
		}

//		공지사항
		else if(command.equals("/FAQ_Announce.sp")){
			forward=new ActionForward();
			forward.setPath("/faq_Announce.jsp");
		}
//		1:1 질문
		else if(command.equals("/FAQ_one.sp")){
			forward=new ActionForward();
			forward.setPath("/faq_one.jsp");
		}
//		이벤트안내
		else if(command.equals("/FAQ_Event.sp")){
			forward=new ActionForward();
			forward.setPath("/faq_Event.jsp");
		}
		//여분
		else if(command.equals("/shop_prd_.sp")){
			forward=new ActionForward();
			forward.setPath("/shop_prd_.jsp");
		}
		//여분
		else if(command.equals("/shop_prd_.bo")){
			action = new aaaaa();
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