package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.Clup_DAO;

public class ClupManagerCheckService {
	public boolean pwcheck(int no,String id) throws Exception {
		boolean issuccess=false;
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		issuccess=clupdao.clup_manager(no,id);
		if(issuccess) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		return issuccess;
	}
}
