package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.FieldDAO;
import vo.KreblechoiData;

public class Field_list_Service {

	public KreblechoiData getfield_list_check(String id) throws Exception{
		KreblechoiData field_list = null;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		field_list = fieldDAO.field_list_check(id);
		close(con);
		return field_list;
		
	}

}

