package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SquadDAO;
import svc.User_my_page_service;
import use_data.Db_method_rent;
import use_data.Shop_prd;
import use_data.UserData;
import vo.ActionForward;
import vo.Rent_situation;
import vo.SquadInfo;
import vo.field_save_Data;

public class User_my_page_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("ID");
		UserData user_al = new UserData();// 유저정보
		ArrayList<Shop_prd> plike_al = new ArrayList<Shop_prd>();// 관심상품
		SquadInfo squad_al = new SquadInfo();// 마이스쿼드
		ArrayList<Shop_prd> pcart_al = new ArrayList<Shop_prd>(); // 장바구니
		Db_method_rent rent = new Db_method_rent();
		ArrayList<Rent_situation> myrent = rent.my_rent(id);
		
		User_my_page_service mp = new User_my_page_service();
		String sqsize = mp.sqsize(id);
		int field_si = mp.getFieldInfo(id);
		String like_si = mp.lisize(id);
		String cart_si = mp.casize(id);
		user_al = mp.getUserInfo(id);
		squad_al = mp.getSquadInfo(id);
		pcart_al = mp.getCartInfo(id);
		plike_al = mp.getLikeInfo(id);
		request.setAttribute("user_al", user_al);
		request.setAttribute("pcart_al", pcart_al);
		request.setAttribute("plike_al", plike_al);
		request.setAttribute("squad_al", squad_al);
		request.setAttribute("myrent", myrent);
		request.setAttribute("sqs", sqsize);
		request.setAttribute("cas", cart_si);
		request.setAttribute("lis", like_si);
		request.setAttribute("rent", field_si);
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		return forward;
	}
}