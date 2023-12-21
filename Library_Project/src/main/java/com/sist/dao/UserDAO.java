package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	private static UserDAO dao;
	
	public static UserDAO newInstance()
	{
		if(dao==null)
			dao=new UserDAO();
		return dao;
	}
	
	// 우편번호 검색
	public  List<ZipcodeVO> postFind(String dong)
	{
		List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		try 
		{
			conn=dbconn.getConnection();
			String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') "   // bunji가 null이면 공백 출력해라
					  +"FROM zipcode "
					  +"WHERE dong LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ZipcodeVO vo=new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setGugun(rs.getString(3));
				vo.setDong(rs.getString(4));
				vo.setBunji(rs.getString(5));
				list.add(vo);
			}
			rs.close();			
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
}
