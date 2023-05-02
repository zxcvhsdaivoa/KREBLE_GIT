package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import use_data.Shop_prd;
import use_data.UserData;
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
				si.setUser_id("No Data");
				si.setSquad_num(0);
				si.setSquad_name("No Data");
				si.setDirector("No Data");
				si.setPlayer1("No Data");
				si.setPlayer2("No Data");
				si.setPlayer3("No Data");
				si.setPlayer4("No Data");
				si.setPlayer5("No Data");
				si.setPlayer6("No Data");
				si.setPlayer7("No Data");
				si.setPlayer8("No Data");
				si.setPlayer9("No Data");
				si.setPlayer10("No Data");
				si.setPlayer11("No Data");
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

	// 마이페이지 관심상품 불러오기(likeinfo)
	public String[] likeinfo(String id) {
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
			sql = "select * from product where prd_no= '" + aa[0] + "' or prd_no='" + aa[1] + "' or prd_no='" + aa[2]
					+ "';";
			break;
		case 1:
			sql = "select * from product where prd_no= '" + aa[0] + "' or prd_no='" + aa[1] + "';";
			break;
		case 2:
			sql = "select * from product where prd_no= '" + aa[0] + "';";
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
}
