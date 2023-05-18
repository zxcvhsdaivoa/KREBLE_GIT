package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;

import svc.ClupNoticeService;
import svc.ClupIsMemberService;
import svc.ClupLastdateService;
import svc.ClupSelectService;
import use_data.Db_method_ECT;
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
			ClupLastdateService cls = ClupLastdateService.instance();
			cls.lastdate(cl);

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
