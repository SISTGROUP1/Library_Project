package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.controller.RequestMapping;
import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.BoardVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.QnaCommentVO;
import com.sist.vo.QnaVO;

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
	
	public List<NoticeVO> noticeMainData(){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,typeno,title,TO_CHAR(wrdate,'YYYY-MM-DD'),rownum "
					+ "FROM seoul_notice "
					+ "WHERE status='n' "
					+ "ORDER BY no DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				NoticeVO vo=new NoticeVO();
				vo.setNo(rs.getInt(1));
				vo.setTypeno(rs.getInt(2));
				vo.setTitle(rs.getString(3));
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
	// typeno 0 공지사항
	// typeno 1 보도자료
	public List<NoticeVO> noticeListData(int page,int typeno){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,typeno,title,TO_CHAR(wrDate,'YYYY-MM-DD'),hit,filesize,status,num "
					+ "FROM (SELECT no,typeno,title,wrDate,hit,filesize,status,rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(seoul_notice snt_no_pk) */no,typeno,title,wrDate,hit,filesize,status "
					+ "FROM seoul_notice "
					+ "WHERE typeno=? "
					+ "ORDER BY status DESC,wrDate DESC)) "
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
	
	//////////////////////////////////////////////////////////////
	///////////////// 관리자 Notice
	// 공지사항 및 보도자료 추가
	public void noticeInsert(NoticeVO vo) {
		try {
			conn=dbconn.getConnection();
			String sql="INSERT INTO seoul_notice(NO,typeno,title,content,filename,filesize,status) "
					+ "VALUES (snt_no_seq.nextval,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getTypeno());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getFilename());
			ps.setInt(5, vo.getFilesize());
			ps.setString(6, vo.getStatus());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	// 공지사항 수정 화면
	public NoticeVO noticeUpdateData(int no,int typeno) {
		NoticeVO vo=new NoticeVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,typeno,title,content,status "
					+ "FROM seoul_notice "
					+ "WHERE no=? AND typeno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setInt(2, typeno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setTypeno(rs.getInt(2));
			vo.setTitle(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setStatus(rs.getString(5));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	// 공지사항 수정
	public void noticeUpdate(NoticeVO vo) {
		try {
			conn=dbconn.getConnection();
			String sql="UPDATE seoul_notice SET "
					+ "title=?,content=?,filename=?,filesize=?,status=? "
					+ "WHERE no=? AND typeno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getFilename());
			ps.setInt(4, vo.getFilesize());
			ps.setString(5, vo.getStatus());
			ps.setInt(6, vo.getNo());
			ps.setInt(7, vo.getTypeno());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	//////////////////////////////////////////////////////////////
	///////////////// 사용자 QNA
	public List<QnaVO> qnaListData(int page){
		List<QnaVO> list=new ArrayList<QnaVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,userid,name,title,TO_CHAR(wrDate,'YYYY-MM-DD'),status,locking,num "
					+ "FROM (SELECT no,userid,name,title,wrDate,status,locking,rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(seoul_qna sq_no_pk) */no,userid,name,title,wrDate,status,locking "
					+ "FROM seoul_qna)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int start=(page*ROW)-(ROW-1);
			int end=page*ROW;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				QnaVO vo=new QnaVO();
				vo.setNo(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setTitle(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setStatus(rs.getString(6));
				vo.setLocking(rs.getString(7));
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
	// QNA 총 갯수
	public int qnaTotalCnt() {
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM seoul_qna";
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
	// QNA 상세보기
	public QnaVO qnaDetailData(int no) {
		QnaVO vo=new QnaVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,userid,name,title,content,TO_CHAR(wrDate,'YYYY-MM-DD'),status "
					+ "FROM seoul_qna "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setUserid(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setTitle(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setStatus(rs.getString(7));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	// 사용자 QNA 추가
	public void qnaInsertData(QnaVO vo) {
		try {
			conn=dbconn.getConnection();
			String sql="INSERT INTO seoul_qna(no,userid,name,title,content,locking) "
					+ "VALUES (sq_no_seq.nextval,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getLocking());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	// 사용자 QNA 수정 화면
	public QnaVO qnaUpdateData(int no) {
		QnaVO vo=new QnaVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,title,content,locking "
					+ "FROM seoul_qna "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setLocking(rs.getString(4));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	// 사용자 QNA 수정
	public void qnaUpdate(QnaVO vo) {
		try {
			conn=dbconn.getConnection();
			String sql="UPDATE seoul_qna SET "
					+ "title=?,content=?,locking=? "
					+ "WHERE no="+vo.getNo();
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getLocking());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	// 사용자 QNA 삭제
	public void qnaDelete(int no) {
		try {
			conn=dbconn.getConnection();
			String sql="DELETE FROM seoul_qna "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	
	///////////////// 관리자 QNA
	// QNA 답글 추가
	public void qnaInsertComment(QnaCommentVO vo) {
		try {
			conn=dbconn.getConnection();
			String sql="UPDATE seoul_qna SET "
					+ "status='y' "
					+ "WHERE no="+vo.getSqno();
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
			
			sql="INSERT INTO seoul_qna_comment(no,sqno,title,content) "
					+ "VALUES (sqc_no_seq.nextval,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getSqno());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	// QNA 답글 수정
	public QnaCommentVO qnaSelectComment(int no) {
		QnaCommentVO vo=new QnaCommentVO();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT no,title,content,TO_CHAR(wrDate,'YYYY-MM-DD HH24:MI') "
					+ "FROM seoul_qna_comment "
					+ "WHERE sqno="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setDbday(rs.getString(4));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	// QNA 답글 삭제
	public void qnaDeleteComment(int no) {
		try {
			conn=dbconn.getConnection();
			String sql="UPDATE seoul_qna_comment SET "
					+ "title='관리자가 삭제한 답글입니다.',content='관리자가 삭제한 답글입니다.' "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	
	//////////////////////////////////////////////////////////////

	public List<ProgramVO> calendarProgramData(String year,String month){
		List<ProgramVO> list=new ArrayList<ProgramVO>();
		if(month.length()==1) month="0"+month;
		String ym=year+"-"+month;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT pno,title,TO_CHAR(edu1,'YYYY-MM-DD'),TO_CHAR(edu2,'YYYY-MM-DD'),week "
					+ "FROM program "
					+ "WHERE week IN ('0','1','2','3','4','5','6') "
					+ "AND (?>=TO_CHAR(edu1,'YYYY') AND ?<=TO_CHAR(edu2,'YYYY')) "
					+ "AND ?<=TO_CHAR(edu2,'YYYY-MM') "
					+ "AND ?>=TO_CHAR(edu1,'YYYY-MM') "
					+ "ORDER BY edu1";
			ps=conn.prepareStatement(sql);
			ps.setString(1, year);
			ps.setString(2, year);
			ps.setString(3, ym);
			ps.setString(4, ym);
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
