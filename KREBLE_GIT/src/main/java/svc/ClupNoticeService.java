package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Clup_DAO;
import vo.ClupInfo;

public class ClupNoticeService {
	public ArrayList<ClupInfo> selectNotice(int no) throws Exception {
		ArrayList<ClupInfo> sll = null;
		Connection con = getConnection();
		Clup_DAO clupdao = Clup_DAO.getInstance();
		clupdao.setConnection(con);
		sll=clupdao.select_clup_list();
		close(con);
		return sll;
	}
}
