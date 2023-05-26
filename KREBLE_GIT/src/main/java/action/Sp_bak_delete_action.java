package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Sp_back_delete_service;
import svc.Sp_back_insert_service;
import vo.ActionForward;

public class Sp_bak_delete_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Sp_back_delete_service shopbackservice = new Sp_back_delete_service();
		String code = request.getParameter("code");
		String [] del_list = code.split("/");
		String b_id = request.getParameter("ID");
		boolean isWriteSuccess = shopbackservice.sp_back_in_Article(del_list, b_id);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (isWriteSuccess) {
			out.println("true");
		} else {
			out.println("false");
		}

		return forward;

	}

}