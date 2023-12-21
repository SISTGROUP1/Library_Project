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
	// 리스트 출력
	@RequestMapping("program/programList.do")
	public String program_list(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		//------------- 검색 -------------
		String target=request.getParameter("target");
		if(target==null) target="0";
		String searchType=request.getParameter("searchType");
		if(searchType==null) searchType="title";
		String search=request.getParameter("search");
		if(search==null) search="";
		//-------------------------------
		//------------- 목록 -------------
		ProgramDAO dao=ProgramDAO.newInstance();
		List<ProgramVO> list=dao.programListData(curpage,Integer.parseInt(target),searchType,search);
		int totalpage=dao.programListTotalPage(Integer.parseInt(target),searchType,search);
		final int BLOCK=10;
		int startBlockNum=((curpage-1)/BLOCK*BLOCK)+1;
		int endBlockNum=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage<endBlockNum) endBlockNum=totalpage;
		int find_cnt=dao.programFindCnt(Integer.parseInt(target),searchType,search);
		//--------------------------------
		//------------- 쿠키 -------------
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
		//--------------------------------
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startBlockNum", startBlockNum);
		request.setAttribute("endBlockNum", endBlockNum);
		request.setAttribute("cList", cList);
		request.setAttribute("cList_size", cList.size());
		request.setAttribute("find_cnt", find_cnt);
		request.setAttribute("target", target);
		request.setAttribute("searchType", searchType);
		request.setAttribute("search", search);
		request.setAttribute("program_jsp", "../program/programList.jsp");
		request.setAttribute("main_jsp", "../program/program_main.jsp");
		return "../main/main.jsp";
	}
	// 상세보기
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
	// 쿠키 추가후 detail로 이동
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
