package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;;

public class UserModel {
	
	
	@RequestMapping("user/login.do")
	public String user_login(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("login_jsp", "../user/login.jsp");
		request.setAttribute("main_jsp", "../user/user_main.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("user/idPwd.do")
	public String user_id_pwd(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("idPwd_jsp", "../user/idPwd.jsp");
		request.setAttribute("main_jsp", "../user/user_main.jsp");
		return "../main/main.jsp";
	}
}
