package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.ClupInfo;

public class Clup_DAO {
	DataSource ds;
	Connection con;
	private static Clup_DAO clupDAO;

	private Clup_DAO() {
	}

	public static Clup_DAO getInstance(){
		if(clupDAO == null){
			clupDAO = new Clup_DAO();
		}
		return clupDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	
	public ArrayList<ClupInfo> select_clup_list() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClupInfo> cl_list = new ArrayList<ClupInfo>();
		try{
			pstmt = con.prepareStatement("select * from clup_room where clup_disclose='1';");
			rs= pstmt.executeQuery();
			while(rs.next()){
				ClupInfo cl= new ClupInfo();
				cl.setClup_no((rs.getInt("clup_no")));
				cl_list.add(cl);
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return cl_list;
	}
	
	
	public int create_clup(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_room value(default,?,?,?,?,default,?,?);");
			pstmt.setString(1,cl.getClup_name());
			pstmt.setString(2,cl.getClup_user());
			pstmt.setString(3,cl.getClup_howjoin());
			pstmt.setString(4,cl.getClup_pw());
			pstmt.setString(5,cl.getClup_logo());
			pstmt.setString(6,cl.getClup_disclose());
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	public int join_clup(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_join value(?,?,?);");
			pstmt.setInt(1,cl.getClup_no());
			pstmt.setString(2,cl.getClup_user());
			pstmt.setString(3,cl.getClup_text());
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	public int clup_add_mamber(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_member value(?,?,'new',default);");
			pstmt.setInt(1,cl.getClup_no());
			pstmt.setString(2,cl.getClup_user());
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	public int clup_remove_member(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("delete from clup_member where clup_no=? and member_id=?");
			pstmt.setInt(1,cl.getClup_no());
			pstmt.setString(2,cl.getClup_user());
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	public int clup_update_mamber(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("update clup_member set clup_rank=? where clup_no=? and member_id=?;");
			pstmt.setString(1,cl.getClup_rank());
			pstmt.setInt(2,cl.getClup_no());
			pstmt.setString(3,cl.getClup_user());
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	public int write_chat(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_chat value(?,?,?,default);");
			pstmt.setInt(1,cl.getClup_no());
			pstmt.setString(2,cl.getClup_user());
			pstmt.setString(3,cl.getClup_text());
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	public int write_notice(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_notice value(?,?,?,default);");
			pstmt.setInt(1,cl.getClup_no());
			pstmt.setString(2,cl.getClup_user());
			pstmt.setString(3,cl.getClup_text());
			count= pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
}
