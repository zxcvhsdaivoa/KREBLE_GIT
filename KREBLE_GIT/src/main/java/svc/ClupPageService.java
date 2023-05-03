package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.Clup_DAO;

public class ClupPageService {
	public int ismember(int no, String id) throws Exception {
		int success=0;
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		success=clupdao.search_clup_member(no,id);
		close(con);
		return success;
	}
}
