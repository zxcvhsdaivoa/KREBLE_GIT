package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.tree.ExpandVetoException;

import action.Action;
import action.Prd_mody_form_action;
import action.Shop_Prd_delete_action;
import action.Shop_Prd_like_ck;
import action.Shop_back_qa_updat_action;
import action.Shop_buy_action;
import action.Shop_calist_action;
import action.Shop_detail_action;
import action.Shop_list_action;
import action.Shop_prd_insert_action;
import action.Shop_prd_mody_action;
import action.Shop_re_delete_action;
import action.Sp_bak_clear_action;
import action.Sp_bak_delete_action;
import action.Sp_bak_form_action;
import action.Sp_bak_insert_action;
import action.Sp_re_insert_action;
import action.User_my_page_action;
import svc.Prd_re_delete_service;
import vo.ActionForward;

@SuppressWarnings("serial")
@WebServlet("*.kb")
public class kreble_controller extends javax.servlet.http.HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		// 마이페이지
		if (command.equals("/mypage.kb")) {
			action = new User_my_page_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 상품상세
		if (command.equals("/asdfasdf.kb")) {
			action = new Shop_detail_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 크래블샵
		else if (command.equals("/asdfasdf.kb")) {
			forward = new ActionForward();
			forward.setPath("/krebleshop.jsp");
		}

		if (forward != null) {

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}