package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dao.*;
import com.sist.dbcp.*;
public class AllLikeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPConnection dbconn = new CreateDBCPConnection();
	private static AllLikeDAO dao;
	
	public static AllLikeDAO newInstance() {
		if(dao==null) dao = new AllLikeDAO();
		
		return dao;
	}
}
