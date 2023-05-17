package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import svc.ClupSelectService;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupJoinAction implements CommandInter{

	static ClupJoinAction impl = new ClupJoinAction();
	public static ClupJoinAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int clup_no =Integer.parseInt(request.getParameter("clup_no"));
		ClupSelectService css= ClupSelectService.instance();;
		ClupInfo cl = css.selectClup(clup_no);
		request.setAttribute("clup", cl);
		return "clup_join.jsp";
	}
}
