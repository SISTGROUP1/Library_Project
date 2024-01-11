package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.AllReplyDAO;
import com.sist.vo.AllReplyVO;

public class AllReplyModel {
	private String[] returns= {
			"",
			"Board/qna_detail.do"
	};
	@RequestMapping("reply/insert.do")
	public String replyInsert(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String typeno=request.getParameter("typeno");
		String cno=request.getParameter("cno");
		String r_content=request.getParameter("r_content");
		HttpSession session=request.getSession();
		String userid=(String) session.getAttribute("email");
		
		AllReplyVO vo=new AllReplyVO();
		vo.setTypeno(Integer.parseInt(typeno));
		vo.setCno(Integer.parseInt(cno));
		vo.setR_content(r_content);
		vo.setUserid(userid);
		
		AllReplyDAO dao=AllReplyDAO.newInstance();
		dao.replyInsert(vo);
		return "redirect:../"+returns[Integer.parseInt(typeno)]+"?no="+cno;
	}
	@RequestMapping("reply/delete.do")
	public String replyDelete(HttpServletRequest request,HttpServletResponse response) {
		String rno=request.getParameter("rno");
		String typeno=request.getParameter("typeno");
		String cno=request.getParameter("cno");
		
		AllReplyDAO dao=AllReplyDAO.newInstance();
		dao.replyDelete(Integer.parseInt(rno));
		
		return "redirect:../"+returns[Integer.parseInt(typeno)]+"?no="+cno;
	}
	@RequestMapping("reply/update.do")
	public String replyUpdate(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String rno=request.getParameter("rno");
		String typeno=request.getParameter("typeno");
		String cno=request.getParameter("cno");
		String r_content=request.getParameter("r_content");
		
		AllReplyVO vo=new AllReplyVO();
		vo.setRno(Integer.parseInt(rno));
		vo.setR_content(r_content);
		
		AllReplyDAO dao=AllReplyDAO.newInstance();
		dao.replyUpdate(vo);
		
		return "redirect:../"+returns[Integer.parseInt(typeno)]+"?no="+cno;
	}
}
