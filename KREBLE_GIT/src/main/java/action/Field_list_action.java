package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Field_list_Service;
import vo.ActionForward;
import vo.KreblechoiData;


public class Field_list_action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		KreblechoiData field_list=null;
		String id=request.getParameter("field_id");
		Field_list_Service fieldlistService= new Field_list_Service();
		
		field_list = fieldlistService.getfield_list_check(id);
		request.setAttribute("field_list", field_list);
		ActionForward forward= new ActionForward();
		forward.setPath("/kreblechoi.jsp");
		return forward;
	}
	
}
