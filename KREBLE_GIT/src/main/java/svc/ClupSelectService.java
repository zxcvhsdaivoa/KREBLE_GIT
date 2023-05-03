package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.Clup_DAO;
import vo.ClupInfo;

public class ClupSelectService {
	public ClupInfo selectClup(int no) throws Exception {
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		ClupInfo cl=clupdao.select_clup(no);
		close(con);
		return cl;
	}
}
