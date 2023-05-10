package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Shop_insert_service;
import svc.Sp_re_inser_service;
import use_data.Shop_prd;
import vo.ActionForward;

public class Sp_re_insert_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nowPage = request.getParameter("page");
		ActionForward forward = null;
		Shop_prd shopprd = null;
		shopprd = new Shop_prd();
		shopprd.setPrd_re_id(request.getParameter("prd_re_id"));// 리플작성자
		shopprd.setPrd_re_text(request.getParameter("prd_re_text"));// 리플내용
		shopprd.setPrd_re_no(request.getParameter("prd_no"));// 상품연결번호
		// 리플번호PKAI
		shopprd.setPrd_re_sc(Integer.parseInt(request.getParameter("prd_re_sc")));// 평점
		Sp_re_inser_service shopinservice = new Sp_re_inser_service();
		boolean isWriteSuccess = shopinservice.prd_re_in_Article(shopprd);
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
			forward.setPath("shop_prd_detail.sp?prd_no=" + request.getParameter("prd_no") + "&page=" + nowPage);
		}

		return forward;

	}

}