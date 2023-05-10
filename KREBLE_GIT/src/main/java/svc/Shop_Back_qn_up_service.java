package svc;

import java.sql.Connection;
import dao.Shop_DAO;
import use_data.Shop_prd;
import static db.JdbcUtil.*;

public class Shop_Back_qn_up_service {
	public boolean sp_back_qa_up_Article(String p_no, String b_id, String prd_qant) throws Exception {
		boolean isSuccess = false;
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		Connection con = getConnection();
		shopDAO.setConnection(con);
		int insertCount = 0;
		int i = shopDAO.qantCheck(prd_qant, p_no);
		if (i == 1) {
			insertCount = shopDAO.updateBackArticle(p_no, b_id, prd_qant);
		}

		if (insertCount > 0) {
			commit(con);
			isSuccess = true;
		} else {
			rollback(con);
		}
		close(con);

		return isSuccess;
	}

}