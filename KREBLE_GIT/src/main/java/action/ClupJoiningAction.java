package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ClupJoinRequeService;
import svc.ClupJoinService;
import svc.ClupMakingService;
import svc.ClupPWckService;
import vo.ActionForward;
import vo.ClupInfo;

public class ClupJoiningAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		boolean isSuccess =false;
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("ID");
		String howjoin=(String) request.getParameter("how");
		int clup_no = Integer.parseInt(request.getParameter("no"));
		ActionForward forward=null;
		
		ClupJoinService cjs = new ClupJoinService();
		
		if(howjoin.equals("free")) {
			isSuccess=cjs.join(user_id, clup_no);
		}
		else if(howjoin.equals("password")) {
			String pw = request.getParameter("pw");
			ClupPWckService cps = new ClupPWckService();
			if(cps.pwcheck(clup_no, pw)) {
				isSuccess=cjs.join(user_id, clup_no);
			}
		}
		else if(howjoin.equals("request")) {
			String jointext= request.getParameter("join_text");
			ClupJoinRequeService cjrs = new ClupJoinRequeService();
			isSuccess=cjrs.joinReque(user_id,clup_no,jointext);
		}
		
		if(!isSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('클럽에 가입하는데 실패했습니다')");
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
