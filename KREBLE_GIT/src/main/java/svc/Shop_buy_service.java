package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Shop_DAO;
import use_data.Shop_prd;
import static db.JdbcUtil.*;

public class Shop_buy_service {
	public void shop_buy_service(ArrayList<Shop_prd> aaa, String id) throws Exception {

		Shop_DAO shopDAO = Shop_DAO.getInstance();
		Connection con = getConnection();
		shopDAO.setConnection(con);
		
		String code = shopDAO.mk_code();
		
		int insertCount = shopDAO.shopb_prd_in(aaa, id, code);

		if (insertCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

	}

}