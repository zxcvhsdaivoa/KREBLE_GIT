package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Shop_buy_service;
import use_data.Shop_prd;
import vo.ActionForward;

public class Shop_buy_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		String [] prd_ck = request.getParameterValues("prd_ck");
		
		ArrayList<Shop_prd> prd_ls = new ArrayList<Shop_prd>();
		 if (prd_ck != null) {
			    for (String prd_l : prd_ck) {
			    	Shop_prd aa = new Shop_prd();
			    	String[] values = prd_l.split("/");
			    	aa.setPrd_no(values[0]);
			     	aa.setPrd_name(values[1]);
			     	aa.setPrd_price(Integer.parseInt(values[2])*Integer.parseInt(values[3]));
			     	aa.setPrd_qant(Integer.parseInt(values[3]));
			     	aa.setPrd_color(values[5]);
			     	aa.setPrd_id(id);
			    	prd_ls.add(aa);
			    }
			  }
		Shop_buy_service sb = new Shop_buy_service();
		String code = sb.shop_buy_service(prd_ls, id);
		
		request.setAttribute("ord_code", code);
		request.setAttribute("spb_prd", prd_ls);
		forward.setPath("/shop_buy_list.jsp");
		return forward;
	}
}