package svc;

import java.sql.Connection;
import dao.Shop_DAO;
import use_data.Shop_prd;
import static db.JdbcUtil.*;

public class Sp_re_inser_service {

	public boolean prd_re_in_Article(Shop_prd shopprd) throws Exception {
		boolean isWriteSuccess = false;
		System.out.println(shopprd.getPrd_re_sc());
		Connection con = getConnection();
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		shopDAO.setConnection(con);
		int insertCount = shopDAO.reInsertArticle(shopprd);
		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isWriteSuccess;

	}

}