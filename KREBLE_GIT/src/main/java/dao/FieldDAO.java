package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public ArrayList<KreblechoiData> field_cate_list(String loca) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<KreblechoiData> cate_list=new ArrayList<KreblechoiData>();
		try{
			
			pstmt = con.prepareStatement("select field_name from field_info where field_fst_location='"+loca+"';");
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
	
	//예약 마감된 날짜 찾기
	public List<Integer> field_deadline(String loca,int month) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		List<Integer> deadline = new ArrayList<Integer>();
		try{
			
			pstmt = con.prepareStatement("select day(rent_date) as 'deadline' from rent_info where field_name=? and month(rent_date) = ? and rent_time1=1 and rent_time2=1 and rent_time3=1 and rent_time4=1 and rent_time5=1;");
			pstmt.setString(1, loca);
			pstmt.setInt(2, month);
			rs= pstmt.executeQuery();
			while(rs.next()){
				deadline.add(rs.getInt("deadline"));
			}
			if(!rs.next()) {
				deadline.add(0);
			}
			
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return deadline;
	}
	
	//예약 날짜 정보
	public Rent_info rent_time(String loca,int month,int day) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Rent_info ri = new Rent_info();
		try{
			
			pstmt = con.prepareStatement("select * from rent_info where field_name=? and month(rent_date) = ? and day(rent_date)=?;");
			pstmt.setString(1, loca);
			pstmt.setInt(2, month);
			pstmt.setInt(3, day);
			rs= pstmt.executeQuery();
			if(rs.next()){
				ri.setRent_time1(rs.getInt("rent_time1"));
				ri.setRent_time2(rs.getInt("rent_time2"));
				ri.setRent_time3(rs.getInt("rent_time3"));
				ri.setRent_time4(rs.getInt("rent_time4"));
				ri.setRent_time5(rs.getInt("rent_time5"));
			}
			else if(!rs.next()) {
				ri.setRent_time1(0);
				ri.setRent_time2(0);
				ri.setRent_time3(0);
				ri.setRent_time4(0);
				ri.setRent_time5(0);
			}
			
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return ri;
	}
	
	//예약 마감된 날짜
	public int field_price(String field_name) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		int price=0;
		try{
			
			pstmt = con.prepareStatement("select field_price from field_info where field_name=?;");
			pstmt.setString(1, field_name);
			rs= pstmt.executeQuery();
			if(rs.next()){
				price=rs.getInt("field_price");
			}
			else if(!rs.next()) {
				price=0;
			}
			
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return price;
	}
	
	
	//렌트인포 찾기
	public int find_rentinfo(Rent_situation situa) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		int find=0;
		try{
			
			pstmt = con.prepareStatement("select * from rent_info where field_name=? and rent_date=?;");
			pstmt.setString(1, situa.getField_name());
			pstmt.setString(2, situa.getRent_date());
			rs= pstmt.executeQuery();
			if(rs.next()){
				find=1;
			}
			
		}catch(Exception ex){
		}finally {
			close(rs);
			close(pstmt);
		}
		return find;
	}
	
	//예약 구장별,날짜별 정보 인서트
	public int rent_info_insert(int i,Rent_situation situa)  {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql=null;
		String quary1="insert into rent_info(rent_location,field_name,rent_date,rent_time1) values (?,?,?,1)";
		String quary2="insert into rent_info(rent_location,field_name,rent_date,rent_time2) values (?,?,?,1)";
		String quary3="insert into rent_info(rent_location,field_name,rent_date,rent_time3) values (?,?,?,1)";
		String quary4="insert into rent_info(rent_location,field_name,rent_date,rent_time4) values (?,?,?,1)";
		String quary5="insert into rent_info(rent_location,field_name,rent_date,rent_time5) values (?,?,?,1)";
		
		if(i==1) {
			sql=quary1;
		}else if(i==2) {
			sql=quary2;
		}else if(i==3) {
			sql=quary3;
		}else if(i==4) {
			sql=quary4;
		}else if(i==5) {
			sql=quary5;
		}
		int insertCount=0;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, situa.getRent_location());
			pstmt.setString(2, situa.getField_name());
			pstmt.setString(3, situa.getRent_date());
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	public int rent_info_update(int i, Rent_situation situa)  {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		String quary1="update rent_info set rent_time1=1 where field_name=? and rent_date=?";
		String quary2="update rent_info set rent_time2=1 where field_name=? and rent_date=?";
		String quary3="update rent_info set rent_time3=1 where field_name=? and rent_date=?";
		String quary4="update rent_info set rent_time4=1 where field_name=? and rent_date=?";
		String quary5="update rent_info set rent_time5=1 where field_name=? and rent_date=?";
		
		if(i==1) {
			sql=quary1;
		}else if(i==2) {
			sql=quary2;
		}else if(i==3) {
			sql=quary3;
		}else if(i==4) {
			sql=quary4;
		}else if(i==5) {
			sql=quary5;
		}
		
		int insertCount=0;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, situa.getField_name());
			pstmt.setString(2, situa.getRent_date());
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	//예약 현황 인서트
	public int rent_insert(Rent_situation situa)  {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="insert into rent_situation (rent_num,user_id,rent_location,field_name,rent_date,rent_price) values (default,?,?,?,?,?)";
		int insertCount=0;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, situa.getUser_id());
			pstmt.setString(2, situa.getRent_location());
			pstmt.setString(3, situa.getField_name());
			pstmt.setString(4, situa.getRent_date());
			pstmt.setInt(5, situa.getRent_price());
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
				rent_situation.setUser_id(rs.getString("user_id"));
				rent_situation.setRent_location(rs.getString("rent_location"));
				rent_situation.setField_name(rs.getString("field_name"));
				rent_situation.setRent_date(rs.getString("rent_date"));
				rent_situation.setRent_price(rs.getInt("rent_price"));
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
