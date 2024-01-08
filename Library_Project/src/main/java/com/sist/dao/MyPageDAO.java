package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.AllLikeVO;
import com.sist.vo.BookDeliverVO;
import com.sist.vo.ProgramApplicationVO;
import com.sist.vo.UserVO;

public class MyPageDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MyPageDAO dao;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	private final int ROW=10;
	private String[] searchTypes= {
			"booktitle",
			"bookperson",
			"bookpublisher"
	};
	private String[] programApplst= {
			"title",
			"place"
	};
	
	public static MyPageDAO newInstance() {
		if(dao==null) dao=new MyPageDAO();
		return dao;
	}
	
	public int getROW() {
		return ROW;
	}
	// 좋아요 도서 리스트(검색X)
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
	// 좋아요 도서 리스트(검색O)
	public List<AllLikeVO> likeBookList(int page,String id,String search,int searchType){
		List<AllLikeVO> list=new ArrayList<AllLikeVO>();
		try {
			conn=dbconn.getConnection();
			String st=searchTypes[searchType];
			String sql="SELECT ino,NO,bookaccessionno,booktitle,bookperson,bookpublisher,userid,num "
						+ "FROM (SELECT ino,NO,bookaccessionno,booktitle,bookperson,bookpublisher,userid,rownum AS num "
						+ "FROM (SELECT ino,NO,bookaccessionno,booktitle,bookperson,bookpublisher,userid "
						+ "FROM bookinfo JOIN all_like "
						+ "ON bookinfo.isbn=all_like.NO "
						+ "WHERE userid=? "
						+ "AND typeno=0 "
						+ "AND "+st+" LIKE '%'||?||'%' "
						+ "ORDER BY ino DESC)) "
						+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			int start=(page*ROW)-(ROW-1);
			int end=page*ROW;
			ps.setString(2, search);
			ps.setInt(3, start);
			ps.setInt(4, end);
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
	// 좋아요 도서 총 갯수(검색O)
	public int likeBookTotalCount(String id,String search,int searchType) {
		int count=0;
		try {
			conn=dbconn.getConnection();
			String st=searchTypes[searchType];
			String sql="SELECT COUNT(*) "
					+ "FROM bookinfo JOIN all_like "
					+ "ON bookinfo.isbn=all_like.NO "
					+ "WHERE userid=? "
					+ "AND typeno=0 "
					+ "AND "+st+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, search);
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
	// 좋아요 도서 총 갯수(검색X)
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
	// 좋아요 도서 취소
	public void likeBookDelete(int ino) {
		try {
			conn=dbconn.getConnection();
			String sql="DELETE FROM all_like "
					+ "WHERE ino="+ino;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	// 마이페이지 기본정보화면 출력내용
	public UserVO userBasicInfo(String id) {
		UserVO vo=new UserVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT userid,name,TO_CHAR(signdate,'YYYY-MM-DD'),phone,email "
					+ "FROM userjoin "
					+ "WHERE userid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setUserID(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setSigndate_str(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setEmail(rs.getString(5));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 결제 내역 출력
	public List<BookDeliverVO> userPurchaseList(int page, String userid)
	{
		List<BookDeliverVO> list=new ArrayList<BookDeliverVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT image, booktitle, fixedprice, sumprice, orderdate, orderNum, userid, num "
					+"FROM (SELECT image, booktitle, fixedprice, sumprice, orderdate, orderNum, userid, rownum as num "
					+"FROM (SELECT image, booktitle, fixedprice, sumprice, orderdate, orderNum, userid "
					+"FROM BOOKINFO "
					+"JOIN BOOKDELIVERY ON BOOKINFO.ISBN=BOOKDELIVERY.ISBN "
					+"WHERE userid=?)) "
					+"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			int startPage=(ROW*page)-(ROW-1);
			int endPage=ROW*page;
			ps.setInt(2, startPage);
			ps.setInt(3, endPage);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				BookDeliverVO vo=new BookDeliverVO();
				vo.setImage(rs.getString(1));
				vo.setBooktitle(rs.getString(2));
				vo.setFixedprice(rs.getInt(3));
				vo.setSumprice(rs.getInt(4));
				vo.setOrderDate(rs.getDate(5));
				vo.setOrderNum(rs.getInt(6));
				vo.setUserid(rs.getString(7));
				list.add(vo);
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	// 결제내역 totalpage
	public int userPurchaseTotalpage()
	{
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM BOOKDELIVERY";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
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
	
	// 결제 내역 상세페이지
    public BookDeliverVO bookBuyDetail(int orderNum, String userid)
    {
       BookDeliverVO vo=new BookDeliverVO();
       try {
          conn=dbconn.getConnection();
          String sql="SELECT image, booktitle, saleprice, sumprice, orderdate, userid "
                +"FROM BOOKINFO "
                +"JOIN BOOKDELIVERY ON BOOKINFO.ISBN=BOOKDELIVERY.ISBN "
                +"WHERE userid=?)) "
                +"WHERE orderNum="+orderNum;
          ps=conn.prepareStatement(sql);
          ps.setString(1, userid);
          ResultSet rs=ps.executeQuery();
          rs.next();
          vo.setImage(rs.getString(1));
          vo.setBooktitle(rs.getString(2));
          vo.setSaleprice(rs.getInt(3));
          vo.setSumprice(rs.getInt(4));
          vo.setOrderDate(rs.getDate(5));
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
    
    // 프로그램 신청내역 조회(검색X)
 	public List<ProgramApplicationVO> myProgramApplList(int page,String userid){
 		List<ProgramApplicationVO> list=new ArrayList<ProgramApplicationVO>();
 		try {
 			conn=dbconn.getConnection();
 			String sql="SELECT pno,title,place,TO_CHAR(edu1,'YYYY-MM-DD'),TO_CHAR(edu2,'YYYY-MM-DD'),"
 					+ "status,num "
 					+ "FROM (SELECT pno,title,place,edu1,edu2,status,rownum as num "
 					+ "FROM (SELECT /*+INDEX_DESC(program_application pa_no_pk */pa.pno,title,place,edu1,edu2,pa.status "
 					+ "FROM program JOIN program_application pa "
 					+ "ON program.pno=pa.pno "
 					+ "WHERE userid=?)) "
 					+ "WHERE num BETWEEN ? AND ?";
 			ps=conn.prepareStatement(sql);
 			int start=(page*ROW)-(ROW-1);
 			int end=page*ROW;
 			ps.setString(1, userid);
 			ps.setInt(2, start);
 			ps.setInt(3, end);
 			ResultSet rs=ps.executeQuery();
 			while(rs.next()) {
 				ProgramApplicationVO vo=new ProgramApplicationVO();
 				vo.setPno(rs.getInt(1));
 				vo.getPvo().setTitle(rs.getString(2));
 				vo.getPvo().setPlace(rs.getString(3));
 				vo.getPvo().setEdu1_str(rs.getString(4));
 				vo.getPvo().setEdu2_str(rs.getString(5));
 				vo.setStatus(rs.getInt(6));
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
 	// 프로그램 신청내역 조회(검색O)
 	public List<ProgramApplicationVO> myProgramApplList(int page,String userid,String search,int searchType,String edu1,String edu2){
 		List<ProgramApplicationVO> list=new ArrayList<ProgramApplicationVO>();
 		try {
 			conn=dbconn.getConnection();
 			String st=programApplst[searchType];
 			String sql="SELECT pno,title,place,TO_CHAR(edu1,'YYYY-MM-DD'),TO_CHAR(edu2,'YYYY-MM-DD'),"
 					+ "status,num "
 					+ "FROM (SELECT pno,title,place,edu1,edu2,status,rownum as num "
 					+ "FROM (SELECT /*+INDEX_DESC(program_application pa_no_pk */pa.pno,title,place,edu1,edu2,pa.status "
 					+ "FROM program JOIN program_application pa "
 					+ "ON program.pno=pa.pno"
 					+ "WHERE userid=?)) "
 					+ "WHERE num BETWEEN ? AND ?";
 			ps=conn.prepareStatement(sql);
 			int start=(page*ROW)-(ROW-1);
 			int end=page*ROW;
 			ps.setString(1, userid);
 			ps.setInt(2, start);
 			ps.setInt(3, end);
 			ResultSet rs=ps.executeQuery();
 			while(rs.next()) {
 				ProgramApplicationVO vo=new ProgramApplicationVO();
 				vo.setPno(rs.getInt(1));
 				vo.getPvo().setTitle(rs.getString(2));
 				vo.getPvo().setPlace(rs.getString(3));
 				vo.getPvo().setEdu1_str(rs.getString(4));
 				vo.getPvo().setEdu2_str(rs.getString(5));
 				vo.setStatus(rs.getInt(6));
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
 	// 프로그램 신청내역 총 갯수(검색X)
 	public int myProgramApplTotalCount(String userid) {
 		int totalcount=0;
 		try {
 			conn=dbconn.getConnection();
 			String sql="SELECT COUNT(*) "
 					+ "FROM program_application "
 					+ "WHERE userid=?";
 			ps=conn.prepareStatement(sql);
 			ps.setString(1, userid);
 			ResultSet rs=ps.executeQuery();
 			rs.next();
 			totalcount=rs.getInt(1);
 			rs.close();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbconn.disConnection(conn, ps);
 		}
 		return totalcount;
 	}
 	// 프로그램 신청내역 총 갯수(검색O)
 	public int myProgramApplTotalCount(String userid,String search,int searchType,String edu1,String edu2) {
 		int totalcount=0;
 		try {
 			conn=dbconn.getConnection();
 			String sql="SELECT COUNT(*) "
 					+ "FROM program_application "
 					+ "WHERE userid=?";
 			ps=conn.prepareStatement(sql);
 			ps.setString(1, userid);
 			ResultSet rs=ps.executeQuery();
 			rs.next();
 			totalcount=rs.getInt(1);
 			rs.close();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbconn.disConnection(conn, ps);
 		}
 		return totalcount;
 	}
}
