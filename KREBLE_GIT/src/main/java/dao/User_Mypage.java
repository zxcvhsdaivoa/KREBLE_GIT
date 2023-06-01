package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import db.JdbcUtil;
import use_data.Shop_prd;
import vo.AlarmInfo;
import vo.SquadInfo;

public class User_Mypage {
	DataSource ds;
	Connection con;
	private static User_Mypage mpage;

	private User_Mypage() {
	}

	public static User_Mypage getInstance() {
		if (mpage == null) {
			mpage = new User_Mypage();
		}
		return mpage;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	// 캐쉬충전
		public int cashUp(int cash, String id) {
			PreparedStatement pstmt = null;
			String sql = "";
			int insertCount = 0;
			try {
					sql = "UPDATE user SET user_cash = ? where user_id = ?;";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, cash);
					pstmt.setString(2, id);
					insertCount = pstmt.executeUpdate();
					
				} catch (Exception ex) {
					System.out.println(ex);
				} finally {
					close(pstmt);
					JdbcUtil.commit(con);
			}
			return insertCount;

		}
	// userinfo 보유캐쉬 불러오기
	public int havecash(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int havecash = 0;
		try {
			String sql = "select user_cash from user where user_id =?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				havecash = rs.getInt("user_cash") + 1000000;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return havecash;
	}
	// 마이페이지 유저정보 불러오기(userinfo)
	public String userinfo(String id, String select) {
		String alud = "null";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from user where user_id =?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (select.equals("nick")) {
					alud = rs.getString("user_nick");
				} else if (select.equals("prof")) {
					alud = rs.getString("user_prof");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
			
		}
		return alud;
	}

	// 마이페이지 스쿼드 불러오기(squad)
	public SquadInfo squadinfo(String id) {
		SquadInfo si = new SquadInfo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "select * from mysquad where view_count = (select max(view_count) from mysquad where user_id =?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				si.setUser_id(rs.getString("user_id"));
				si.setSquad_num(rs.getInt("mysquad_no"));
				si.setSquad_name(rs.getString("mysquad_name"));
				si.setDirector(rs.getString("director"));
				si.setPlayer1(rs.getString("player1"));
				si.setPlayer2(rs.getString("player2"));
				si.setPlayer3(rs.getString("player3"));
				si.setPlayer4(rs.getString("player4"));
				si.setPlayer5(rs.getString("player5"));
				si.setPlayer6(rs.getString("player6"));
				si.setPlayer7(rs.getString("player7"));
				si.setPlayer8(rs.getString("player8"));
				si.setPlayer9(rs.getString("player9"));
				si.setPlayer10(rs.getString("player10"));
				si.setPlayer11(rs.getString("player11"));
			} else {
				si.setUser_id("nosquad");
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return si;
	}

	// 마이페이지 장바구니 불러오기(cart)
	public String[] cartinfo(String id) {
		String[] aa = new String[3];
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "select sb_prd from shop_back where sb_buy_id = ? limit 3;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			int i = 0;
			while (rs.next()) {
				aa[i] = rs.getString("sb_prd");
				i++;
			}
			if (i < 3) {
				for (int j = i; j < 3; j++) {
					aa[j] = "No Data";
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return aa;
	}

	// 마이페이지 관심상품 불러오기(likeinfo)
	public String[] likeinfo(String id) {
		String[] aa = new String[3];
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "select p_no from shop_prd_like where u_id = ? limit 3;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			int i = 0;
			while (rs.next()) {
				aa[i] = rs.getString("p_no");
				i++;
			}
			if (i < 3) {
				for (int j = i; j < 3; j++) {
					aa[j] = "No Data";
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return aa;
	}

	//경기장임대 등록개수
	public int rent_cnt(String user_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sc=0;
		try{
			pstmt = con.prepareStatement("SELECT count(user_id) FROM kreble.rent_situation where user_id like ?");
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
	// 관심상품/장바구니에 대한 상품정보 불러오기
	public ArrayList<Shop_prd> prd_info(String[] aa) {
		ArrayList<Shop_prd> alsp = new ArrayList<Shop_prd>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int cnt = 0;
		for (int ii = 0; ii < 3; ii++) {
			if (aa[ii].equals("No Data")) {
				cnt++;
			}
		}
		switch (cnt) {
		case 0:
			sql = "select * from shop_product where prd_no= '" + aa[0] + "' or prd_no='" + aa[1] + "' or prd_no='" + aa[2]
					+ "';";
			break;
		case 1:
			sql = "select * from shop_product where prd_no= '" + aa[0] + "' or prd_no='" + aa[1] + "';";
			break;
		case 2:
			sql = "select * from shop_product where prd_no= '" + aa[0] + "';";
			break;
		case 3:
			sql = "No Data";
			break;
		}

		if (cnt < 3) {
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Shop_prd sp = new Shop_prd();
					sp.setPrd_no(rs.getString("prd_no"));
					sp.setPrd_name(rs.getString("prd_name"));
					sp.setPrd_cata(rs.getString("prd_cata"));
					sp.setPrd_price(Integer.parseInt(rs.getString("prd_price")));
					sp.setPrd_color(rs.getString("prd_color"));
					sp.setPrd_qant(Integer.parseInt(rs.getString("prd_qant")));
					sp.setPrd_img(rs.getString("prd_img"));
					sp.setPrd_note(rs.getString("prd_note"));
					alsp.add(sp);
				}

			} catch (Exception e) {
				System.out.println(e);
			} finally {
				close(rs);
				close(pstmt);
			}
		} else {
			Shop_prd sp = new Shop_prd();
			sp.setPrd_no("No Data");
			sp.setPrd_name("No Data");
			sp.setPrd_cata("No Data");
			sp.setPrd_price(0);
			sp.setPrd_color("No Data");
			sp.setPrd_qant(0);
			sp.setPrd_img("No Data");
			sp.setPrd_note("No Data");
			alsp.add(sp);
		}
		return alsp;
	}
	
	
	// 알림리스트 불러오기
	public ArrayList<AlarmInfo> getAlarmList(String id) {
		ArrayList<AlarmInfo> all = new ArrayList<AlarmInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_alarm where user_id = ? order by alarm_time desc;";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AlarmInfo al = new AlarmInfo();
				al.setAlarm_pk(rs.getInt("alarm_pk"));
				al.setUser_id(rs.getString("user_id"));
				al.setAlarm_view(rs.getInt("alarm_view"));
				al.setAlarm_type(rs.getString("alarm_type"));
				al.setAlarm_no(rs.getInt("alarm_no"));
				al.setAlarm_time(rs.getString("alarm_time"));
				all.add(al);
			} 

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return all;
	}
	
	
	public int noreadAlarm(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int i=0;
		String sql = "select * from user_alarm where user_id = ? and alarm_view=1 limit 1;";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				i=1;
			} 

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return i;
	}
	
	
	// 알림 불러오기
	public AlarmInfo getAlarm(String id,int no) {
		AlarmInfo al = new AlarmInfo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_alarm where user_id = ? and alarm_pk=?;";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				al.setAlarm_pk(rs.getInt("alarm_pk"));
				al.setUser_id(rs.getString("user_id"));
				al.setAlarm_view(rs.getInt("alarm_view"));
				al.setAlarm_type(rs.getString("alarm_type"));
				al.setAlarm_no(rs.getInt("alarm_no"));
				al.setAlarm_time(rs.getString("alarm_time"));
			} 

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return al;
	}
		
	
	// 알람 등록
	public int setAlarm(AlarmInfo alarm) {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		String sql = "insert into user_alarm values(default,?,1,?,?,default)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, alarm.getUser_id());
			pstmt.setString(2, alarm.getAlarm_type());
			pstmt.setInt(3, alarm.getAlarm_no());
			insertCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return insertCount;
	}
	
	
	public int updateAlarmView(String id, int no){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update user_alarm set alarm_view=0 where user_id=? and alarm_pk=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;
	}
	
	public int deleteAlarm(String id, int no){

		int deleteCount = 0;
		PreparedStatement pstmt = null;
		String sql="delete from user_alarm where user_id=? and alarm_pk=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return deleteCount;
	}
}
