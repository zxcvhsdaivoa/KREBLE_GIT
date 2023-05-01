package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import dao.SquadDAO;

public class SquadDeleteProService {
	public boolean removeArticle(int Squad_no,String user_id) throws Exception{
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		SquadDAO SquadDAO = dao.SquadDAO.getInstance();
		SquadDAO.setConnection(con);
		int deleteCount = SquadDAO.deleteArticle(Squad_no,user_id);
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
