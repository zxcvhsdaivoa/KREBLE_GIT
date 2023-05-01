package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Prd_re_delete_service;
import vo.ActionForward;

public class Shop_re_delete_action extends use_data.Db_method_conn implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String p_no = request.getParameter("re_no");
		String prd_no = request.getParameter("prd_no");
		String nowPage = request.getParameter("page");

		Prd_re_delete_service aa = new Prd_re_delete_service();
		aa.removeArticle(p_no);

		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("shop_prd_detail.sp?prd_no=" + prd_no + "&page=" + nowPage);

		return forward;
	}

}
