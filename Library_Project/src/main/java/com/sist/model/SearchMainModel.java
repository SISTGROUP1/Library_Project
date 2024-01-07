package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

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
			request.setAttribute("type", "소장자료");
		}
		else {
			
		}
		
		request.setAttribute("main_jsp", "../SearchResultDetail/result.jsp");
		return "/main/main.jsp";
	}
}
