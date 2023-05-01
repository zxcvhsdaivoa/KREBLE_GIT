package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.SquadInfo;

public class SquadDAO {
	DataSource ds;
	Connection con;
	private static SquadDAO commuDAO;

	private SquadDAO() {
	}

	public static SquadDAO getInstance(){
		if(commuDAO == null){
			commuDAO = new SquadDAO();
		}
		return commuDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	//마이스쿼드 등록개수
	public int Squad_cnt(String user_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sc=0;
		try{
			pstmt = con.prepareStatement("select count(user_id) from mysquad where user_id = ?;");
			pstmt.setString(1, user_id);
			rs= pstmt.executeQuery();
			if(rs.next()){
				sc = rs.getInt("count(user_id)");
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return sc;
	}
	
	@SuppressWarnings("null")
	public ArrayList<SquadInfo> selectUserSquad(String user_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SquadInfo squad = null;
		ArrayList<SquadInfo> squadList=new ArrayList<SquadInfo>();
		try{
			pstmt = con.prepareStatement("select * from mysquad where user_id = ? order by mysquad_no desc;");
			pstmt.setString(1, user_id);
			rs= pstmt.executeQuery();
			while(rs.next()){
				squad=new SquadInfo();
				squad.setUser_id(rs.getString("user_id"));
				squad.setSquad_num(rs.getInt("mysquad_no"));
				squad.setSquad_name(rs.getString("mysquad_name"));
				squad.setFormation(rs.getString("formation"));
				squad.setDirector(rs.getString("director"));
				squad.setPlayer1(rs.getString("player1"));
				squad.setPlayer2(rs.getString("player2"));
				squad.setPlayer3(rs.getString("player3"));
				squad.setPlayer4(rs.getString("player4"));
				squad.setPlayer5(rs.getString("player5"));
				squad.setPlayer6(rs.getString("player6"));
				squad.setPlayer7(rs.getString("player7"));
				squad.setPlayer8(rs.getString("player8"));
				squad.setPlayer9(rs.getString("player9"));
				squad.setPlayer10(rs.getString("player10"));
				squad.setPlayer11(rs.getString("player11"));
				squad.setDisclose(rs.getString("disclose"));
				squad.setMake_date(rs.getDate("make_date"));
				squad.setView_count(rs.getInt("view_count"));
				squadList.add(squad);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return squadList;
	}

	
	@SuppressWarnings("null")
	public ArrayList<SquadInfo> selectSquadList(int page, int limit){
		int startrow=(page-1)*limit; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SquadInfo squad = null;
		ArrayList<SquadInfo> allList=new ArrayList<SquadInfo>();
		try{
			pstmt = con.prepareStatement("select * from mysquad where disclose='yes' order by mysquad_no desc limit "+startrow+", "+limit+";");
			rs= pstmt.executeQuery();
			while(rs.next()){
				squad=new SquadInfo();
				squad.setUser_id(rs.getString("user_id"));
				squad.setSquad_num(rs.getInt("mysquad_no"));
				squad.setSquad_name(rs.getString("mysquad_name"));
				squad.setFormation(rs.getString("formation"));
				squad.setDisclose(rs.getString("disclose"));
				squad.setMake_date(rs.getDate("make_date"));
				squad.setView_count(rs.getInt("view_count"));
				allList.add(squad);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return allList;
	}
	
	@SuppressWarnings("null")
	public ArrayList<SquadInfo> selectOrderSquadList(String[] order,int page, int limit){
		int startrow=(page-1)*limit; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SquadInfo squad = null;
		ArrayList<SquadInfo> allList=new ArrayList<SquadInfo>();
		try{
			pstmt = con.prepareStatement("select * from mysquad where disclose='yes' order by "+order[0]+" "+order[1]+" limit "+startrow+", "+limit+";");
			rs= pstmt.executeQuery();
			while(rs.next()){
				squad=new SquadInfo();
				squad.setUser_id(rs.getString("user_id"));
				squad.setSquad_num(rs.getInt("mysquad_no"));
				squad.setSquad_name(rs.getString("mysquad_name"));
				squad.setFormation(rs.getString("formation"));
				squad.setDisclose(rs.getString("disclose"));
				squad.setMake_date(rs.getDate("make_date"));
				squad.setView_count(rs.getInt("view_count"));
				allList.add(squad);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return allList;
	}
	
	@SuppressWarnings("null")
	public ArrayList<SquadInfo> selectSerachSquadList(String search,String search_text,int page, int limit){
		int startrow=(page-1)*limit; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SquadInfo squad = null;
		ArrayList<SquadInfo> allList=new ArrayList<SquadInfo>();
		try{
			pstmt = con.prepareStatement("select * from mysquad where disclose='yes' and "+search+" like '%"+search_text+"%' order by mysquad_no desc limit "+startrow+", "+limit+";");
			rs= pstmt.executeQuery();
			while(rs.next()){
				squad=new SquadInfo();
				squad.setUser_id(rs.getString("user_id"));
				squad.setSquad_num(rs.getInt("mysquad_no"));
				squad.setSquad_name(rs.getString("mysquad_name"));
				squad.setFormation(rs.getString("formation"));
				squad.setDisclose(rs.getString("disclose"));
				squad.setMake_date(rs.getDate("make_date"));
				squad.setView_count(rs.getInt("view_count"));
				allList.add(squad);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return allList;
	}
	
	@SuppressWarnings("null")
	public ArrayList<SquadInfo> selectSearchOrderSquadList(String search,String search_text,String[] order,int page, int limit){
		int startrow=(page-1)*limit; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SquadInfo squad = null;
		ArrayList<SquadInfo> allList=new ArrayList<SquadInfo>();
		try{
			pstmt = con.prepareStatement("select * from mysquad where disclose='yes' and "+search+" like '%"+search_text+"%' order by "+order[0]+" "+order[1]+" limit "+startrow+", "+limit+";");
			rs= pstmt.executeQuery();
			while(rs.next()){
				squad=new SquadInfo();
				squad.setUser_id(rs.getString("user_id"));
				squad.setSquad_num(rs.getInt("mysquad_no"));
				squad.setSquad_name(rs.getString("mysquad_name"));
				squad.setFormation(rs.getString("formation"));
				squad.setDisclose(rs.getString("disclose"));
				squad.setMake_date(rs.getDate("make_date"));
				squad.setView_count(rs.getInt("view_count"));
				allList.add(squad);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return allList;
	}
	
	
	public int selectAllSquadCount(){
		int count=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = con.prepareStatement("select count(*) from mysquad where disclose='yes';");
			rs= pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count(*)");
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return count;
	}
	
	public int selectSearchSquadCount(String search, String search_text){
		int count=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = con.prepareStatement("select count(*) from mysquad where disclose='yes' and "+search+" like '%"+search_text+"%';");
			rs= pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count(*)");
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return count;
	}
	
	
	@SuppressWarnings("null")
	public ArrayList<SquadInfo> selectSearchSquad(int page, int limit){
		int startrow=(page-1)*limit; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SquadInfo squad = null;
		ArrayList<SquadInfo> allList=new ArrayList<SquadInfo>();
		try{
			pstmt = con.prepareStatement("select * from mysquad where disclose='yes' order by mysquad_no desc limit "+startrow+", "+limit+";");
			rs= pstmt.executeQuery();
			while(rs.next()){
				squad=new SquadInfo();
				squad.setUser_id(rs.getString("user_id"));
				squad.setSquad_num(rs.getInt("mysquad_no"));
				squad.setSquad_name(rs.getString("mysquad_name"));
				squad.setFormation(rs.getString("formation"));
				squad.setDisclose(rs.getString("disclose"));
				squad.setMake_date(rs.getDate("make_date"));
				squad.setView_count(rs.getInt("view_count"));
				allList.add(squad);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return allList;
	}
	
	
	
	
	@SuppressWarnings("null")
	public SquadInfo selectSquad(int no){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SquadInfo squad = new SquadInfo();
		try{
			pstmt = con.prepareStatement("select * from mysquad where mysquad_no = ?;");
			pstmt.setInt(1, no);
			rs= pstmt.executeQuery();
			if(rs.next()){
				squad.setUser_id(rs.getString("user_id"));
				squad.setSquad_num(rs.getInt("mysquad_no"));
				squad.setSquad_name(rs.getString("mysquad_name"));
				squad.setFormation(rs.getString("formation"));
				squad.setDirector(rs.getString("director"));
				squad.setPlayer1(rs.getString("player1"));
				squad.setPlayer2(rs.getString("player2"));
				squad.setPlayer3(rs.getString("player3"));
				squad.setPlayer4(rs.getString("player4"));
				squad.setPlayer5(rs.getString("player5"));
				squad.setPlayer6(rs.getString("player6"));
				squad.setPlayer7(rs.getString("player7"));
				squad.setPlayer8(rs.getString("player8"));
				squad.setPlayer9(rs.getString("player9"));
				squad.setPlayer10(rs.getString("player10"));
				squad.setPlayer11(rs.getString("player11"));
				squad.setDisclose(rs.getString("disclose"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return squad;
	}
	
	
	@SuppressWarnings("null")
	public int selectSquadLastNo(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int last_no=0;
		try{
			pstmt = con.prepareStatement("select mysquad_no from mysquad ORDER BY mysquad_no DESC LIMIT 1;");
			rs= pstmt.executeQuery();
			if(rs.next()){
				last_no=rs.getInt("mysquad_no");
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return last_no;

	}
	
	
	@SuppressWarnings("resource")
	public int saveSquad(SquadInfo squad){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into mysquad (user_id,mysquad_no,mysquad_name,formation,director,player1,player2,player3,player4,player5,player6,player7,player8,player9,player10,player11,make_date) values(?,default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now());";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, squad.getUser_id());
			pstmt.setString(2, squad.getSquad_name());
			pstmt.setString(3, squad.getFormation());
			pstmt.setString(4, squad.getDirector());
			pstmt.setString(5, squad.getPlayer1());
			pstmt.setString(6, squad.getPlayer2());
			pstmt.setString(7, squad.getPlayer3());
			pstmt.setString(8, squad.getPlayer4());
			pstmt.setString(9, squad.getPlayer5());
			pstmt.setString(10, squad.getPlayer6());
			pstmt.setString(11, squad.getPlayer7());
			pstmt.setString(12, squad.getPlayer8());
			pstmt.setString(13, squad.getPlayer9());
			pstmt.setString(14, squad.getPlayer10());
			pstmt.setString(15, squad.getPlayer11());
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	
	public int updateArticle(SquadInfo article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update mysquad set mysquad_name=?,formation=?,director=?,player1=?,player2=?,player3=?,player4=?,player5=?,player6=?,player7=?,player8=?,player9=?,player10=?,player11=? where mysquad_no=? and user_id=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getSquad_name());
			pstmt.setString(2, article.getFormation());
			pstmt.setString(3, article.getDirector());
			pstmt.setString(4, article.getPlayer1());
			pstmt.setString(5, article.getPlayer2());
			pstmt.setString(6, article.getPlayer3());
			pstmt.setString(7, article.getPlayer4());
			pstmt.setString(8, article.getPlayer5());
			pstmt.setString(9, article.getPlayer6());
			pstmt.setString(10, article.getPlayer7());
			pstmt.setString(11, article.getPlayer8());
			pstmt.setString(12, article.getPlayer9());
			pstmt.setString(13, article.getPlayer10());
			pstmt.setString(14, article.getPlayer11());
			pstmt.setInt(15, article.getSquad_num());
			pstmt.setString(16, article.getUser_id());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;
	}
	

	public int updateDisclose(SquadInfo article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update mysquad set disclose=? where mysquad_no=? and user_id=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getDisclose());
			pstmt.setInt(2, article.getSquad_num());
			pstmt.setString(3, article.getUser_id());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;
	}
	
	
	@SuppressWarnings("resource")
	public int updateViewCount(int squad_no){
		
		int view_count = 0;
		int updateCount = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql="update mysquad set view_count=? where mysquad_no=?";
		try{
			pstmt=con.prepareStatement("select view_count from mysquad where mysquad_no ="+squad_no);
			rs = pstmt.executeQuery();

			if(rs.next()) view_count =rs.getInt("view_count")+1;
			else view_count=1;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, view_count);
			pstmt.setInt(2, squad_no);
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;
	}
	
	
	public int deleteArticle(int squad_no, String user_id){

		PreparedStatement pstmt = null;
		String commu_delete_sql="delete from mysquad where mysquad_no=? and user_id=?";
		int deleteCount=0;
		try{
			pstmt=con.prepareStatement(commu_delete_sql);
			pstmt.setInt(1, squad_no);
			pstmt.setString(2, user_id);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	
	
	
}
