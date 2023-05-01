package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.UserSquadAllListService;
import vo.ActionForward;
import vo.SquadInfo;

public class UserSquadAllListAction implements Action {

	int limit = 15;
	String search = null, search_text = null;
	String[] order;

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserSquadAllListService userSquadAllListService = new UserSquadAllListService();
		ArrayList<SquadInfo> List = null;
		int page = 1;
		int count = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("order") != null && !request.getParameter("order").equals("")
				&& request.getParameter("order") != "") {
			order = request.getParameter("order").split(" ");
		} else {
			order = "notorder asc".split(" ");
		}
		if (request.getParameter("search_select") != null) {
			search = request.getParameter("search_select");
			if (search.equals("mysquad_name")) {
				search_text = request.getParameter("mysquad_name");
			} else if (search.equals("user_id")) {
				search_text = request.getParameter("user_id");
			} else if (search.equals("formation")) {
				search_text = request.getParameter("formation");
			}

			if (order[0].equals("notorder")) {
				List = userSquadAllListService.getSearchList(search, search_text, page, limit);
			} else {
				List = userSquadAllListService.getSearchOrderList(search, search_text, order, page, limit);
			}
			count = userSquadAllListService.getSearchListCount(search, search_text);
		} else {
			if (order[0].equals("notorder")) {
				List = userSquadAllListService.getList(page, limit);
			} else {
				List = userSquadAllListService.getOrderList(order, page, limit);
			}
			count = userSquadAllListService.getListCount();
		}
		request.setAttribute("List", List);
		request.setAttribute("count", count);
		ActionForward forward = new ActionForward();
		forward.setPath("/mysquad_list.jsp");
		return forward;

	}

}
