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
	
	
	//공개설정된 클럽 전부 가져오기
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
				cl.setClup_name((rs.getString("clup_name")));
				cl.setClup_user(rs.getString("clup_admin"));
				cl.setClup_howjoin((rs.getString("clup_howjoin")));
				cl.setClup_pw((rs.getString("clup_pw")));
				cl.setClup_makedate((rs.getString("clup_makedate")));
				cl.setClup_logo((rs.getString("clup_logo")));
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
	
	
	//클럽 번호에 해당하는 클럽 가져오기
	public ClupInfo select_clup(int clup_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClupInfo cl= new ClupInfo();
		try{
			pstmt = con.prepareStatement("select * from clup_room where clup_no="+clup_no+";");
			rs= pstmt.executeQuery();
			if(rs.next()){
				cl.setClup_no((rs.getInt("clup_no")));
				cl.setClup_name((rs.getString("clup_name")));
				cl.setClup_user(rs.getString("clup_admin"));
				cl.setClup_howjoin((rs.getString("clup_howjoin")));
				cl.setClup_pw((rs.getString("clup_pw")));
				cl.setClup_text(rs.getString("clup_include"));
				cl.setClup_makedate((rs.getString("clup_makedate")));
				cl.setClup_logo((rs.getString("clup_logo")));
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return cl;
	}
	
	
	//클럽 번호에 해당하는 클럽의 채팅 가져오기
	public ArrayList<ClupInfo> select_clup_chat(int clup_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClupInfo> chat_list = new ArrayList<ClupInfo>();
		try{
			pstmt = con.prepareStatement("select * from clup_chat where clup_no="+clup_no+";");
			rs= pstmt.executeQuery();
			while(rs.next()){
				ClupInfo chat= new ClupInfo();
				chat.setClup_no((rs.getInt("clup_no")));
				chat.setClup_user(rs.getString("clup_member"));
				chat.setClup_text(rs.getString("clup_chat"));
				chat.setClup_text_time(rs.getString("clup_chat_time"));
				chat_list.add(chat);
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return chat_list;
	}
	
	
	//클럽 번호에 해당하는 클럽의 멤버 목록 가져오기
	public ArrayList<ClupInfo> select_member_list(int clup_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClupInfo> member_list = new ArrayList<ClupInfo>();
		try{
			pstmt = con.prepareStatement("select * from clup_member where clup_no="+clup_no+";");
			rs= pstmt.executeQuery();
			while(rs.next()){
				ClupInfo member= new ClupInfo();
				member.setClup_no((rs.getInt("clup_no")));
				member.setClup_user(rs.getString("member_id"));
				member.setClup_rank(rs.getString("clup_rank"));
				member.setClup_joindate(rs.getString("clup_joindate"));
				member.setClup_lastday(rs.getString("clup_memberLastday"));
				member_list.add(member);
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return member_list;
	}
	
	
	//현재 아이디가 해당 클럽에 가입되어 있는가
	public int search_is_member(int no, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ismember=0;
		try{
			pstmt = con.prepareStatement("select * from clup_member where clup_no=? and member_id=?;");
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			rs= pstmt.executeQuery();
			if(rs.next()){
				ismember=1;
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return ismember;
	}
	
	
	//클럽 만들기
	public int create_clup(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_room value(default,?,?,?,?,?,default,?,?);");
			pstmt.setString(1,cl.getClup_name());
			pstmt.setString(2,cl.getClup_user());
			pstmt.setString(3,cl.getClup_howjoin());
			pstmt.setString(4,cl.getClup_pw());
			pstmt.setString(5,cl.getClup_text());
			pstmt.setString(6,cl.getClup_logo());
			pstmt.setString(7,cl.getClup_disclose());
			count= pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	//클럽 생성후 자동으로 생성자의 어드민 등록
	@SuppressWarnings("resource")
	public int insert_admin(ClupInfo cl) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int clup_no=0;
		int success=0;
		String cl_no="insert into clup_member value(?,?,'admin',default,now())";
		try{
			pstmt = con.prepareStatement("select clup_no from clup_room order by clup_no desc limit 1");
			rs= pstmt.executeQuery();
			if(rs.next()) clup_no =rs.getInt("clup_no");
			else clup_no=0;
			
			pstmt = con.prepareStatement(cl_no);
			pstmt.setInt(1, clup_no);
			pstmt.setString(2, cl.getClup_user());
			success=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return success;
	}
	
	
	//클럽 비밀번호 체크
	@SuppressWarnings("resource")
	public boolean clup_pwcheck(int no, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isck = false;
		try{
			pstmt = con.prepareStatement("select clup_no from clup_room where clup_no=? and clup_pw=? and clup_howjoin='password';");
			pstmt.setInt(1, no);
			pstmt.setString(2, pw);
			rs= pstmt.executeQuery();
			if(rs.next()) isck=true;
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return isck;
	}
	
	
	//클럽 가입
	public int join_clup(String id, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_member value(?,?,'new',default,now());");
			pstmt.setInt(1,no);
			pstmt.setString(2,id);
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	//클럽 가입신청 
	public int join_clup_reque(String id, int no,String jointext) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("insert into clup_join value(?,?,?,default);");
			pstmt.setInt(1,no);
			pstmt.setString(2,id);
			pstmt.setString(3,jointext);
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	//클럽 멤버 추방
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
	
	
	//멤버 직위 설정
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
	
	
	//클럽멤버 마지막 접속일 업데이트
	public int clup_mamber_lastday(int no, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try{
			pstmt = con.prepareStatement("update clup_member set clup_memberLastday = now() where clup_no=? and member_id=?;");
			pstmt.setInt(1,no);
			pstmt.setString(2,id);
			count= pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	//채팅 작성
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
	
	
	//클럽 공지 작성
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
