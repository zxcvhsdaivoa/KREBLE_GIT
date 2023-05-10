package svc;

import java.sql.Connection;
import dao.Shop_DAO;
import static db.JdbcUtil.*;

public class Shop_prd_lck_service {

	public String likeArticle(String p_no, String p_id) throws Exception {
		Connection con = getConnection();
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		shopDAO.setConnection(con);
		boolean already = shopDAO.prd_like_ck(p_no, p_id);

		String di = "";

		if (already) {
			di = shopDAO.prd_like_del(p_no, p_id);
		} else {
			di = shopDAO.prd_like_in(p_no, p_id);
		}

		if (di != "") {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return di;

	}

}
