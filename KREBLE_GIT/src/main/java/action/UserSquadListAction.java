package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserSquadListService;
import vo.ActionForward;
import vo.SquadInfo;

public class UserSquadListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ArrayList<SquadInfo> squadList = null;
		SquadInfo selectSquad = new SquadInfo();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("ID");
		int squad_no = 0;
		if (request.getParameter("no") != null && request.getParameter("no") != ""
				&& request.getParameter("no") != "null") {
			squad_no = Integer.parseInt(request.getParameter("no"));
		}
		UserSquadListService userSquadListService = new UserSquadListService();
		if (user_id != null) {
			squadList = userSquadListService.getArticleList(user_id);
			request.setAttribute("squadList", squadList);
		}
		if (squad_no != 0) {
			userSquadListService.updateViewCount(squad_no);
			selectSquad = userSquadListService.getArticle(squad_no);
			request.setAttribute("squad", selectSquad);
		}
		ActionForward forward = new ActionForward();
		forward.setPath("/mysquad.jsp");
		return forward;

	}

}