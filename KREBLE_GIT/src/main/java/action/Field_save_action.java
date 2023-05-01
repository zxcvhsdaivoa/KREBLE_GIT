package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Field_save_Service;
import vo.ActionForward;
import vo.field_save_Data;

public class Field_save_action implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;
		field_save_Data save_list=null;
		Field_save_Service filedsaveService= new Field_save_Service();

		String save_num=request.getParameter("save_num");
				
		request.setAttribute("save_list", save_list);
		
		
		boolean issaveSuccess = filedsaveService.getfield_save(save_list);//메소드 호출
		// BoardWriteProService 클래스를 이용하여 게시물을 데이터베이스에 등록. 
		// issaveSuccess 변수는 게시물 등록에 성공하면 true, 실패하면 false 값을 가짐.
		
		System.out.println(issaveSuccess);
		if(!issaveSuccess){ //게시판 등록에 실패할 경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{ // 게시판 등록에 성공할 경우
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardList.bo"); //게시판 목록으로 이동
		}

		return forward;
		
	}  	
	
}
