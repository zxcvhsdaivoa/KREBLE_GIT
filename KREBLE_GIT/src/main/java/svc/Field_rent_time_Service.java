package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.FieldDAO;
import vo.Rent_info;

public class Field_rent_time_Service {
	public Rent_info getfield_rent_time(String loca,int month,int day) throws Exception{
		Rent_info field_list = null;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		field_list = fieldDAO.rent_time(loca,month,day);
		close(con);
		return field_list;
		
	}
}
