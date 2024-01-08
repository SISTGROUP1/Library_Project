package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.ProgramApplicationVO;
import com.sist.vo.ProgramVO;

public class ProgramDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static ProgramDAO dao;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	private final int ROW_SIZE=12;
	private String[] targets= {
			"",
			"영유아",
			"어린이",
			"청소년",
			"성인",
			"누구나"
	};
	
	public static ProgramDAO newInstance() {
		if(dao==null) dao=new ProgramDAO();
		return dao;
	}
	
	public List<ProgramVO> programSlideData(){
		List<ProgramVO> list=new ArrayList<ProgramVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT pno,poster,title,num "
					+ "FROM (SELECT pno,poster,title,rownum as num "
					+ "FROM (SELECT pno,poster,title "
					+ "FROM program "
					+ "ORDER BY pno DESC)) "
					+ "WHERE num BETWEEN 1 AND 4";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ProgramVO vo=new ProgramVO();
				vo.setPno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public List<ProgramVO> programListData(int page,int target,String searchType,String search){
		List<ProgramVO> list=new ArrayList<ProgramVO>();
		try {
			conn=dbconn.getConnection();
			String t=targets[target];
			String sql="SELECT pno,poster,title,target1,TO_CHAR(edu1,'YYYY-MM-DD'),TO_CHAR(edu2,'YYYY-MM-DD'),capacity,applicant,waiting,waitingCap,status,num "
					+ "FROM (SELECT pno,poster,title,target1,edu1,edu2,capacity,applicant,waiting,waitingCap,status,rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(program pg_pno_pk)*/pno,poster,title,target1,edu1,edu2,"
					+ "capacity,applicant,waiting,waitingCap,status "
					+ "FROM program "
					+ "WHERE "+searchType+" LIKE '%'||?||'%' "
					+ "AND target1 LIKE '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int start=(ROW_SIZE*page)-(ROW_SIZE-1);
			int end=ROW_SIZE*page;
			ps.setString(1, search);
			ps.setString(2, t);
			ps.setInt(3, start);
			ps.setInt(4, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ProgramVO vo=new ProgramVO();
				vo.setPno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setTarget1(rs.getString(4));
				vo.setEdu1_str(rs.getString(5));
				vo.setEdu2_str(rs.getString(6));
				vo.setCapacity(rs.getInt(7));
				vo.setApplicant(rs.getInt(8));
				vo.setWaiting(rs.getInt(9));
				vo.setWaitingCap(rs.getInt(10));
				vo.setStatus(rs.getInt(11));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int programListTotalPage(int target,String searchType,String search) {
		int total=0;
		try {
			conn=dbconn.getConnection();
			String t=targets[target];
			String sql="SELECT CEIL(COUNT(*)/"+ROW_SIZE+") "
					+ "FROM program "
					+ "WHERE "+searchType+" LIKE '%'||?||'%' "
					+ "AND target1 LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, search);
			ps.setString(2, t);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	
	public int programFindCnt(int target,String searchType,String search) {
		int find_cnt=0;
		try {
			conn=dbconn.getConnection();
			String t=targets[target];
			String sql="SELECT COUNT(*) "
					+ "FROM program "
					+ "WHERE "+searchType+" LIKE '%'||?||'%' "
					+ "AND target1 LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, search);
			ps.setString(2, t);
			ResultSet rs=ps.executeQuery();
			rs.next();
			find_cnt=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return find_cnt;
	}
	
	public ProgramVO programDetailData(int pno) {
		ProgramVO vo=new ProgramVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT pno,poster,title,target1,target2,place,TO_CHAR(edu1,'YYYY-MM-DD'),TO_CHAR(edu2,'YYYY-MM-DD'),"
					+ "TO_CHAR(accept1,'YYYY-MM-DD HH24:MI'),TO_CHAR(accept2,'YYYY-MM-DD HH24:MI'),capacity,"
					+ "applicant,waiting,waitingCap,status,content "
					+ "FROM program "
					+ "WHERE pno="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setPno(rs.getInt(1));
			vo.setPoster(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setTarget1(rs.getString(4));
			vo.setTarget2(rs.getString(5));
			vo.setPlace(rs.getString(6));
			vo.setEdu1_str(rs.getString(7));
			vo.setEdu2_str(rs.getString(8));
			vo.setAccept1_str(rs.getString(9));
			vo.setAccept2_str(rs.getString(10));
			vo.setCapacity(rs.getInt(11));
			vo.setApplicant(rs.getInt(12));
			vo.setWaiting(rs.getInt(13));
			vo.setWaitingCap(rs.getInt(14));
			vo.setStatus(rs.getInt(15));
			vo.setContent(rs.getString(16));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	public ProgramVO programCookieData(int pno) {
		ProgramVO vo=new ProgramVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT pno,poster,title "
					+ "FROM program "
					+ "WHERE pno="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()==false) {
				vo=null;
			}else {
				vo.setPno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 프로그램 초기화(접수날짜를 현재시간과 비교,접수예정->접수중 접수중->접수마감)
	// 프로그램 리스트,프로그램 상세보기,프로그램 관리,프로그램 신청
	// pno==0 접수기간 판별, !=0 사용자의 프로그램 신청 후 상태 조정
	public void programStatusUpdate(int pno) {
		try {
			conn=dbconn.getConnection();
			String sql="";
			if(pno==0) {
				sql="UPDATE program SET "
						+ "status=1 "
						+ "WHERE TO_CHAR(accept1,'YYYY-MM-DD HH24:MI')<=TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI') "
						+ "AND status=0";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
				sql="UPDATE program SET "
						+ "status=3 "
						+ "WHERE TO_CHAR(accept2,'YYYY-MM-DD HH24:MI')<=TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI') "
						+ "AND status=1";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
			}
			if(pno!=0) {
				sql="UPDATE program SET "
						+ "status= "
						+ "CASE "
						+ "WHEN applicant<capacity THEN 1 "
						+ "WHEN applicant=capacity AND waiting<waitingCap THEN 2 "
						+ "WHEN waiting=waitingCap THEN 3 "
						+ "ELSE status "
						+ "END";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	// 프로그램 신청 여부 판별
	public int programIsAppl(int pno,String userid) {
		int isAppl=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM program_application "
					+ "WHERE pno=? AND userid=? AND status=1";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.setString(2, userid);
			ResultSet rs=ps.executeQuery();
			rs.next();
			isAppl=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return isAppl;
	}
	// 프로그램 신청
	public ProgramApplicationVO programApplication(int pno,String userid) {
		ProgramApplicationVO vo=new ProgramApplicationVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT status,waiting "
					+ "FROM program "
					+ "WHERE pno="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int status=rs.getInt(1);
			int waiting=rs.getInt(2);
			rs.close();
			ps.close();
			if(status==1) {
				sql="UPDATE program SET "
						+ "applicant=applicant+1 "
						+ "WHERE pno="+pno;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
				sql="INSERT INTO program_application(no,userid,pno) "
						+ "VALUES (pa_no_seq.nextval,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, userid);
				ps.setInt(2, pno);
				ps.executeUpdate();
				ps.close();
				programStatusUpdate(pno);
			}else if(status==2) {
				sql="UPDATE program SET "
						+ "waiting=waiting+1 "
						+ "WHERE pno="+pno;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
				sql="INSERT INTO program_application(no,userid,pno,waitingNo) "
						+ "VALUES (pa_no_seq.nextval,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, userid);
				ps.setInt(2, pno);
				ps.setInt(3, waiting+1);
				ps.executeUpdate();
				ps.close();
				programStatusUpdate(pno);
			}else if(status==3) {
				vo.setMsg("NO");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
}
