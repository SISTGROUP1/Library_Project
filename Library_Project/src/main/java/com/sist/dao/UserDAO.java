package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.UserVO;

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
}
