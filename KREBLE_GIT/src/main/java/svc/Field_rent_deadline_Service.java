package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import dao.FieldDAO;

public class Field_rent_deadline_Service {
	public List<Integer> getdeadline(String loca,int month) throws Exception{
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		List<Integer> deadline = fieldDAO.field_deadline(loca,month);
		close(con);
		return deadline;
		
	}

}
