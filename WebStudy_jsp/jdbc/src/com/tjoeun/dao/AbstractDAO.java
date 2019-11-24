package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

//DAO Ŭ������ ��� �޾ƾ� �Ǵ� �θ�Ŭ����
// => Connection ��ü�� ��ȯ�ϴ� �޼ҵ�� JDBC ���� ��ü�� �����ϴ� �޼ҵ� ����
// => ��ü ������ ������ �ƴϰ� ����� ������ Ŭ������ �߻�Ŭ������ �����ϴ� ���� ����
public abstract class AbstractDAO {
	//�ý��� �ʵ� : Ŭ���� ���ο����� ����ϱ� ���� �ʵ� - _ ��ȣ�� ����
	private static PoolDataSource _pds;
	
	//��������(Static Block) : Ŭ������ �޸𸮿� �ε��� �� ����Ǵ� ����� �ۼ��ϴ� ����
	static {
		try {
			_pds=PoolDataSourceFactory.getPoolDataSource();
			
			_pds.setConnectionFactoryClassName("oracle.jdbc.driver.OracleDriver");
			_pds.setURL("jdbc:oracle:thin:@localhost:1521:xe");
			_pds.setUser("scott");
			_pds.setPassword("tiger");
			
			_pds.setInitialPoolSize(10);
			_pds.setMaxPoolSize(12);
			
			_pds.getConnection().close();
		} catch (SQLException e) {
			System.out.println("[����]DBCP ���� = "+e.getMessage());
		}
	}
	
	public Connection getConnection() throws SQLException {
		return _pds.getConnection();
	}
	
	public void close(Connection con) {
		try {
			if(con!=null) con.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
}







