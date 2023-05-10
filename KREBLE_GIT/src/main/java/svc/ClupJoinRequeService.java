package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.Clup_DAO;

public class ClupJoinRequeService {
	public boolean joinReque(String id, int no, String jointext) throws Exception {
		int success=0;
		boolean issuccess=false;
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		success=clupdao.join_clup_reque(id,no,jointext);
		if(success>0) {
			issuccess=true;
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		return issuccess;
	}
}
