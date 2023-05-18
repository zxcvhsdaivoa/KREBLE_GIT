package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;

import svc.ClupMemberListService;
import svc.ClupIsMemberService;
import svc.ClupLastdateService;
import svc.ClupSelectService;
import use_data.Db_method_ECT;
import vo.ClupInfo;

public class ClupRoomMemberAction  implements CommandInter{

	static ClupRoomNoticeAction impl = new ClupRoomNoticeAction();
	public static ClupRoomNoticeAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String turn=null;
	
		String login_id = Db_method_ECT.login_check(request);
		int clup_no =Integer.parseInt( request.getParameter("clup_no"));
		
		Db_method_ECT.not_login(login_id, response);
		
		ClupInfo member = new ClupInfo();
		member.setClup_no(clup_no);
		member.setUser_id(login_id);
		ClupIsMemberService cps = ClupIsMemberService.instance();
		String mem = cps.ismember(member);
		if(mem!=null) {
			ClupLastdateService cls = ClupLastdateService.instance();
			cls.lastdate(member);

			ClupMemberListService cmls = ClupMemberListService.instance();
			ClupSelectService css= ClupSelectService.instance();
			ClupInfo ci = css.selectClup(clup_no);
			request.setAttribute("clup", ci);
			
			request.setAttribute("clup_member",(ArrayList<ClupInfo>)cmls.selectMemberList(clup_no));
			turn="clup_room_member.jsp";
		
		}
		else {
			turn="clup.do?command=clupjoin&clup_no="+clup_no;
		}
		
		return turn;
	}
}
