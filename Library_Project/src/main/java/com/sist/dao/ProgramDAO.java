package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
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
			String sql="SELECT pno,poster,title,target1,TO_CHAR(edu1,'YYYY-MM-DD'),TO_CHAR(edu2,'YYYY-MM-DD'),capacity,num "
					+ "FROM (SELECT pno,poster,title,target1,edu1,edu2,capacity,rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(program pg_pno_pk)*/pno,poster,title,target1,edu1,edu2,capacity "
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
			String sql="SELECT pno,poster,title,target1,target2,place,TO_CHAR(edu1,'YYYY-MM-DD HH24:MI'),TO_CHAR(edu2,'YYYY-MM-DD HH24:MI'),"
					+ "TO_CHAR(accept1,'YYYY-MM-DD HH24:MI'),TO_CHAR(accept2,'YYYY-MM-DD HH24:MI'),capacity,hit "
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
			vo.setHit(rs.getInt(12));
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
			rs.next();
			vo.setPno(rs.getInt(1));
			vo.setPoster(rs.getString(2));
			vo.setTitle(rs.getString(3));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
}
