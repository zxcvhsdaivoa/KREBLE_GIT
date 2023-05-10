package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ClupChatService;
import svc.ClupMemberListService;
import svc.ClupNoticeService;
import svc.ClupPageService;
import svc.ClupSelectService;
import svc.ClupUpdateLastdayService;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupRoomMainAction implements Action {
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
				ClupUpdateLastdayService cls = new ClupUpdateLastdayService();
				cls.updateLastday(clup_no, login_id);

				ClupSelectService css= new ClupSelectService();
				ClupInfo ci = css.selectClup(clup_no);
				request.setAttribute("clup", ci);
				
				forward.setPath("/clup_room_main.jsp");
			}
			else {
				forward.setPath("/clupJoin.cl?clup_no="+clup_no);
			}
		}
		return forward;
	}
}
