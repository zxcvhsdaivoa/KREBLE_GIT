package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.SquadDiscloseProService;
import vo.ActionForward;
import vo.SquadInfo;

public class SquadDiscloseProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = null;
		boolean isDiscloseSuccess = false;
		HttpSession session=request.getSession();
		String user_id = (String) session.getAttribute("ID");
		int Squad_no=Integer.parseInt(request.getParameter("squad_no"));
	    String disclose = request.getParameter("disclose");
	    if(disclose.equals("no")) {
	    	disclose="yes";
	    }else if(disclose.equals("yes")) {
	    	disclose="no";
	    }
		SquadInfo article=new SquadInfo();
		SquadDiscloseProService SquadDiscloseProService = new SquadDiscloseProService();


		article.setUser_id(user_id); 
		article.setSquad_num(Squad_no);
		article.setDisclose(disclose);
		isDiscloseSuccess = SquadDiscloseProService.modifyArticle(article);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(!isDiscloseSuccess){
			out.println("fail");
		}
		else{
			out.println("success");
		}

		return forward;
	}

}