package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SquadDAO;
import svc.User_my_page_service;
import use_data.Shop_prd;
import use_data.UserData;
import vo.ActionForward;
import vo.SquadInfo;
import vo.field_save_Data;

public class User_my_page_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("ID");
		UserData user_al = new UserData();// 유저정보
		ArrayList<field_save_Data> field_al = new ArrayList<field_save_Data>();// 경기장대여
		ArrayList<Shop_prd> plike_al = new ArrayList<Shop_prd>();// 관심상품
		ArrayList<SquadInfo> squad_al = new ArrayList<SquadInfo>();// 마이스쿼드
		ArrayList<Shop_prd> pcart_al = new ArrayList<Shop_prd>(); // 장바구니

		User_my_page_service mp = new User_my_page_service();
		String sqsize = mp.sqsize(id);
		user_al = mp.getUserInfo(id);
		squad_al = mp.getSquadInfo(id);
		pcart_al = mp.getCartInfo(id);
//		field_al = mp.getFieldInfo(id);
		plike_al = mp.getLikeInfo(id);
//		request.setAttribute("field_al", field_al);
		System.out.println(sqsize);
		System.out.println(user_al);
		System.out.println(squad_al);
		System.out.println(pcart_al);
		System.out.println(plike_al);
		request.setAttribute("user_al", user_al);
		request.setAttribute("plike_al", plike_al);
		request.setAttribute("pcart_al", pcart_al);
		request.setAttribute("squad_al", squad_al);
		request.setAttribute("sqs", sqsize);
		System.out.println("=============================");
		System.out.println(request.getAttribute("user_al"));
		System.out.println(request.getAttribute("plike_al"));
		System.out.println(request.getAttribute("pcart_al"));
		System.out.println(request.getAttribute("squad_al"));
		System.out.println(request.getAttribute("sqs"));
		ActionForward forward = null;
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("mypage.jsp");
		return forward;

	}

}