package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandInter;

import svc.ClupChatService;
import svc.ClupMemberListService;
import svc.ClupNoticeService;
import svc.ClupIsMemberService;
import svc.ClupSelectService;
import svc.ClupUpdateLastdayService;
import use_data.Db_method_ECT;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupRoomMainAction implements CommandInter{

	static ClupRoomMainAction impl = new ClupRoomMainAction();
	public static ClupRoomMainAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String turn=null;
		
		String id = Db_method_ECT.login_check(request);
		int clup_no =Integer.parseInt( request.getParameter("clup_no"));
		
		Db_method_ECT.not_login(id, response);
		ClupInfo member = new ClupInfo();
		member.setClup_no(clup_no);
		member.setUser_id(id);
		
		ClupIsMemberService cps = ClupIsMemberService.instance();
		String mem = cps.ismember(member);
		if(mem!=null) {
			//ClupUpdateLastdayService cls = new ClupUpdateLastdayService();
			//cls.updateLastday(clup_no, id);

			ClupSelectService css= ClupSelectService.instance();
			ClupInfo ci = css.selectClup(clup_no);
			request.setAttribute("clup", ci);
			
			turn="clup_room_main.jsp";
		}
		else {
			turn="clup.do?command=clupjoin&clup_no="+clup_no;
		}
		return turn;
	}
}
