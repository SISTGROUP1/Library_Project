package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.LibraryDAO;
import com.sist.dao.ProgramDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.bookInfoVO;

public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request,HttpServletResponse response) {
		// 슬라이드바 프로그램 목록 리스트
		ProgramDAO dao=ProgramDAO.newInstance();
		List<ProgramVO> programList=dao.programSlideData();
		// 슬라이드바 새로 들어온 책 목록 리스트
		LibraryDAO ldao = LibraryDAO.newInstance();
		ArrayList<bookInfoVO> newArrivalList = ldao.newArrivalBookData(1, 30);
		
		// 메인화면 Board 요약 출력 리스트
		BoardDAO bdao=BoardDAO.newInstance();
		List<BoardVO> boardList=bdao.boardMainData();
		
		request.setAttribute("programList", programList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("newArrival", newArrivalList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
