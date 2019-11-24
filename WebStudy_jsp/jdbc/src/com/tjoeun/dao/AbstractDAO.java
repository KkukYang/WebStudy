package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

//DAO 클래스가 상속 받아야 되는 부모클래스
// => Connection 객체를 반환하는 메소드와 JDBC 관련 객체를 제거하는 메소드 선언
// => 객체 생성이 목적이 아니고 상속이 목적인 클래스는 추상클래스로 선언하는 것을 권장
public abstract class AbstractDAO {
	//시스템 필드 : 클래스 내부에서만 사용하기 위한 필드 - _ 기호로 시작
	private static PoolDataSource _pds;
	
	//정적영역(Static Block) : 클래스가 메모리에 로딩된 후 실행되는 명령을 작성하는 영역
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
			System.out.println("[에러]DBCP 오류 = "+e.getMessage());
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







