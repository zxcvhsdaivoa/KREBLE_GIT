package svc;

import java.sql.Connection;

import dao.Shop_DAO;
import use_data.Shop_prd;

import static db.JdbcUtil.*;

public class Shop_detail_service {

	public Shop_prd getArticle(String p_no) throws Exception {

		Shop_prd article = null;
		Connection con = getConnection();
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		shopDAO.setConnection(con);
		article = shopDAO.selectArticle(p_no);
		close(con);
		return article;

	}

}
