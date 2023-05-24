package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Shop_pay_service;
import use_data.Shop_prd;
import vo.ActionForward;

public class Shop_payment implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("ID");
		String ord_code= request.getParameter("ord_code");
		String name = request.getParameter("buy_name");
		String addr = request.getParameter("buy_addr");
		String call = request.getParameter("buy_call");
		String reC = request.getParameter("re_cash");
		String [] nq = request.getParameterValues("prd_nq");
		ArrayList<Shop_prd> aa = new ArrayList<Shop_prd>();
		for(int i = 0 ; i < nq.length ; i++) {
	    	Shop_prd ab = new Shop_prd();
			String [] valuess = nq[i].split("/");
			ab.setPrd_no(valuess[0]);		
			ab.setPrd_qant(Integer.parseInt((valuess[1])));		
			aa.add(ab);
		}
		
		//배송지 입력
		Shop_pay_service sps = new Shop_pay_service();
		sps.shop_pay_service(ord_code, name, addr, call);
		
		//품목 수량 감소
		sps.shop_prdM_service(aa);

		//미결제 구매내역 삭제
		sps.del_buy1(id);

		//장바구니 삭제
		sps.del_cart(aa, id);
		
		//보유캐시 감소
		sps.shop_user_cash(id, reC);
		
		forward.setPath("/shop_com_buylist.sp");
		return forward;
	}
}