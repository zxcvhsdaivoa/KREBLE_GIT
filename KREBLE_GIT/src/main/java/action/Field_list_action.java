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
		String id=request.getParameter("field_id"); // 필드 정보를 받아오기 위해 id를 받아옴
		if(id==null) {
			id="s_000"; // 값이 null이면 default를 s_000으로 지정
		}
		Field_list_Service fieldlistService= new Field_list_Service();
		
		field_list = fieldlistService.getfield_list_check(id); //field_id를 넘겨주고 그 정보를 조회
		request.setAttribute("field_list", field_list);
		ActionForward forward= new ActionForward();
		forward.setPath("/kreblechoi.jsp");
		return forward;
	}
	
}
