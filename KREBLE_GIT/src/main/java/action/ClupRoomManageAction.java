package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;

import svc.ClupMemberListService;
import svc.ClupLastdateService;
import svc.ClupManagerCheckService;
import svc.ClupSelectService;
import use_data.Db_method_ECT;
import vo.ClupInfo;

public class ClupRoomManageAction  implements CommandInter{

	static ClupRoomManageAction impl = new ClupRoomManageAction();
	public static ClupRoomManageAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String turn=null;
	
		
		String id =Db_method_ECT.login_check(request);
		int clup_no =Integer.parseInt( request.getParameter("clup_no"));

		Db_method_ECT.not_login(id, response);
			
		ClupManagerCheckService cps = ClupManagerCheckService.instance();
		ClupInfo member = new ClupInfo();
		member.setClup_no(clup_no);
		member.setUser_id(id);
		String menage =cps.isManager(member);
		if(menage!=null) {
			ClupLastdateService cls = ClupLastdateService.instance();
			cls.lastdate(member);

			ClupMemberListService cmls = ClupMemberListService.instance();
			//ClupChatService ccs =ClupChatService.instance();
			ClupSelectService css= ClupSelectService.instance();
			ClupInfo ci = css.selectClup(clup_no);
			request.setAttribute("clup", ci);
			
			//request.setAttribute("clup_chat",ccs.selectChat(clup_no));
			request.setAttribute("clup_member",(ArrayList<ClupInfo>)cmls.selectMemberList(clup_no));
			turn="clup_room_manage.jsp";
		}
		else {
			turn="clup.do?command=clupjoin&clup_no="+clup_no;
		}
	
		return turn;
	}
}
