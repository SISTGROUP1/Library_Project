package com.sist.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.SeatReserveDAO;
import com.sist.vo.SeatVO;

public class SeatReserveModel {
	@RequestMapping("seatReserve/main.do")
	public String SeatReservation(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("email");
		
		SeatReserveDAO dao = SeatReserveDAO.newInstance();
		int userbtn_change = dao.userbtn_Change(id);
		int totalSeatY = dao.SeatTotalCount();
		
		request.setAttribute("totalY", totalSeatY);
		request.setAttribute("userbtn_change", userbtn_change);
		request.setAttribute("main_jsp", "/seatReserve/seatMain.jsp");
		return "/main/main.jsp";
	}
	
	@RequestMapping("seatReserve/seatCheck.do")
	public void SeatCheck(HttpServletRequest request, HttpServletResponse response) {
		
		String snum = request.getParameter("snum");//좌석번호
		
		SeatReserveDAO dao = SeatReserveDAO.newInstance();
		String res = dao.seatCheck_db(Integer.parseInt(snum));
		
		try {
			PrintWriter out = response.getWriter();
			out.write(res);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping("seatReserve/seatOK.do")
	public void seatOk(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String snum = request.getParameter("snum");
		
		SeatReserveDAO dao = SeatReserveDAO.newInstance();
		String res = dao.seatRes_OK(Integer.parseInt(snum), id);
		
		try {
			PrintWriter out = response.getWriter();
			out.write(res);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping("seatReserve/userResCheck.do")
	public void userResCheck(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		SeatReserveDAO dao = SeatReserveDAO.newInstance();
		int res = dao.userSeatRes(id);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(res));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping("seatReserve/seatCancel.do")
	public void userResCancel(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String snum = request.getParameter("snum");
		
		SeatReserveDAO dao = SeatReserveDAO.newInstance();
		dao.userSeatCancel(id, Integer.parseInt(snum));
	}
	@RequestMapping("seatReserve/SeatChange.do")
	public void seatColorChange(HttpServletRequest request, HttpServletResponse response) {
		SeatReserveDAO dao = SeatReserveDAO.newInstance();
		ArrayList<SeatVO> list = dao.seatAllYData();
		
		JSONArray arr = new JSONArray();
		for(int i = 0;i<list.size();i++) {
			JSONObject obj = new JSONObject();
			obj.put("sno", list.get(i).getSno());
			obj.put("reserve", list.get(i).getReserve());
			
			arr.add(obj);
		}
		
		try {
			PrintWriter out = response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
