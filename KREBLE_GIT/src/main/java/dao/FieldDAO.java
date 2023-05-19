package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import use_data.Shop_prd;
import use_data.UserData;
import vo.KreblechoiData;
import vo.Rent_info;
import vo.Rent_situation;
import vo.field_save_Data;

public class FieldDAO {
	DataSource ds;
	Connection con;
	private static FieldDAO fieldDAO;
	
	private FieldDAO() {
	}
	
	public static FieldDAO getInstance(){
		if(fieldDAO == null){
			fieldDAO = new FieldDAO();
		}
		return fieldDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	//예약/대여 시민구장 정보,최승혁 db

	public KreblechoiData field_list_check(String id) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		KreblechoiData field_list=null;

		try{
			pstmt = con.prepareStatement("select * from field_info where field_id = '" + id + "';");
			rs= pstmt.executeQuery();

			if(rs.next()){
				field_list=new KreblechoiData();
				field_list.setField_id(rs.getString("field_id"));
				field_list.setFullname(rs.getString("field_fullname"));
				field_list.setField_image(rs.getString("field_image"));
				field_list.setField_price(rs.getInt("field_price"));
				field_list.setField_name(rs.getString("field_name"));
				field_list.setField_fst_location(rs.getString("field_fst_location"));
				field_list.setField_location(rs.getString("field_location"));
				field_list.setField_map(rs.getString("field_map"));
				field_list.setField_area(rs.getInt("field_area"));
				field_list.setField_usetime(rs.getString("field_usetime"));
				field_list.setField_facility(rs.getString("field_facility"));
				field_list.setField_call(rs.getString("field_call"));
			}
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return field_list;
	}
	
	// 자주가는 구장 저장
	@SuppressWarnings({ "resource", "null" })
	public int save_insert(field_save_Data save) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;
		
		try{
			rs = pstmt.executeQuery();
			sql="insert into favorite_field_save(save_num,user_id,save1,save2,save3,save4";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, save.getSave_num());
			pstmt.setString(2, save.getUser_id());
			pstmt.setString(3, save.getSave1());
			pstmt.setString(4, save.getSave2());
			pstmt.setString(5, save.getSave3());
			pstmt.setString(6, save.getSave4());
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	// 구장 예약페이지 셀렉트
	public Rent_info rent_info_select() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		Rent_info rent_selc=null;

		try{
			pstmt = con.prepareStatement("select * from rent_info;");
			rs= pstmt.executeQuery();

			if(rs.next()){
				rent_selc=new Rent_info();
				rent_selc.setRent_num(rs.getInt("rent_num"));
				rent_selc.setUser_id(rs.getString("user_id"));
				rent_selc.setField_name(rs.getString("field_name"));
				rent_selc.setRent_location(rs.getString("rent_location"));
				rent_selc.setRent_date(rs.getString("rent_date"));
				rent_selc.setRent_time1(rs.getString("rent_time1"));
				rent_selc.setRent_time2(rs.getString("rent_time2"));
				rent_selc.setRent_time3(rs.getString("rent_time3"));
				rent_selc.setRent_time4(rs.getString("rent_time4"));
				rent_selc.setRent_time5(rs.getString("rent_time5"));
				rent_selc.setRent_price(rs.getInt("rent_price"));

			}
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return rent_selc;
	}
	
	public ArrayList<KreblechoiData> field_cate_list(String loca) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<KreblechoiData> cate_list=new ArrayList<KreblechoiData>();
		try{
			
			pstmt = con.prepareStatement("select field_name from field_info where left(field_id,1)='"+loca+"';");
			rs= pstmt.executeQuery();
			while(rs.next()){
				KreblechoiData field_list=new KreblechoiData();
				field_list.setField_name(rs.getString("field_name"));
				cate_list.add(field_list);
			}
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return cate_list;
	}
	
	//예약 인서트
	public int rent_insert(Rent_situation situa)  {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="insert into rent_situation (rent_num,user_id,field_name,rent_date,rent_price) values (default,?,?,?,?)";
		int insertCount=0;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, situa.getUser_id());
			pstmt.setString(2, situa.getField_name());
			pstmt.setString(3, situa.getRent_date());
			pstmt.setInt(4, situa.getRent_price());
			System.out.println(pstmt);
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	// 예약 신청완료 셀렉트 문
	public Rent_situation field_finish_check() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		Rent_situation rent_situation=null;

		try{
			pstmt = con.prepareStatement("select * from rent_situation where rent_num=(select max(rent_num) from rent_situation);");
			rs= pstmt.executeQuery();

			if(rs.next()){
				rent_situation=new Rent_situation();
				rent_situation.setField_name(rs.getString("field_name"));
				rent_situation.setRent_date(rs.getString("rent_date"));
			}
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return rent_situation;
	}
	
	// 예약 신청 전체 현황 셀렉트
	public ArrayList<Rent_situation> rent_deadline_check() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<Rent_situation> rent_situation=new ArrayList<Rent_situation>();

		try{
			pstmt = con.prepareStatement("select field_name,rent_date from rent_situation;");
			rs= pstmt.executeQuery();

			while(rs.next()){
				Rent_situation rent_situa=new Rent_situation();
				rent_situa.setField_name(rs.getString("field_name"));
				rent_situa.setRent_date(rs.getString("rent_date"));
				rent_situation.add(rent_situa);
				}
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return rent_situation;
	}
	
	// 예약 신청 마감 업데이트
//	public int rent_close_update() {
//		int updateCount = 0;
//		PreparedStatement pstmt = null;
//		String sql="update rent_info set rent_time1=?,rent_time2,rent_time3,rent_time4,rent_time5 where BOARD_NUM=?";
//
//		try{
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, article.getBOARD_SUBJECT());
//			pstmt.setString(2, article.getBOARD_CONTENT());
//			pstmt.setInt(3, article.getBOARD_NUM());
//			updateCount = pstmt.executeUpdate();
//		}catch(Exception ex){
//		}finally{
//			close(pstmt);
//		}
//
//		return updateCount;
//
//	}
			
}
