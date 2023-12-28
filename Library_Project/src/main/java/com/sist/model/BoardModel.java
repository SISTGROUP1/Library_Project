package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class BoardModel {
	@RequestMapping("Board/announcement.do")
	public String board_announcement(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("board_jsp", "../Board/announcement.jsp");
		request.setAttribute("main_jsp", "../Board/board_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("Board/news.do")
	public String board_news(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("board_jsp", "../Board/news.jsp");
		request.setAttribute("main_jsp", "../Board/board_main.jsp");
		return "../main/main.jsp";
	}
}
