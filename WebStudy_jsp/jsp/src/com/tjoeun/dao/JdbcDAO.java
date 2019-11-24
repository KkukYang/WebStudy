package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

//DAO Ŭ�������� ���� �������� ����� �����ϴ� Ŭ����
// => DAO Ŭ������ ��� �޾ƾ� �Ǵ� Ŭ���� - �߻�Ŭ����
public abstract class JdbcDAO {
	private static DataSource source;
	
	static {
		try {
			InitialContext context=new InitialContext();
			source=(DataSource)context.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException {
		return source.getConnection();
	}
	
	public void close(Connection con) {
		try {
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
