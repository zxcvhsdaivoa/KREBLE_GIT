package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.FieldDAO;
import vo.Rent_situation;

public class Field_rent_finish_Service {
	
	public Rent_situation getrent_finish_check() throws Exception{
		Rent_situation rent_situation = null;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		rent_situation = fieldDAO.field_finish_check();
		close(con);
		return rent_situation;
		
	}

}
