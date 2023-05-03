package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ClupPageService;
import vo.ActionForward;

public class ClupPageAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("ID");
		int clup_no =Integer.parseInt( request.getParameter("clup_no"));
		if(login_id==null) {
			forward.setPath("/login.jsp");
		}
		else {
			ClupPageService cps = new ClupPageService();
			int ismember = cps.ismember(clup_no, login_id);
			if(ismember==1) {
				forward.setPath("/clup_detail.jsp");
			}
			else {
				forward.setPath("/clupJoin.cl?clup_no="+clup_no);
			}
		}
		
		return forward;
	}
}
