package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.AllLikeVO;

public class MyPageDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MyPageDAO dao;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	private final int ROW=10;
	
	public static MyPageDAO newInstance() {
		if(dao==null) dao=new MyPageDAO();
		return dao;
	}
	
	public int getROW() {
		return ROW;
	}
	
	public List<AllLikeVO> likeBookList(int page,String id){
		List<AllLikeVO> list=new ArrayList<AllLikeVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT ino,NO,bookaccessionno,booktitle,bookperson,bookpublisher,userid,num "
					+ "FROM (SELECT ino,NO,bookaccessionno,booktitle,bookperson,bookpublisher,userid,rownum AS num "
					+ "FROM (SELECT ino,NO,bookaccessionno,booktitle,bookperson,bookpublisher,userid "
					+ "FROM bookinfo JOIN all_like "
					+ "ON bookinfo.isbn=all_like.NO "
					+ "WHERE userid=? "
					+ "AND typeno=0 "
					+ "ORDER BY ino DESC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			int start=(page*ROW)-(ROW-1);
			int end=page*ROW;
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				AllLikeVO vo=new AllLikeVO();
				vo.setIno(rs.getInt(1));
				vo.setNo(rs.getString(2));
				vo.getBivo().setBookaccessionno(rs.getString(3));
				vo.getBivo().setBooktitle(rs.getString(4));
				vo.getBivo().setBookperson(rs.getString(5));
				vo.getBivo().setBookpublisher(rs.getString(6));
				vo.setUserid(rs.getString(7));
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
	
	public int likeBookTotalCount(String id) {
		int count=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM all_like "
					+ "WHERE userid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return count;
	}
}
