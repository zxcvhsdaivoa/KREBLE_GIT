package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.SquadDeleteProService;
import vo.ActionForward;

public class SquadDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{	 

		ActionForward forward = null;
		HttpSession session=request.getSession();
		String user_id = (String) session.getAttribute("ID");
		int squad_no=Integer.parseInt(request.getParameter("squad_no"));
		SquadDeleteProService squadDeleteProService = new SquadDeleteProService();

		boolean isDeleteSuccess = squadDeleteProService.removeArticle(squad_no,user_id);
		System.out.println(isDeleteSuccess);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(!isDeleteSuccess){
			out.println("fail");
		}
		else{
			out.println("success");
		}
			
		return forward;
	}

}