package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Sp_back_delete_service;
import svc.Sp_back_insert_service;
import vo.ActionForward;

public class Sp_bak_delete_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Sp_back_delete_service shopbackservice = new Sp_back_delete_service();
		String nowPage = request.getParameter("page");
		String prd_no = request.getParameter("prd_no");
		String b_id = request.getParameter("b_id");
		boolean isWriteSuccess = shopbackservice.sp_back_in_Article(prd_no, b_id);

		if (!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		} else {

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("shop_back_page.sp");
		}

		return forward;

	}

}