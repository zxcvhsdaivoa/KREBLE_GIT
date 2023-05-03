package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClupSelectService;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupJoinAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int clup_no =Integer.parseInt( request.getParameter("clup_no"));
		ClupSelectService css= new ClupSelectService();
		ClupInfo cl = css.selectClup(clup_no);
		request.setAttribute("clup", cl);
		ActionForward forward = new ActionForward();
		forward.setPath("/clup_join.jsp");
		return forward;
	}
}
