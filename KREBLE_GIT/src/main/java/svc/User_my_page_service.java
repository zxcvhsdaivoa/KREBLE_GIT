package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.User_Mypage;
import dao.Shop_DAO;
import dao.SquadDAO;
import use_data.Shop_prd;
import use_data.UserData;
import vo.SquadInfo;
import vo.field_save_Data;

public class User_my_page_service {
	Connection con;

	public User_my_page_service() {
		con = getConnection();
	}
	//캐쉬 충전
	public int cashUpdate(String id) throws Exception {
		int success = 0;
		User_Mypage mpage = User_Mypage.getInstance();
		mpage.setConnection(con);
		int cash = mpage.havecash(id);
		success = mpage.cashUp(cash, id);
		return success;
	}
	//유저정보 가져오기
	public UserData getUserInfo(String id) throws Exception {
		UserData uu = new UserData();
		User_Mypage mpage = User_Mypage.getInstance();
		mpage.setConnection(con);

		String an = mpage.userinfo(id, "nick");
		String ap = mpage.userinfo(id, "prof");

		uu.setNick(an);
		uu.setUser_prof(ap);

		return uu;
	}
	//스쿼드 정보 가져오기
	public SquadInfo getSquadInfo(String id) throws Exception {
		SquadInfo si = new SquadInfo();
		User_Mypage mpage = User_Mypage.getInstance();
		mpage.setConnection(con);

		si = mpage.squadinfo(id);
		return si;
	}
	//스쿼드 사이즈 가져오기
	public String sqsize(String id) throws Exception {
		String asd = "";
		SquadDAO aa = SquadDAO.getInstance();
		aa.setConnection(con);

		asd = ""+aa.Squad_cnt(id);

		return asd;
	}
	//관심상품 사이즈 가져오기
	public String lisize(String id) throws Exception {
		String asd = "";
		Shop_DAO aa = Shop_DAO.getInstance();
		aa.setConnection(con);

		asd = ""+aa.like_cnt(id);

		return asd;
	}
	//장바구니 사이즈 가져오기
	public String casize(String id) throws Exception {
		String asd = "";
		Shop_DAO aa = Shop_DAO.getInstance();
		aa.setConnection(con);

		asd = ""+aa.cart_cnt(id);

		return asd;
	}
	
	//필드 정보 가져오기
	public ArrayList<field_save_Data> getFieldInfo(String id) throws Exception {
		ArrayList<field_save_Data> fs = new ArrayList<field_save_Data>();
		User_Mypage mpage = User_Mypage.getInstance();
		mpage.setConnection(con);

		return fs;
	}
	//장바구니 가져오기
	public ArrayList<Shop_prd> getCartInfo(String id) throws Exception {
		ArrayList<Shop_prd> sp = new ArrayList<Shop_prd>();
		User_Mypage mpage = User_Mypage.getInstance();
		mpage.setConnection(con);
		String[] aa = new String[3];

		aa = mpage.cartinfo(id);
		sp = mpage.prd_info(aa);

		
		return sp;
	}
	//관심상품 가져오기
	public ArrayList<Shop_prd> getLikeInfo(String id) throws Exception {
		ArrayList<Shop_prd> sp = new ArrayList<Shop_prd>();
		User_Mypage mpage = User_Mypage.getInstance();
		mpage.setConnection(con);
		String[] aa = new String[3];

		aa = mpage.likeinfo(id);
		sp = mpage.prd_info(aa);
		
		close(con);
		return sp;
	}
}