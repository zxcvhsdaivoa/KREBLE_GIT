package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;

import svc.ClupChatService;
import svc.ClupIsMemberService;
import svc.ClupLastdateService;
import svc.ClupSelectService;
import use_data.Db_method_ECT;
import vo.ClupInfo;

public class ClupRoomChatAction  implements CommandInter{

	static ClupRoomChatAction impl = new ClupRoomChatAction();
	public static ClupRoomChatAction instance() {
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
		
		ClupIsMemberService cps = new ClupIsMemberService();
		cps.ismember(member);
		if(cps.ismember(member)!=null) {
			ClupLastdateService cls = ClupLastdateService.instance();
			cls.lastdate(member);
			ClupChatService ccs = new ClupChatService();
			ClupSelectService css= new ClupSelectService();
			ClupInfo ci = css.selectClup(clup_no);
			request.setAttribute("clup", ci);
			
			request.setAttribute("clup_chat",(ArrayList<ClupInfo>)ccs.selectChat(clup_no));
			turn="clup_room_chat.jsp";
		
		}
		else {
			turn="clup.do?command=clupjoin&clup_no="+clup_no;
		}
		return turn;
	}
}
