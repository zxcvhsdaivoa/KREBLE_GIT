package action;

import java.io.PrintWriter;
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
		//ck box 에서 상품코드/상품명/가격/수량만 가져옴
		
		ArrayList<Shop_prd> prd_ls = new ArrayList<Shop_prd>();
		 if (prd_ck != null) {
			    for (String prd_l : prd_ck) {
			    	Shop_prd aa = new Shop_prd();
			    	String[] values = prd_l.split("/");
			    	//체크된 것들을 하나하나 쪼개서 모델링 객체에 맞게 나눠 저장
			    	aa.setPrd_no(values[0]);
			     	aa.setPrd_name(values[1]);
			     	aa.setPrd_price(Integer.parseInt(values[2])*Integer.parseInt(values[3]));
			     	aa.setPrd_qant(Integer.parseInt(values[3]));
			     	aa.setPrd_color(values[5]);
			     	aa.setPrd_id(id);
			    	prd_ls.add(aa);
			    	//Arraylist(이하 al로 칭함)에 저장
			    }
			  }
		Shop_buy_service sb = new Shop_buy_service();
		sb.shop_buy_service(prd_ls, id);
		//위에서 정리한 al을 service로 보냄
		
		
		request.setAttribute("spb_prd", prd_ls);
		forward.setPath("/shop_buy_list.jsp");
		return forward;
	}
}