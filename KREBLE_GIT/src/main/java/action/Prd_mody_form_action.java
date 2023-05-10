package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Prd_mody_form_service;
import use_data.Shop_prd;
import vo.ActionForward;

 public class Prd_mody_form_action implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		String p_no=(String) request.getParameter("prd_no");
		String page = request.getParameter("page");
		Prd_mody_form_service shopmodyService = new Prd_mody_form_service();
		Shop_prd article = shopmodyService.getArticle(p_no);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/shop_prd_mody.jsp");
   		return forward;

	 }
	 
}