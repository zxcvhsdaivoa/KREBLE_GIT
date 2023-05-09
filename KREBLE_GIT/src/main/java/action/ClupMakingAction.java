package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ClupMakingService;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupMakingAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("ID");
		ActionForward forward=null;
		
		String realFolder="";
		String saveFolder="/clupLogo";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		ClupInfo ci = new ClupInfo();
		ci.setClup_name(multi.getParameter("clup_name"));
		ci.setClup_user(user_id);
		ci.setClup_howjoin(multi.getParameter("clup_howjoin"));
		if(multi.getParameter("clup_howjoin").equals("password")) {
			ci.setClup_pw(multi.getParameter("clup_pw"));
		}
		ci.setClup_text(multi.getParameter("clup_include"));
		ci.setClup_logo(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		ci.setClup_disclose(multi.getParameter("disclose"));
		
		ClupMakingService cms = new ClupMakingService();
		boolean isSuccess = cms.making(ci);
		if(!isSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('클럽을 생성하는데 실패했습니다')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setPath("/clupErrorPrevention.jsp");
		}
		return forward;
	}
}
