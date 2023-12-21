package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BookStoreDAO;
import com.sist.vo.BookStoreVO;

public class BookStoreModel {
	@RequestMapping("bookStore/bookPurchase.do")
	public String bookStore_bookPurchase(HttpServletRequest request, HttpServletResponse response)
	{
		String isbn=request.getParameter("isbn");
		BookStoreDAO dao=BookStoreDAO.newInstance();
		BookStoreVO vo=dao.bookStoreAllDetailData(isbn);
		
		request.setAttribute("vo", vo);
		
		/*BookStoreDAO dao=BookStoreDAO.newInstance();
		BookStoreVO vo=dao.bookStoreAllDetailData(Integer.parseInt(isbn));
		String price=vo.getSaleprice();
		// 30,000원 => 30000으로 바꿔줘야 한다.
		price=price.replaceAll("[^0-9]", ""); // [^0-9] : 숫자를 제외(^)하고 다 공백으로 바꿔라.
		vo.setPrice(price);
		request.setAttribute("vo", vo);*/
		
		
		request.setAttribute("main_jsp", "../bookStore/bookPurchase.jsp");
		return "../main/main.jsp";
	}
	
	
}
