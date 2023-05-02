package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class ClupMakeAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		

		ActionForward forward = new ActionForward();
		forward.setPath("/clup_make.jsp");
		return forward;
	}
}
