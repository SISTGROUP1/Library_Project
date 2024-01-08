package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MyPageDAO;
import com.sist.vo.AllLikeVO;
import com.sist.vo.BookDeliverVO;
import com.sist.vo.UserVO;

public class MypageModel {
	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("email");
		MyPageDAO dao=MyPageDAO.newInstance();
		UserVO vo=dao.userBasicInfo(id);
		int likeBookCnt=dao.likeBookTotalCount(id);
		request.setAttribute("vo", vo);
		request.setAttribute("likeBookCnt", likeBookCnt);
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
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("email");
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		//------------------------------------- 검색
		String search=request.getParameter("search");
		System.out.println(search);
		String searchType=request.getParameter("searchType");
		if(searchType==null) searchType="0";
		//-------------------------------------
		MyPageDAO dao=MyPageDAO.newInstance();
		List<AllLikeVO> list=null;
		int count=0;
		if(search==null) {
			list=dao.likeBookList(curpage,id);
			count=dao.likeBookTotalCount(id);
		}else {
			list=dao.likeBookList(curpage,id,search,Integer.parseInt(searchType));
			count=dao.likeBookTotalCount(id,search,Integer.parseInt(searchType));
		}
		int list_size=list.size();
		int totalpage=(int)(Math.ceil(count/(double)dao.getROW()));
		count=count-((curpage*dao.getROW())-dao.getROW());
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) endPage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("list_size", list_size);
		request.setAttribute("curpage", curpage);
		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("search", search);
		request.setAttribute("searchType", searchType);
		request.setAttribute("app_select_jsp", "../mypage/likeBookInq.jsp");
		request.setAttribute("mypage_jsp", "../mypage/myApp_main.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/likeBookDelete.do")
	public String mypage_likeBook_delete(HttpServletRequest request,HttpServletResponse response) {
		String ino=request.getParameter("ino");
		MyPageDAO dao=MyPageDAO.newInstance();
		dao.likeBookDelete(Integer.parseInt(ino));
		return "redirect:../mypage/likeBookInq.do";
	}
	
	// 도서결제내역
		@RequestMapping("mypage/bookPurchaseList.do")
		public String mypage_bookPurchaseList(HttpServletRequest request, HttpServletResponse response)
		{
			String page=request.getParameter("page");
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			
			MyPageDAO dao=MyPageDAO.newInstance();
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("email"); // 무슨의미일까
			List<BookDeliverVO> list=dao.userPurchaseList(curpage, userid);
			int totalpage=dao.userPurchaseTotalpage();
			
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("list", list);
			
			request.setAttribute("mypage_jsp", "../mypage/bookPurchaseList.jsp");
			request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
			return "../main/main.jsp";
		}
	
		// 도서결제내역 디테일
		@RequestMapping("mypage/bookPurchaseDetail.do")
		public String mypage_bookPurchaseDetail(HttpServletRequest request, HttpServletResponse response)
		{
			MyPageDAO dao=MyPageDAO.newInstance();
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("email");
			String orderNum=request.getParameter("orderNum");
			
			BookDeliverVO vo=dao.bookBuyDetail(Integer.parseInt(orderNum), userid);
			request.setAttribute("vo", vo);
		
			request.setAttribute("mypage_bookPurchaseList_jsp", "../mypage/bookPurchaseDetail.jsp");
			request.setAttribute("mypage_jsp", "../mypage/bookPurchaseList.jsp");
			request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
			return "../main/main.jsp";
		}
}
