package com.sist.model;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.AdminDAO;
import com.sist.dao.ProgramDAO;
import com.sist.vo.BookReserve;
import com.sist.vo.ProgramVO;

public class AdminModel {
	@RequestMapping("admin/main.do")
	public String admin_main(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../adminpage/admin_info.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/programList.do")
	public String admin_programList(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		
		AdminDAO dao=AdminDAO.newInstance();
		ProgramDAO pdao=ProgramDAO.newInstance();
		pdao.programStatusUpdate(0);
		List<ProgramVO> list=dao.programListData(curpage);
		int list_size=list.size();
		int totalcount=dao.programTotalCnt();
		int count=totalcount;
		int totalpage=(int)(Math.ceil(count/dao.getROW_SIZE()));
		count=count-((curpage*dao.getROW_SIZE())-dao.getROW_SIZE());
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("list", list);
		request.setAttribute("list_size", list_size);
		request.setAttribute("totalcount", totalcount);
		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("admin_jsp", "../adminpage/admin_programList.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/programInsert.do")
	public String admin_programInsert(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../adminpage/admin_programInsert.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/programInsert_ok.do")
	public String admin_programInsert_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
//			String path=request.getServletContext().getRealPath("images");
//			System.out.println(request.getServletContext().getContextPath());
			String path="C:\\download";
			String enctype="UTF-8";
			int max_size=1024*1024*500;
//			MultipartRequest mr=new MultipartRequest(request, path, max_size, enctype,new DefaultFileRenamePolicy());
			MultipartRequest mr=new MultipartRequest(request, path, max_size, enctype);
			String title=mr.getParameter("title");
			
			String[] targets= {
				"영유아","어린이","청소년","성인","누구나"	
			};
			String[] target1s=mr.getParameterValues("target1");
			String target1="";
			for(int i=0;i<target1s.length;i++) {
				if(i==0) {
					target1+=targets[Integer.parseInt(target1s[i])];
				}else {
					target1+=","+targets[Integer.parseInt(target1s[i])];
				}
			}
			
			String target2=mr.getParameter("target2");
			String place=mr.getParameter("place");
			
			SimpleDateFormat eduFormat=new SimpleDateFormat("yyyy-MM-dd");
			Date edu1=eduFormat.parse(mr.getParameter("edu1"));
			Date edu2=eduFormat.parse(mr.getParameter("edu2"));
			
			String time1=mr.getParameter("time1");
			String time2=mr.getParameter("time2");
			String time=time1+"~"+time2;
			
			SimpleDateFormat acceptFormat=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			Date accept1=acceptFormat.parse(mr.getParameter("accept1"));
			Date accept2=acceptFormat.parse(mr.getParameter("accept2"));
			
			String[] weeks=mr.getParameterValues("week");
			String week="";
			for(int i=0;i<weeks.length;i++) {
				if(i==0) {
					week+=weeks[i];
				}else {
					week+=","+weeks[i];
				}
			}
			String capacity=mr.getParameter("capacity");
			String waitingCap=mr.getParameter("waitingCap");
			String poster=mr.getFilesystemName("poster");
			String content=mr.getParameter("content");
			
			ProgramVO vo=new ProgramVO();
			vo.setTitle(title);
			vo.setTarget1(target1);
			vo.setTarget2(target2);
			vo.setPlace(place);
			vo.setEdu1_str(eduFormat.format(edu1));
			vo.setEdu2_str(eduFormat.format(edu2));
			vo.setTime(time);
			vo.setAccept1_str(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(accept1));
			vo.setAccept2_str(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(accept2));
			vo.setWeek(week);
			vo.setCapacity(Integer.parseInt(capacity));
			vo.setWaitingCap(Integer.parseInt(waitingCap));
			File file=new File(path+"\\"+poster);
			vo.setPoster(poster);
			vo.setPoster_size((int) file.length());
			vo.setContent(content);
			
			AdminDAO dao=AdminDAO.newInstance();
			dao.programInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:../admin/programList.do";
	}
	@RequestMapping("admin/programUpdate.do")
	public String admin_programUpdate(HttpServletRequest request,HttpServletResponse response) {
		String pno=request.getParameter("pno");
		AdminDAO dao=AdminDAO.newInstance();
		ProgramVO vo=dao.programUpdateData(Integer.parseInt(pno));
		SimpleDateFormat acceptFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			vo.setAccept1_str(
					new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(
							acceptFormat.parse(vo.getAccept1_str())
					)
			);
			vo.setAccept2_str(
					new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(
							acceptFormat.parse(vo.getAccept2_str())
					)
			);
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		System.out.println(vo.getPno());
//		System.out.println(vo.getPoster());
//		System.out.println(vo.getPoster_size());
//		System.out.println(vo.getTitle());
//		System.out.println(vo.getContent());
//		System.out.println(vo.getTarget1());
//		System.out.println(vo.getTarget2());
//		System.out.println(vo.getPlace());
//		System.out.println(vo.getEdu1_str());
//		System.out.println(vo.getEdu2_str());
//		System.out.println(vo.getTime());
//		System.out.println(vo.getWeek());
//		System.out.println(vo.getAccept1_str());
//		System.out.println(vo.getAccept2_str());
//		System.out.println(vo.getCapacity());
//		System.out.println(vo.getWaitingCap());
		request.setAttribute("vo", vo);
		request.setAttribute("admin_jsp", "../adminpage/admin_programUpdate.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/programUpdate_ok.do")
	public String admin_programUpdate_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			String path="C:\\download";
			String enctype="UTF-8";
			int max_size=1024*1024*500;
//			MultipartRequest mr=new MultipartRequest(request, path, max_size, enctype,new DefaultFileRenamePolicy());
			MultipartRequest mr=new MultipartRequest(request, path, max_size, enctype);
			String pno=mr.getParameter("pno");
			String title=mr.getParameter("title");
			
			String[] targets= {
				"영유아","어린이","청소년","성인","누구나"	
			};
			String[] target1s=mr.getParameterValues("target1");
			String target1="";
			for(int i=0;i<target1s.length;i++) {
				if(i==0) {
					target1+=targets[Integer.parseInt(target1s[i])];
				}else {
					target1+=","+targets[Integer.parseInt(target1s[i])];
				}
			}
			
			String target2=mr.getParameter("target2");
			String place=mr.getParameter("place");
			
			SimpleDateFormat eduFormat=new SimpleDateFormat("yyyy-MM-dd");
			Date edu1=eduFormat.parse(mr.getParameter("edu1"));
			Date edu2=eduFormat.parse(mr.getParameter("edu2"));
			
			String time1=mr.getParameter("time1");
			String time2=mr.getParameter("time2");
			String time=time1+"~"+time2;
			
			SimpleDateFormat acceptFormat=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			Date accept1=acceptFormat.parse(mr.getParameter("accept1"));
			Date accept2=acceptFormat.parse(mr.getParameter("accept2"));
			
			String[] weeks=mr.getParameterValues("week");
			String week="";
			for(int i=0;i<weeks.length;i++) {
				if(i==0) {
					week+=weeks[i];
				}else {
					week+=","+weeks[i];
				}
			}
			String capacity=mr.getParameter("capacity");
			String waitingCap=mr.getParameter("waitingCap");
			String poster=mr.getFilesystemName("poster");
			String content=mr.getParameter("content");
			
			ProgramVO vo=new ProgramVO();
			vo.setPno(Integer.parseInt(pno));
			vo.setTitle(title);
			vo.setTarget1(target1);
			vo.setTarget2(target2);
			vo.setPlace(place);
			vo.setEdu1_str(eduFormat.format(edu1));
			vo.setEdu2_str(eduFormat.format(edu2));
			vo.setTime(time);
			vo.setAccept1_str(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(accept1));
			vo.setAccept2_str(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(accept2));
			vo.setWeek(week);
			vo.setCapacity(Integer.parseInt(capacity));
			vo.setWaitingCap(Integer.parseInt(waitingCap));
			File file=new File(path+"\\"+poster);
			vo.setPoster(poster);
			vo.setPoster_size((int) file.length());
			vo.setContent(content);
			
			AdminDAO dao=AdminDAO.newInstance();
			dao.programUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:../admin/programList.do";
	}
	@RequestMapping("admin/programDelete.do")
	public String admin_programDelete(HttpServletRequest request,HttpServletResponse response) {
		String pno=request.getParameter("pno");
		AdminDAO dao=AdminDAO.newInstance();
		dao.programDelete(Integer.parseInt(pno));
		return "redirect:../admin/programList.do";
	}
	@RequestMapping("admin/bookManagement.do")
	public String admin_bookManagement(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		AdminDAO dao=AdminDAO.newInstance();
		List<BookReserve> list=dao.bookReserveListData(curpage);
		int list_size=list.size();
		int totalcount=dao.bookReserveTotalCnt();
		int count=totalcount;
		int totalpage=(int)(Math.ceil(count/dao.getROW_SIZE()));
		count=count-((curpage*dao.getROW_SIZE())-dao.getROW_SIZE());
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("list", list);
		request.setAttribute("list_size", list_size);
		request.setAttribute("totalcount", totalcount);
		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("admin_jsp", "../adminpage/admin_bookManagement.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminPage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/bookReserveAuthorize.do")
	public String admin_bookReserveAuthorize(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		String isbn=request.getParameter("isbn");
		AdminDAO dao=AdminDAO.newInstance();
		dao.bookReserveAuthorize(Integer.parseInt(no), isbn);
		
		return "redirect:../admin/bookManagement.do";
	}
}
