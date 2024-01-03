package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.BoardVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.ProgramVO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	private final int ROW=10;
	
	public static BoardDAO newInstance() {
		if(dao==null) dao=new BoardDAO();
		return dao;
	}
	
	public int getROW() {
		return ROW;
	}
	
	public List<BoardVO> boardMainData(){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),rownum "
					+ "FROM board "
					+ "WHERE rownum<=5 "
					+ "ORDER BY no DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setDbday(rs.getString(4));
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
	// typeno 1 공지사항
	// typeno 2 보도자료
	public List<NoticeVO> noticeListData(int page,int typeno){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,typeno,title,TO_CHAR(wrDate,'YYYY-MM-DD'),hit,filesize,status,num "
					+ "FROM (SELECT no,typeno,title,wrDate,hit,filesize,status,rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(seoul_notice snt_no_pk) */no,typeno,title,wrDate,hit,filesize,status "
					+ "FROM seoul_notice "
					+ "WHERE typeno=?)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, typeno);
			int start=(page*ROW)-(ROW-1);
			int end=page*ROW;
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				NoticeVO vo=new NoticeVO();
				vo.setNo(rs.getInt(1));
				vo.setTypeno(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setFilesize(rs.getInt(6));
				vo.setStatus(rs.getString(7));
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
	
	public int noticeTotalCnt(int typeno) {
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM seoul_notice "
					+ "WHERE typeno="+typeno;
			ps=conn.prepareStatement(sql);
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
	
	public NoticeVO noticeDetailData(int no,int typeno) {
		NoticeVO vo=new NoticeVO();
		try {
			conn=dbconn.getConnection();
			String sql="UPDATE seoul_notice SET "
					+ "hit=hit+1 "
					+ "WHERE no="+no+" AND typeno="+typeno;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
			
			sql="SELECT no,typeno,title,content,TO_CHAR(wrDate,'YYYY-MM-DD'),hit,filename,filesize "
					+ "FROM seoul_notice "
					+ "WHERE no="+no+" AND typeno="+typeno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setTypeno(rs.getInt(2));
			vo.setTitle(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}

	public List<ProgramVO> calendarProgramData(int year,int month){
		List<ProgramVO> list=new ArrayList<ProgramVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT pno,title,TO_CHAR(edu1,'YYYY-MM-DD'),TO_CHAR(edu2,'YYYY-MM-DD'),week "
					+ "FROM program "
					+ "WHERE week IN ('0','1','2','3','4','5','6') "
					+ "ORDER BY edu1 DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ProgramVO vo=new ProgramVO();
				vo.setPno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setEdu1_str(rs.getString(3));
				vo.setEdu2_str(rs.getString(4));
				vo.setWeek(rs.getString(5));
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
}
