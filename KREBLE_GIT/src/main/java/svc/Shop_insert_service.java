package svc;

import java.sql.Connection;
import dao.Shop_DAO;
import use_data.Shop_prd;
import static db.JdbcUtil.*;

public class Shop_insert_service {

	public boolean registArticle(Shop_prd shopprd) throws Exception {
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		shopDAO.setConnection(con);
		int insertCount = shopDAO.insertArticle(shopprd);
		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isWriteSuccess;

	}
	public static void main(String[] args) {
		
	}

}
