package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.FieldDAO;
import vo.KreblechoiData;
import vo.Rent_info;
import vo.Rent_situation;

public class Field_rent_Service {
	
	public ArrayList<KreblechoiData>  getfield_cate_list(String loca) throws Exception{
		ArrayList<KreblechoiData> cate_list = new ArrayList<KreblechoiData>();
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		cate_list = fieldDAO.field_cate_list(loca);
		close(con);
		return cate_list;
		
	}
	
}
