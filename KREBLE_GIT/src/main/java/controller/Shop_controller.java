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
import svc.Prd_re_delete_service;
import vo.ActionForward;

@SuppressWarnings("serial")
@WebServlet("*.sp")
public class Shop_controller extends javax.servlet.http.HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		// 상품상세
		if (command.equals("/shop_prd_detail.sp")) {
			action = new Shop_detail_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 크래블샵
		else if (command.equals("/kreble.sp")) {
			forward = new ActionForward();
			forward.setPath("/krebleshop.jsp");
		}
		// 상품수정
		else if (command.equals("/shop_prd_mod.sp")) {
			forward = new ActionForward();
			forward.setPath("/shop_prd_mod.jsp");
		}
		// 장바구니 페이지
		else if (command.equals("/shop_back_page.sp")) {
			action = new Sp_bak_form_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 장바구니 등록
		else if (command.equals("/shop_bak.sp")) {
			action = new Sp_bak_insert_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 장바구니 수량변경
		else if (command.equals("/bak_qant_updat.sp")) {
			action = new Shop_back_qa_updat_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 장바구니 단일삭제
		else if (command.equals("/shop_bak_one_delete.sp")) {
			action = new Sp_bak_delete_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 장바구니 전부 삭제
		else if (command.equals("/sb_back_clear.sp")) {
			action = new Sp_bak_clear_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 구매내역
		else if (command.equals("/shop_buy_list.sp")) {
			action = new Shop_buy_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 주문제작
		else if (command.equals("/shop_re_board.sp")) {
			forward = new ActionForward();
			forward.setPath("/shop_reform_board.jsp");
		}
		// 상품등록페이지
		else if (command.equals("/shop_prd_insert.sp")) {
			forward = new ActionForward();
			forward.setPath("/shop_prd_insert.jsp");
		}
		// 상품등록메소드
		else if (command.equals("/prd_insert.sp")) {
			action = new Shop_prd_insert_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 상품수정페이지
		else if (command.equals("/shop_mody_form.sp")) {
			action = new Prd_mody_form_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 상품수정등록
		else if (command.equals("/Shop_prd_mody_action.sp")) {
			action = new Shop_prd_mody_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 상품리스트
		else if (command.equals("/shop_list_action.sp")) {
			action = new Shop_list_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 카타 상품리스트
		else if (command.equals("/shop_calist_action.sp")) {
			action = new Shop_calist_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 상품삭제
		else if (command.equals("/Prd_delete_action.sp")) {
			action = new Shop_Prd_delete_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 관심상품토글
		else if (command.equals("/prd_like_ck.sp")) {
			action = new Shop_Prd_like_ck();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 상품리플등록메소드
		else if (command.equals("/prd_re_insert.sp")) {
			action = new Sp_re_insert_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 상품삭제등록메소드
		else if (command.equals("/shop_re_del.sp")) {
			action = new Shop_re_delete_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 여분
		else if (command.equals("/shop_prd_.sp")) {
			forward = new ActionForward();
			forward.setPath("/shop_prd_.jsp");
		}
		// 여분
		else if (command.equals("/shop_prd_.bo")) {
			action = new Shop_re_delete_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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