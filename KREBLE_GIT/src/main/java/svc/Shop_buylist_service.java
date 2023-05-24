package svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.Shop_DAO;
import use_data.Shop_prd;
import static db.JdbcUtil.*;

public class Shop_buylist_service {
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		Connection con = getConnection();
	
	public Shop_buylist_service(){
		shopDAO.setConnection(con);
	}
	
	
	//구매내역 불러오기
	public ArrayList<Shop_prd> shop_buylistD(String id) throws Exception {
		ArrayList<Shop_prd> req = new ArrayList<Shop_prd>();
		System.out.println(id+"============service id");
		req = shopDAO.shop_buylistD(id);
		System.out.println(req.get(0).getPrd_no()+"====================service getprd_no");
		
		commit(con);
		close(con);
		return req;
	}
}