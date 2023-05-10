package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Shop_DAO;
import use_data.Shop_prd;
import static db.JdbcUtil.*;

public class Sp_back_form_service {

	public int getListCount(String id) throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		shopDAO.setConnection(con);
		listCount = shopDAO.selectbackCount(id);
		close(con);
		return listCount;

	}

	public ArrayList<Shop_prd> sp_back_form_Article(String id, int page, int limit) throws Exception {

		ArrayList<Shop_prd> articleList = null;
		Connection con = getConnection();
		Shop_DAO shopDAO = Shop_DAO.getInstance();
		shopDAO.setConnection(con);
		articleList = shopDAO.selectbackArticle(id, page, limit);
		close(con);
		return articleList;

	}

}