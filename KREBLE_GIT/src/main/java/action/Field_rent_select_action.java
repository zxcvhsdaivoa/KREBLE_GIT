package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Field_list_Service;
import svc.Field_rent_Service;
import use_data.Shop_prd;
import vo.ActionForward;
import vo.KreblechoiData;
import vo.Rent_info;
import vo.Rent_situation;


public class Field_rent_select_action implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Rent_info rent_info=null;
		ArrayList<Rent_situation> rent_situation=new ArrayList<Rent_situation>();
		Field_rent_Service fieldrentService= new Field_rent_Service();
		
		rent_info = fieldrentService.getrent_list_check();
		request.setAttribute("rent_info", rent_info);
		
		rent_situation = fieldrentService.getrent_deadline_check();
		request.setAttribute("rent_situation", rent_situation);
		
		ActionForward forward= new ActionForward();
		forward.setPath("/field_rent.jsp");
		return forward;
	}
}
