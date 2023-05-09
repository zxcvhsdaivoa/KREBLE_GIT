package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.Clup_DAO;
import vo.ClupInfo;

public class ClupMakingService {
	public boolean making(ClupInfo ci) throws Exception {
		int success=0;
		int success2=0;
		boolean issuccess=false;
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		success=clupdao.create_clup(ci);
		success2=clupdao.insert_admin(ci);
		if(success>0&&success2>0) {
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
