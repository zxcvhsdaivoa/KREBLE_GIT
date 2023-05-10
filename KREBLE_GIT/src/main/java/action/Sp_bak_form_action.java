package action;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Sp_back_form_service;
import use_data.Shop_prd;
import vo.ActionForward;
import vo.PageInfo;

public class Sp_bak_form_action implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String id = (String) request.getSession().getAttribute("ID");
		ArrayList<Shop_prd> articleList = new ArrayList<Shop_prd>();
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		Sp_back_form_service shopListService = new Sp_back_form_service();
		int listCount = shopListService.getListCount(id);
		articleList = shopListService.sp_back_form_Article(id, page, limit);
		int maxPage = (int) ((double) listCount / limit + 0.95);
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		forward.setPath("/shop_prd_bak.jsp");
		return forward;
	}

}