package svc;

import java.sql.Connection;
import dao.SquadDAO;
import vo.SquadInfo;

import static db.JdbcUtil.*;
public class SquadSaveProService {

	public boolean registArticle(SquadInfo squadinfo) throws Exception{
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		SquadDAO squadDAO = SquadDAO.getInstance();
		squadDAO.setConnection(con);
		int insertCount = squadDAO.saveSquad(squadinfo);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
		
	}
	public int squadLastNo() throws Exception{
		Connection con = getConnection();
		SquadDAO squadDAO = SquadDAO.getInstance();
		squadDAO.setConnection(con);
		int last_no=squadDAO.selectSquadLastNo();
		
		return last_no;
	}

}
