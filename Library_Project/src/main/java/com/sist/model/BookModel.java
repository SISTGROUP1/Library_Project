package com.sist.model;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.vo.*;
import com.sist.dao.*;
import com.sist.controller.*;
public class BookModel {
	@RequestMapping("searchBook/alq.do")
	public String Search_alq(HttpServletRequest request,HttpServletResponse response) {
		
		LibraryDAO dao = LibraryDAO.newInstance();
		
		ArrayList<MajorctVO> list = dao.Major_Classification();
		
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "/searchBook/alq.jsp");
		
		return "/main/main.jsp";
	}
	
	@RequestMapping("searchBook/alqResult.do")
	public String Search_alqResult(HttpServletRequest request,HttpServletResponse response) {
		
		String cno = request.getParameter("cno");
		String page = request.getParameter("page");
		String cate = request.getParameter("cate");
		if(page==null) page = "1";
		int curpage = Integer.parseInt(page);
		
		LibraryDAO dao = LibraryDAO.newInstance();
		ArrayList<bookInfoVO> list = dao.BookInfoData(Integer.parseInt(cno),curpage);
		int totalpage = dao.BookInfoTotal(Integer.parseInt(cno));
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("cno", cno);
		request.setAttribute("cate", cate);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp", "/searchBook/alqResult.jsp");
		
		return "/main/main.jsp";
	}
	
	@RequestMapping("searchBook/favorLoan.do")
	public String Search_favorLoan(HttpServletRequest request,HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "/searchBook/favorLoan.jsp");
		
		return "/main/main.jsp";
	}
	
	@RequestMapping("searchBook/newarrival.do")
	public String Search_newarrival(HttpServletRequest request,HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "/searchBook/newarrival.jsp");
		
		return "/main/main.jsp";
	}
}
