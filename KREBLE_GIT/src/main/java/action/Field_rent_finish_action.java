package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Field_rent_finish_Service;
import vo.ActionForward;
import vo.Rent_situation;

public class Field_rent_finish_action implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Rent_situation rent_situation=null;
		Field_rent_finish_Service fieldlistService= new Field_rent_finish_Service();
		
		rent_situation = fieldlistService.getrent_finish_check();
		request.setAttribute("rent_situation", rent_situation);
		ActionForward forward= new ActionForward();
		forward.setPath("/field_rent_finish.jsp");
		return forward;
	}
}
