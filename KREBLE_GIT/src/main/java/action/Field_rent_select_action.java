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
		ArrayList<KreblechoiData> cate_list=new ArrayList<KreblechoiData>();
		Rent_info rent_info=null;
		ArrayList<Rent_situation> rent_situation=new ArrayList<Rent_situation>();
		String location = "not";
		System.out.println(request.getParameter("location"));
		
		if(request.getParameter("location")!=null&&!request.getParameter("location").equals("null")&&request.getParameter("location")!="") {
			location=request.getParameter("location");
		}
		
		System.out.println(location+" 예약 선택 페이지 액션에 location 변수 출력 확인");
		Field_rent_Service fieldrentService= new Field_rent_Service();
		
		rent_info = fieldrentService.getrent_list_check();
		
		request.setAttribute("rent_info", rent_info);
		if(!location.equals("not")) {
			cate_list = fieldrentService.getfield_cate_list(location);
			request.setAttribute("cate_list", cate_list);
		}
		rent_situation = fieldrentService.getrent_deadline_check();
		request.setAttribute("rent_situation", rent_situation);
		
		ActionForward forward= new ActionForward();
		forward.setPath("/field_rent.jsp");
		return forward;
	}
}
