package action;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import use_data.Shop_prd;
import vo.ActionForward;

public class Shop_buy_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		ArrayList<Shop_prd> prd_ls = new ArrayList<Shop_prd>();
		int ck_count = 0;
		response.setContentType("text/html;charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		if(request.getParameter("prd_no")==null) {
//			out.println("<script>");
//			out.println("alert('구매품목이 없습니다.')");
//			out.println("history.back();");
//			out.println("</script>");
//		}
		for (int i = 0; ck_count < 1; i++) {
			if (request.getParameter(("prd_no") + (i)) == null) {
				ck_count = 1;
			} else {
				Shop_prd aa = new Shop_prd();
				aa.setPrd_img(request.getParameter(("sb_img") + i));
				aa.setPrd_no(request.getParameter(("prd_no") + i));
				aa.setPrd_id(request.getParameter(("sb_id") + i));
				aa.setPrd_name(request.getParameter(("sb_name") + i));
				aa.setPrd_qant(Integer.parseInt(request.getParameter(("sb_qant") + i)));
				aa.setPrd_price(Integer.parseInt(request.getParameter(("sb_price") + i)));
				aa.setPrd_color(request.getParameter("sb_color") + i);
				prd_ls.add(aa);
				ck_count = 0;
			}

			/*
			 * 상품 구매내역에 정리
			 * 
			 * 
			 * 
			 */

		}
		ActionForward forward = new ActionForward();
		forward.setPath("/shop_buy_list.jsp");
		return forward;
	}
}