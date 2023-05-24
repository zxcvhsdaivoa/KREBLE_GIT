package svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.Shop_DAO;
import use_data.Shop_prd;
import static db.JdbcUtil.*;

public class Shop_pay_service {
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		Connection con = getConnection();
	
	public Shop_pay_service(){
		shopDAO.setConnection(con);
	}
	
	
	//배송지입력
	public void shop_pay_service(String ord_code,String name,String addr,String call) throws Exception {
		shopDAO.shop_in_pay(ord_code, name, addr, call);
	}
	//수량감소
	public void shop_prdM_service(ArrayList<Shop_prd> alsp) throws Exception {
		HashMap<String, Integer> reQ = shopDAO.reQ(alsp); 
		shopDAO.shop_prdM(alsp, reQ);
	}
	//미결제 구매내역 삭제
	public void del_buy1(String id) throws Exception {
		shopDAO.del_buy1(id); 
	}
	
	//장바구니 삭제
	public void del_cart(ArrayList<Shop_prd> alsp, String id) {
		shopDAO.del_cart(alsp, id);
	}
	
	//캐시감소
	public void shop_user_cash(String id, String reC) throws Exception {
		shopDAO.shop_caM(id, reC);
		commit(con);
		close(con);

	}
}