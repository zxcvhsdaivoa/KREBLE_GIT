package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;

import svc.ClupListService;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupListAction implements CommandInter{

	static ClupListAction impl = new ClupListAction();
	public static ClupListAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ClupListService cls =ClupListService.instance();
		ArrayList<ClupInfo> cll= (ArrayList<ClupInfo>)cls.selectClupList();
		request.setAttribute("ClupList", cll);
		return "clup_main.jsp";
	}
}
