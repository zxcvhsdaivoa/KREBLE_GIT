package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ClupPageService;
import vo.ActionForward;

public class ClupPageAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("ID");
		int clup_no =Integer.parseInt( request.getParameter("clup_no"));
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(login_id==null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요')");
			out.println("</script>");
			forward.setPath("/login.jsp");
		}
		else {
			ClupPageService cps = new ClupPageService();
			int ismember = cps.ismember(clup_no, login_id);
			System.out.println(ismember);
			if(ismember==1) {
				forward.setPath("/clup_detail.jsp");
			}
			else {
				out.println("<script>");
				out.println("alert('클럽에 가입되어야만 들어갈 수 있습니다')");
				out.println("</script>");
				forward.setPath("/clupJoin.cl?clup_no="+clup_no);
			}
		}
		
		return forward;
	}
}
