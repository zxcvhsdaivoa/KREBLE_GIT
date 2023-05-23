package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.FieldDAO;

public class Field_price_Service {
	public int field_price(String field_name) throws Exception{
		int price=0;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		price = fieldDAO.field_price(field_name);
		close(con);
		return price;
		
	}
}
