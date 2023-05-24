package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.FieldDAO;
import vo.Rent_situation;

public class Field_rent_findinfo_Service {
	public int fint_info(Rent_situation situa) throws Exception{
		situa.setRent_date(situa.getRent_date().substring(0,10));
		int price=0;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		price = fieldDAO.find_rentinfo(situa);
		close(con);
		return price;
		
	}
}
