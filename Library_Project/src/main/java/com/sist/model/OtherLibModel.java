package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.*;
public class OtherLibModel {
	@RequestMapping("otherLib/obs.do")
	public String searchOtherLib(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "/otherLib/obs.jsp");
		
		return "/main/main.jsp";
	}

}
