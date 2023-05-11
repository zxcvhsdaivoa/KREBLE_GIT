package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Field_rent_insr_Service;
import vo.ActionForward;
import vo.Rent_situation;



public class Field_rent_insr_action implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;
		Rent_situation rent_insr=null;
		HttpSession session = request.getSession();//세션에 등록된 아이디를 사용하기 위해 세션 설정 
		
		rent_insr = new Rent_situation();
		rent_insr.setRent_date(request.getParameter("rent_date"));
		rent_insr.setField_name(request.getParameter("field_name"));
		rent_insr.setUser_id((String)session.getAttribute("ID"));
		Field_rent_insr_Service rentinsrService = new Field_rent_insr_Service();
		boolean isinsrSuccess = rentinsrService.field_rentinsr(rent_insr);//메소드 호출
		// BoardWriteProService 클래스를 이용하여 게시물을 데이터베이스에 등록. 
		// issaveSuccess 변수는 게시물 등록에 성공하면 true, 실패하면 false 값을 가짐.
		
		System.out.println(isinsrSuccess);

		if(!isinsrSuccess){ //등록에 실패할 경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{ //등록에 성공할 경우
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("rent_finish.choi");
		}

		return forward;
		
	}  	
}
