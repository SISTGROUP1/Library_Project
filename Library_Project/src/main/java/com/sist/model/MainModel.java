package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.ProgramDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.ProgramVO;

public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request,HttpServletResponse response) {
		// 슬라이드바 프로그램 목록 리스트
		ProgramDAO dao=ProgramDAO.newInstance();
		List<ProgramVO> programList=dao.programSlideData();
		// 메인화면 Board 요약 출력 리스트
		BoardDAO bdao=BoardDAO.newInstance();
		List<BoardVO> boardList=bdao.boardMainData();
		request.setAttribute("programList", programList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
