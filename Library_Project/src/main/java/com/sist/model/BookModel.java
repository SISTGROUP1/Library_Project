package com.sist.model;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
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
		
		ArrayList<MiddlectVO> sub = dao.SearchSubmenuData();
		
		request.setAttribute("list", list);
		
		request.setAttribute("sub", sub);
		
		request.setAttribute("main_jsp", "/searchBook/alq.jsp");
		
		return "/main/main.jsp";
	}
	
	@RequestMapping("searchBook/alqResult.do")
	public String Search_alqResult(HttpServletRequest request,HttpServletResponse response) {
		
		String cno = request.getParameter("cno");
		String mno = request.getParameter("mno");
		String page = request.getParameter("page");
		String cate = request.getParameter("cate");
		if(page==null) page = "1";
		int curpage = Integer.parseInt(page);
		
		LibraryDAO dao = LibraryDAO.newInstance();
		ArrayList<bookInfoVO> list = dao.BookInfoData(Integer.parseInt(cno),mno,curpage);
		int totalpage = dao.BookInfoTotal(Integer.parseInt(cno));
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		Cookie[] cookies = request.getCookies();
		ArrayList<bookInfoVO> cList_1 = new ArrayList<bookInfoVO>();
		int cLength = 0;
		if(cookies.length>10) cLength = cookies.length-10;
		for(int i = cookies.length-1;i>cLength;i--) {
			if(cookies[i].getName().startsWith("book_")) {
				bookInfoVO vo = new bookInfoVO();
				String data = cookies[i].getValue();
				String title = dao.SearchCookieData(data);
				vo.setIsbn(data);
				vo.setBooktitle(title);
				
				cList_1.add(vo);
				
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("cList_1", cList_1);
		request.setAttribute("cno", cno);
		try {
			request.setAttribute("cate", URLEncoder.encode(cate, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	@RequestMapping("searchBook/alqDetail.do")
	public String Search_Deatail(HttpServletRequest request, HttpServletResponse response) {
		String isbn = request.getParameter("isbn");
		
		LibraryDAO dao = LibraryDAO.newInstance();
		bookInfoVO vo = dao.BookDetailSearch(isbn);
		
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "/searchBook/alqDetail.jsp");
		
		return "/main/main.jsp";
	}
	@RequestMapping("searchBook/alqDetail_before.do")
	public String Search_Detail_before(HttpServletRequest request, HttpServletResponse response) {
		String isbn = request.getParameter("isbn");
		
		Cookie cookies = new Cookie("book_"+isbn, isbn);
		cookies.setPath("/");
		cookies.setMaxAge(60*60*24);
		
		response.addCookie(cookies);
		
		return "redirect:../searchBook/alqDetail.do?isbn="+isbn;
	}
	
	@RequestMapping("searchBook/alqDetail_remove.do")
	public String Search_Detail_remove(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String cno = request.getParameter("cno");
		String page = request.getParameter("page");
		String cate = request.getParameter("cate");
		String isbn = request.getParameter("isbn");
		
		System.out.println(cno);
		System.out.println(cate);
		Cookie[] cookies = request.getCookies();
		for(int i = cookies.length-1;i>0;i--) {
			if(cookies[i].getName().equals("book_"+isbn)) {
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				
				response.addCookie(cookies[i]);
				
				break;
			}
		}
		
		
		return "redirect:../searchBook/alqResult.do?cno="+cno+"&cate="+cate+"&page="+page;
	}
}
