package action;

import java.io.PrintWriter;
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

public class User_cashupd_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("ID");
		User_my_page_service aa = new User_my_page_service();
		int success = aa.cashUpdate(id);
		PrintWriter out = response.getWriter();
		if(success == 1) {
			out.println("true");
		}else {
			out.println("false");
		}
		
		
		return null;
	}
}