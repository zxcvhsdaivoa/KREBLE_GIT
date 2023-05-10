package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Shop_detail_service;
import use_data.Shop_prd;
import vo.ActionForward;

public class Shop_detail_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String p_no = (String) request.getParameter("prd_no");
		String page = request.getParameter("page");
		Shop_detail_service shopDetailService = new Shop_detail_service();
		Shop_prd article = shopDetailService.getArticle(p_no);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
		request.setAttribute("article", article);
		forward.setPath("/shop_prd_detail.jsp");
		return forward;

	}

}