package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
//import com.sist.dao.ProgramDAO;
import com.sist.vo.ProgramVO;

public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request,HttpServletResponse response) {
//		ProgramDAO dao=ProgramDAO.newInstance();
//		List<ProgramVO> programList=dao.programSlideData();
//		request.setAttribute("programList", programList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
