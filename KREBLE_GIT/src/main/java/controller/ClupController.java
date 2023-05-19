package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ClupJoinAction;
import action.ClupJoiningAction;
import action.ClupListAction;
import action.ClupMakeAction;
import action.ClupMakingAction;
import action.ClupRoomChatAction;
import action.ClupRoomMainAction;
import action.ClupRoomManageAction;
import action.ClupRoomMemberAction;
import action.ClupRoomNoticeAction;

@SuppressWarnings("serial")
public class ClupController extends HttpServlet{

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		CommandInter inter = null;
		String viewName = "";
		
		try {
			if(command.equals("main")){
				inter = ClupListAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("room")){
				inter = ClupRoomMainAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("roomchat")){
				inter = ClupRoomChatAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("roommember")){
				inter = ClupRoomMemberAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("roommanage")){
				inter = ClupRoomManageAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("roomnotice")){
				inter = ClupRoomNoticeAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("clupmake")){
				inter = ClupMakeAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("clupmakepro")){
				inter = ClupMakingAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("clupjoin")){
				inter = ClupJoinAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("clupjoinpro")){
				inter = ClupJoiningAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
		} catch (Exception e) {

		}
	}
}
