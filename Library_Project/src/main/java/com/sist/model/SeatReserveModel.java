package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class SeatReserveModel {
	@RequestMapping("seatReserve/main.do")
	public String SeatReservation(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "/seatReserve/seatMain.jsp");
		return "/main/main.jsp";
	}
}
