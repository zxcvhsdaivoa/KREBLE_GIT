package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.SquadDAO;
import vo.SquadInfo;

public class UserSquadAllListService {

	public ArrayList<SquadInfo> getList(int page, int limit) throws Exception {
		ArrayList<SquadInfo> squadList = null;
		Connection con = getConnection();
		SquadDAO commuDAO = SquadDAO.getInstance();
		commuDAO.setConnection(con);
		squadList = commuDAO.selectSquadList(page, limit);

		close(con);
		return squadList;
	}

	public ArrayList<SquadInfo> getOrderList(String[] order, int page, int limit) throws Exception {
		ArrayList<SquadInfo> squadList = null;
		Connection con = getConnection();
		SquadDAO commuDAO = SquadDAO.getInstance();
		commuDAO.setConnection(con);
		squadList = commuDAO.selectOrderSquadList(order, page, limit);

		close(con);
		return squadList;
	}

	public ArrayList<SquadInfo> getSearchList(String search, String search_text, int page, int limit) throws Exception {
		ArrayList<SquadInfo> squadList = null;
		Connection con = getConnection();
		SquadDAO commuDAO = SquadDAO.getInstance();
		commuDAO.setConnection(con);
		squadList = commuDAO.selectSerachSquadList(search, search_text, page, limit);

		close(con);
		return squadList;
	}

	public ArrayList<SquadInfo> getSearchOrderList(String search, String search_text, String[] order, int page,
			int limit) throws Exception {
		ArrayList<SquadInfo> squadList = null;
		Connection con = getConnection();
		SquadDAO commuDAO = SquadDAO.getInstance();
		commuDAO.setConnection(con);
		squadList = commuDAO.selectSearchOrderSquadList(search, search_text, order, page, limit);

		close(con);
		return squadList;
	}

	public int getListCount() throws Exception {
		int count = 0;
		Connection con = getConnection();
		SquadDAO commuDAO = SquadDAO.getInstance();
		commuDAO.setConnection(con);
		count = commuDAO.selectAllSquadCount();

		close(con);
		return count;
	}

	public int getSearchListCount(String search, String search_text) throws Exception {
		int count = 0;
		Connection con = getConnection();
		SquadDAO commuDAO = SquadDAO.getInstance();
		commuDAO.setConnection(con);
		count = commuDAO.selectSearchSquadCount(search, search_text);

		close(con);
		return count;
	}
}
