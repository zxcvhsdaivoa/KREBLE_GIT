package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.CommandInter;

import svc.ClupJoinRequeService;
import svc.ClupJoinService;
import svc.ClupMakingService;
import svc.ClupPWckService;
import svc.UserAlarmInsertService;
import use_data.Db_method_ECT;
import vo.ActionForward;
import vo.AlarmInfo;
import vo.ClupInfo;

public class ClupJoiningAction implements CommandInter{

	static ClupJoiningAction impl = new ClupJoiningAction();
	public static ClupJoiningAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = Db_method_ECT.login_check(request);
		String howjoin=(String) request.getParameter("how");

		AlarmInfo ai = new AlarmInfo();
		ai.setUser_id(id);
		ai.setAlarm_no(Integer.parseInt(request.getParameter("no")));
		UserAlarmInsertService uais = new UserAlarmInsertService();
		
		ClupJoinService cjs = ClupJoinService.instance();
		
		ClupInfo user = new ClupInfo();
		user.setClup_no(Integer.parseInt(request.getParameter("no")));
		user.setUser_id(id);
		if(howjoin.equals("free")) {
			cjs.join(user);
			boolean success = uais.insertAlarm(ai, "clup_join");
		}
		else if(howjoin.equals("password")) {
			String pw = request.getParameter("pw");
			user.setClup_pw(pw);
			ClupPWckService cps =ClupPWckService.instance();
			if(cps.pwcheck(user)>0) {
				cjs.join(user);
				boolean success = uais.insertAlarm(ai, "clup_join");
			}
		}
		else if(howjoin.equals("request")) {
			String jointext= request.getParameter("join_text");
			user.setClup_text(jointext);
			ClupJoinRequeService cjrs = ClupJoinRequeService.instance();
			cjrs.joinReque(user);
		}

		
		return "/clupErrorPrevention.jsp";
	}
}
