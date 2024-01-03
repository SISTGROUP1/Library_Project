package com.sist.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.vo.NoticeVO;
import com.sist.vo.ProgramVO;

public class BoardModel {
	@RequestMapping("Board/notice.do")
	public String board_announcement(HttpServletRequest request,HttpServletResponse response) {
		String typeno=request.getParameter("typeno");
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		
		BoardDAO dao=BoardDAO.newInstance();
		List<NoticeVO> list=dao.noticeListData(curpage, Integer.parseInt(typeno));
		int totalcnt=dao.noticeTotalCnt(Integer.parseInt(typeno));
		int totalpage=(int) Math.ceil(totalcnt/(double)dao.getROW());
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) endPage=totalpage;
		
		request.setAttribute("typeno", typeno);
		request.setAttribute("curpage", curpage);
		request.setAttribute("list", list);
		request.setAttribute("totalcnt", totalcnt);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("board_jsp", "../Board/notice.jsp");
		request.setAttribute("main_jsp", "../Board/board_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("Board/notice_detail.do")
	public String board_notice_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		String typeno=request.getParameter("typeno");
		BoardDAO dao=BoardDAO.newInstance();
		NoticeVO vo=dao.noticeDetailData(Integer.parseInt(no), Integer.parseInt(typeno));
		
		request.setAttribute("vo", vo);
		request.setAttribute("board_jsp", "../Board/notice_detail.jsp");
		request.setAttribute("main_jsp", "../Board/board_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("Board/calendar.do")
	public String board_calendar(HttpServletRequest request,HttpServletResponse response) {
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		StringTokenizer st=new StringTokenizer(today, "-");
		int year=Integer.parseInt(st.nextToken());
		int month=Integer.parseInt(st.nextToken());
		int day=Integer.parseInt(st.nextToken());
		String strYear=request.getParameter("year");
		if(strYear!=null) year=Integer.parseInt(strYear);
		String strMonth=request.getParameter("month");
		if(strMonth!=null) month=Integer.parseInt(strMonth);
//		String[] strWeek= {
//			"일","월","화","수","목","금","토"	
//		};
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1);
		int week=cal.get(Calendar.DAY_OF_WEEK);
		week=week-1; 
		int lastday=cal.getActualMaximum(Calendar.DATE);
		
//		BoardDAO dao=BoardDAO.newInstance();
//		List<ProgramVO> list=dao.calendarProgramData(year,month);
//		for(ProgramVO vo:list) {
//			Date edu1=null;
//			Date edu2=null;
//			Calendar cal1=null;
//			Calendar cal2=null;
//			List<Date> curDate=new ArrayList<Date>();
//			try {
//				edu1=new SimpleDateFormat("yyyy-M-d").parse(vo.getEdu1_str());
//				cal1=Calendar.getInstance();
//				cal1.setTime(edu1);
////				System.out.println("db저장값 : "+vo.getEdu1_str());
////				System.out.println("cal저장값 : "+cal1.get(Calendar.YEAR)+"-"+(cal1.get(Calendar.MONTH)+1)+"-"+cal1.get(Calendar.DATE));
//				edu2=new SimpleDateFormat("yyyy-M-d").parse(vo.getEdu2_str());
//				cal2=Calendar.getInstance();
//				cal2.setTime(edu2);
//				
//				int result=cal1.compareTo(cal2);
//				if(result==0) {
//					curDate.add(edu1);
//				}else {
//					curDate.add(edu1);
//					while(true) {
//						cal1.add(Calendar.DAY_OF_MONTH, 7);
//						edu1=cal1.getTime();
//						curDate.add(edu1);
//						if(cal1.compareTo(cal2)==0) break;
//					}
//				}
//				vo.setCurDate(curDate);
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
////			System.out.println(vo.getTitle()+"||"+vo.getEdu1_str()+"-"+vo.getEdu2_str());
////			String cd=vo.getCurrentdate();
////			System.out.println(cd);
//		}
		
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
//		request.setAttribute("list", list);
		request.setAttribute("board_jsp", "../Board/calendar.jsp");
		request.setAttribute("main_jsp", "../Board/board_main.jsp");
		return "../main/main.jsp";
	}
}
