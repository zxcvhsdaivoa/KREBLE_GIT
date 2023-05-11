package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.Clup_DAO;
import vo.ClupInfo;

public class ClupMemberService {
	public ClupInfo selectMember(int no,String id) throws Exception {
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		ClupInfo cl=clupdao.select_member(no,id);
		close(con);
		return cl;
	}
}
