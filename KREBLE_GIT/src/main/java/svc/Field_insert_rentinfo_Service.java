package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.FieldDAO;
import vo.Rent_situation;

public class Field_insert_rentinfo_Service {
	public boolean insert_rentinfo(int i,Rent_situation situa) throws Exception{
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		int insertCount = fieldDAO.rent_info_insert(i,situa);
		
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
}
