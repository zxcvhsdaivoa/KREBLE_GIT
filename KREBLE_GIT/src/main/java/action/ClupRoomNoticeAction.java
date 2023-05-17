package action;

import java.util.ArrayList;

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

public class ClupRoomNoticeAction  implements CommandInter{

	static ClupRoomNoticeAction impl = new ClupRoomNoticeAction();
	public static ClupRoomNoticeAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String turn=null;
		String id =Db_method_ECT.login_check(request);
		int clup_no =Integer.parseInt( request.getParameter("clup_no"));
		
		ClupIsMemberService cps = ClupIsMemberService.instance();
		ClupInfo cl = new ClupInfo();
		cl.setClup_no(clup_no);
		cl.setUser_id(id);
		
		if(cps.ismember(cl)!=null) {
			//ClupUpdateLastdayService cls = ClupUpdateLastdayService.instance();
			//cls.updateLastday(clup_no, login_id);

			ClupSelectService css=ClupSelectService.instance();
			ClupInfo ci = css.selectClup(clup_no);
			request.setAttribute("clup", ci);
			
			ClupNoticeService cns = ClupNoticeService.instance();
			request.setAttribute("clup_notice",(ArrayList<ClupInfo>)cns.selectNotice(clup_no));
			turn="clup_room_notice.jsp";
		}
		else {
			turn="clup.do?command=clupjoin&clup_no="+clup_no;
		}
		
		return turn;
	}
}
