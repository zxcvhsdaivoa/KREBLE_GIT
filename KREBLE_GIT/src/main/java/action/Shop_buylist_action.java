package action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Shop_buylist_service;
import use_data.Shop_prd;
import vo.ActionForward;

public class Shop_buylist_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		ArrayList<Shop_prd> req = new ArrayList<Shop_prd>();
		
		int page = 1;
		
		String id = (String) session.getAttribute("ID");
		Shop_buylist_service sbs = new Shop_buylist_service();
		req = sbs.shop_buylistD(id, page);

		request.setAttribute("articleList", req);
		
		forward.setPath("/shop_com_pay.jsp");
		return forward;
	}
}