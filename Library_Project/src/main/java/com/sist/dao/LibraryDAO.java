package com.sist.dao;
import com.sist.dbcp.*;
import com.sist.vo.*;
import java.util.*;
import java.sql.*;

public class LibraryDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPConnection dbconn = new CreateDBCPConnection();
	private static LibraryDAO dao;
	
	public static LibraryDAO newInstance() {
		if(dao==null) dao = new LibraryDAO();
		
		return dao;
	}
	
	public ArrayList<MajorctVO> Major_Classification(){
		ArrayList<MajorctVO> list = new ArrayList<MajorctVO>();
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT cate,cno,icon "
					+ "FROM majorct";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MajorctVO vo = new MajorctVO();
				vo.setCate(rs.getString(1));
				vo.setCno(rs.getInt(2));
				vo.setIcon(rs.getString(3));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public ArrayList<bookInfoVO> BookInfoData(int cno,int page){

		ArrayList<bookInfoVO> list = new ArrayList<bookInfoVO>();
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT booktitle,image,bookauthor,bookpublisher,bookcallnum,bookdate,bookaccessionno,booklocation,isbn,num "
					+ "FROM (SELECT booktitle,image,bookauthor,bookpublisher,bookcallnum,bookdate,bookaccessionno,booklocation,isbn,rownum as num "
					+ "FROM (SELECT booktitle,image,bookauthor,bookpublisher,bookcallnum,bookdate,bookaccessionno,booklocation,bookinfo.isbn "
					+ "FROM bookinfo JOIN bookmain ON bookinfo.isbn = bookmain.isbn WHERE bookmain.cno="+cno+")) "
					+ "WHERE num BETWEEN ? AND ?";
			
			int row_size = 12;
			int start = (row_size*page)-(row_size-1);
			int end = (row_size*page);
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bookInfoVO vo = new bookInfoVO();
				vo.setBooktitle(rs.getString(1));
				vo.setImage(rs.getString(2));
				vo.setBookauthor(rs.getString(3));
				vo.setBookpublisher(rs.getString(4));
				vo.setBookcallnum(rs.getString(5));
				vo.setBookdate(rs.getString(6));
				vo.setBookaccessionno(rs.getString(7));
				vo.setBooklocation(rs.getString(8));
				vo.setIsbn(rs.getString(9));
				
				list.add(vo);
			}
			rs.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int BookInfoTotal(int cno) {
		int total= 0;
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12) "
					+ "FROM bookinfo JOIN bookmain "
					+ "ON bookinfo.isbn = bookmain.isbn "
					+ "WHERE bookmain.cno="+cno;
			
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	
	public bookInfoVO BookDetailSearch(String isbn) {
		bookInfoVO vo = new bookInfoVO();
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT isbn,booktitle,bookauthor,bookpublisher,bookdtype,bookperson,booksign,bookdate,bookaccessionno,bookcallnum,booklocation,image,bookinfo "
					+ "FROM bookinfo WHERE isbn=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			vo.setIsbn(rs.getString(1));
			vo.setBooktitle(rs.getString(2));
			vo.setBookauthor(rs.getString(3));
			vo.setBookpublisher(rs.getString(4));
			vo.setBookdtype(rs.getString(5));
			vo.setBookperson(rs.getString(6));
			vo.setBooksign(rs.getString(7));
			vo.setBookdate(rs.getString(8));
			vo.setBookaccessionno(rs.getString(9));
			vo.setBookcallnum(rs.getString(10));
			vo.setBooklocation(rs.getString(11));
			vo.setImage(rs.getString(12));
			vo.setBookinfo(rs.getString(13));
			
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	public String SearchCookieData(String isbn) {
		String data = "";
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT booktitle FROM bookinfo WHERE isbn=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			data = rs.getString(1);
			rs.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		
		return data;
	}
	
	public ArrayList<MiddlectVO> SearchSubmenuData() {
		ArrayList<MiddlectVO> list = new ArrayList<MiddlectVO>();
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT mno,cno,cate FROM middlect";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MiddlectVO vo = new MiddlectVO();
				vo.setMno(rs.getString(1));
				vo.setCno(rs.getInt(2));
				vo.setCate(rs.getString(3));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
}
