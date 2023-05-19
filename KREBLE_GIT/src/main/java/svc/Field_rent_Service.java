package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.FieldDAO;
import vo.KreblechoiData;
import vo.Rent_info;
import vo.Rent_situation;

public class Field_rent_Service {
	
	public Rent_info getrent_list_check() throws Exception{
		Rent_info rent_info = null;
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		rent_info = fieldDAO.rent_info_select();
		close(con);
		return rent_info;
		
	}
	public ArrayList<KreblechoiData>  getfield_cate_list(String loca) throws Exception{
		ArrayList<KreblechoiData> cate_list = new ArrayList<KreblechoiData>();
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		cate_list = fieldDAO.field_cate_list(loca);
		close(con);
		return cate_list;
		
	}
	public ArrayList<Rent_situation> getrent_deadline_check() throws Exception{
		ArrayList<Rent_situation> rent_situation = new ArrayList<Rent_situation>();
		Connection con = getConnection();
		FieldDAO fieldDAO = FieldDAO.getInstance();
		fieldDAO.setConnection(con);
		rent_situation = fieldDAO.rent_deadline_check();
		close(con);
		return rent_situation;
	}
	
}
