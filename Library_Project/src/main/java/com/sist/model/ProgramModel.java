package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProgramDAO;
import com.sist.vo.ProgramVO;

public class ProgramModel {
	@RequestMapping("program/programList.do")
	public String program_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		ProgramDAO dao=ProgramDAO.newInstance();
		List<ProgramVO> list=dao.programListData(curpage);
		int totalpage=dao.programListTotalPage();
		final int BLOCK=10;
		int startBlockNum=((curpage-1)/BLOCK*BLOCK)+1;
		int endBlockNum=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage<endBlockNum) endBlockNum=totalpage;
		
		Cookie[] cookies=request.getCookies();
		List<ProgramVO> cList=new ArrayList<ProgramVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("program_")) {
					String pno=cookies[i].getValue();
					ProgramVO vo=dao.programCookieData(Integer.parseInt(pno));
					cList.add(vo);
				}
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startBlockNum", startBlockNum);
		request.setAttribute("endBlockNum", endBlockNum);
		request.setAttribute("cList", cList);
		request.setAttribute("cList_size", cList.size());
		request.setAttribute("program_jsp", "../program/programList.jsp");
		request.setAttribute("main_jsp", "../program/program_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("program/programDetail.do")
	public String program_detail(HttpServletRequest request,HttpServletResponse response) {
		String pno=request.getParameter("pno");
		ProgramDAO dao=ProgramDAO.newInstance();
		ProgramVO vo=dao.programDetailData(Integer.parseInt(pno));
		request.setAttribute("vo", vo);
		request.setAttribute("program_jsp", "../program/programDetail.jsp");
		request.setAttribute("main_jsp", "../program/program_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("program/programDetail_before.do")
	public String program_detail_before(HttpServletRequest request,HttpServletResponse response) {
		String pno=request.getParameter("pno");
		Cookie cookie=new Cookie("program_"+pno, pno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:../program/programDetail.do?pno="+pno;
	}
}
