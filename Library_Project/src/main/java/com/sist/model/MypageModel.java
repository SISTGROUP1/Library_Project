package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

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
		request.setAttribute("app_select_jsp", "../mypage/likeBookInq.jsp");
		request.setAttribute("mypage_jsp", "../mypage/myApp_main.jsp");
		request.setAttribute("main_jsp", "../mypage/myPage_main.jsp");
		return "../main/main.jsp";
	}
}
