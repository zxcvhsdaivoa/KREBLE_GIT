package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Shop_delete_service;
import vo.ActionForward;

public class Shop_Prd_delete_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nowPage = request.getParameter("page");
		ActionForward forward = null;
		Shop_delete_service aa = new Shop_delete_service();
		aa.deleteArticle(request.getParameter("prd_no"));

		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("shop_list_action.sp?page=" + nowPage);

		return forward;

	}

}