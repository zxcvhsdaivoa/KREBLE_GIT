package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Clup_DAO;
import vo.ClupInfo;

public class ClupJoinService {
	public boolean join(String id, int no) throws Exception {
		int success=0;
		boolean issuccess=false;
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		success=clupdao.join_clup(id,no);
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
