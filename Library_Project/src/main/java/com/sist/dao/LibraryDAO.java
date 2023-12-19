package com.sist.dao;
import com.sist.dbcp.*;
import com.sist.vo.*;
import java.util.*;
import java.util.Date;
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
		/*
		 * private String isbn,booktitle,bookauthor,bookpublisher,bookdtype,bookperson,booksign,bookdate,bookaccessionno,bookcallnum,booklocation;
		   private int bino,fixedprice,saleprice;
		   private String bookinfo,contents,authorinfo,image;
	       private Date acquisition;
		 * */
		ArrayList<bookInfoVO> list = new ArrayList<bookInfoVO>();
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT booktitle,image,bookauthor,bookpublisher,bookcallnum,bookdate,num "
					+ "FROM (SELECT booktitle,image,bookauthor,bookpublisher,bookcallnum,bookdate,rownum as num "
					+ "FROM (SELECT booktitle,image,bookauthor,bookpublisher,bookcallnum,bookdate "
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
}
