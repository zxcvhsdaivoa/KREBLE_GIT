package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.SquadInfo;
import dao.SquadDAO;

public class SquadModifyProService {
	public boolean modifyArticle(SquadInfo article) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		SquadDAO SquadDAO = dao.SquadDAO.getInstance();
		SquadDAO.setConnection(con);
		int updateCount = SquadDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		close(con);
		return isModifySuccess;
		
	}

}
