package com.sist.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.LibraryDAO;
import com.sist.vo.bookInfoVO;

public class SearchMainModel {
	@RequestMapping("search/searchDetail.do")
	public String SearchResultDetail(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String search = request.getParameter("search");
		String type = request.getParameter("type-data");
		if(type.equals("post")) {
			String page = request.getParameter("page");
			
			if(page==null) page ="1";
			int curpage = Integer.parseInt(page);
			LibraryDAO dao = LibraryDAO.newInstance();
			
			ArrayList<bookInfoVO> list = dao.SearchBookData(search, curpage);
			int total = dao.SearchBookTotal(search);
			
			int totalpage = (int)Math.ceil((total/12.0));
			
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			if(endPage>totalpage)
				endPage=totalpage;
			
			request.setAttribute("list", list);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("type", "소장자료");
			request.setAttribute("type1", type);
			request.setAttribute("search", search);
			request.setAttribute("main_jsp", "../SearchResultDetail/result.jsp");
		}
		else {
			
		}
		
		return "/main/main.jsp";
	}
}
