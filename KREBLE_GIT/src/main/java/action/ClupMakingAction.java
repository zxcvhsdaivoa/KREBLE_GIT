package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.CommandInter;

import svc.ClupMakingService;
import use_data.Db_method_ECT;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupMakingAction implements CommandInter{

	static ClupMakingAction impl = new ClupMakingAction();
	public static ClupMakingAction instance() {
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id =Db_method_ECT.login_check(request);
		
		String realFolder="";
		String saveFolder="/clupLogo";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		ClupInfo ci = new ClupInfo();
		ci.setClup_name(multi.getParameter("clup_name"));
		ci.setUser_id(id);
		ci.setClup_howjoin(multi.getParameter("clup_howjoin"));
		if(multi.getParameter("clup_howjoin").equals("password")) {
			ci.setClup_pw(multi.getParameter("clup_pw"));
		}
		ci.setClup_text(multi.getParameter("clup_include"));
		ci.setClup_logo(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		ci.setClup_disclose(multi.getParameter("disclose"));
		
		ClupMakingService cms = ClupMakingService.instance();
		cms.making(ci);
		return "clupErrorPrevention.jsp";
	}
}
