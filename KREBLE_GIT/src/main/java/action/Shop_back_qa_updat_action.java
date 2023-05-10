package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Shop_Back_qn_up_service;
import svc.Sp_back_insert_service;
import vo.ActionForward;


public class Shop_back_qa_updat_action implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward=null;
		Shop_Back_qn_up_service shopbackservice = new Shop_Back_qn_up_service();
		String prd_no = request.getParameter("prd_no");
		String prd_qant = request.getParameter("sb_qant");
		String b_id = request.getParameter("b_id");
		
		boolean isWriteSuccess = shopbackservice.sp_back_qa_up_Article(prd_no, b_id, prd_qant);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(!isWriteSuccess){
			out.println("fail");
		}
		else{
			out.println("success");
		}
		return forward;
		
	}  	
	
}