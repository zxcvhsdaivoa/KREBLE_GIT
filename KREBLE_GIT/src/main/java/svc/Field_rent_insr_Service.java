package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import dao.FieldDAO;
import vo.Rent_situation;


public class Field_rent_insr_Service {
	
	public boolean field_rentinsr(Rent_situation situa) throws Exception {

		boolean isModifySuccess = false;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		int updateCount = fieldDAO.rent_insert(situa);

		System.out.println(updateCount);
			
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
