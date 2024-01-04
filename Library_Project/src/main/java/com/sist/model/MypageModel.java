package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MyPageDAO;
import com.sist.vo.AllLikeVO;

public class MypageModel {
	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("mypage_jsp", "../mypage/basicinfo.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/bookloaninfo_main.do")
	public String mypage_loaninfo_main(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("loaninfo_select_jsp", "../mypage/loanStatus.jsp");
		request.setAttribute("mypage_jsp", "../mypage/bookLoanInfo_main.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/reserveStatus.do")
	public String mypage_reserve_status(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("loaninfo_select_jsp", "../mypage/reserveStatus.jsp");
		request.setAttribute("mypage_jsp", "../mypage/bookLoanInfo_main.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/loanHistory.do")
	public String mypage_loan_history(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("loaninfo_select_jsp", "../mypage/loanHistory.jsp");
		request.setAttribute("mypage_jsp", "../mypage/bookLoanInfo_main.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
//	@RequestMapping("mypage/reserveHistory.do")
//	public String mypage_reserve_history(HttpServletRequest request,HttpServletResponse response) {
//		request.setAttribute("loaninfo_select_jsp", "../mypage/reserveHistory.jsp");
//		request.setAttribute("mypage_jsp", "../mypage/bookLoanInfo_main.jsp");
//		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
//		return "../main/main.jsp";
//	}
	@RequestMapping("mypage/myApp_main.do")
	public String mypage_myApp_main(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("app_select_jsp", "../mypage/proAppInq.jsp");
		request.setAttribute("mypage_jsp", "../mypage/myApp_main.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/likeBookInq.do")
	public String mypage_likeBook_Inq(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("email");
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		MyPageDAO dao=MyPageDAO.newInstance();
		List<AllLikeVO> list=dao.likeBookList(curpage,id);
		int count=dao.likeBookTotalCount(id);
		int totalpage=(int)(Math.ceil(count/(double)dao.getROW()));
		count=count-((curpage*dao.getROW())-dao.getROW());
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) endPage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("startPage", endPage);
		request.setAttribute("app_select_jsp", "../mypage/likeBookInq.jsp");
		request.setAttribute("mypage_jsp", "../mypage/myApp_main.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
}
