package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClupListService;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<ClupInfo> cll = null;
		ClupListService cls = new ClupListService();
		cll= cls.selectClupList();
		request.setAttribute("ClupList", cll);
		ActionForward forward = new ActionForward();
		forward.setPath("/clup_main.jsp");
		return forward;
	}
}
