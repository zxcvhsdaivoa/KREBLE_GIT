package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandInter;
import use_data.Db_method_ECT;
import vo.ActionForward;

public class ClupMakeAction implements CommandInter{

	static ClupMakeAction impl = new ClupMakeAction();
	public static ClupMakeAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String id = Db_method_ECT.login_check(request);
		
		Db_method_ECT.not_login(id,response);
			
		return "/clup_make.jsp";
	}
}
