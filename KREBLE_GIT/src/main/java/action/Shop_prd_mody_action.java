package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Prd_mody_form_service;
import svc.Shop_insert_service;
import svc.Shop_prd_mody_service;
import use_data.Shop_prd;
import vo.ActionForward;

public class Shop_prd_mody_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		Shop_prd shopprd = null;

		shopprd = new Shop_prd();
		shopprd.setPrd_no(request.getParameter("prd_no"));
		shopprd.setPrd_name(request.getParameter("prd_name"));
		shopprd.setPrd_cata(request.getParameter("prd_cata"));
		shopprd.setPrd_price(Integer.parseInt(request.getParameter("prd_price")));
		shopprd.setPrd_note(request.getParameter("prd_note"));
		shopprd.setPrd_size(request.getParameter("prd_size"));
		shopprd.setPrd_qant(Integer.parseInt(request.getParameter("prd_qant")));
		shopprd.setPrd_meter(request.getParameter("prd_meter"));
		shopprd.setPrd_color(request.getParameter("prd_color"));
		shopprd.setPrd_create(request.getParameter("prd_create"));
		shopprd.setPrd_qaul(request.getParameter("prd_qaul"));
		shopprd.setPrd_as(request.getParameter("prd_as"));
		shopprd.setPrd_content(request.getParameter("prd_content"));
		Shop_prd_mody_service shopinservice = new Shop_prd_mody_service();
		boolean isWriteSuccess = shopinservice.modyregistArticle(shopprd);
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
			forward.setPath("shop_list_action.sp");
		}

		return forward;
	}

}