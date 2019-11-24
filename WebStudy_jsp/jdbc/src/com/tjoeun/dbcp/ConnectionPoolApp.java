package com.tjoeun.dbcp;

import java.sql.Connection;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

//컨넥션풀(ConnectionPool) : Connection 객체를 미리 생성하여 여러 개 저장하기 위한 클래스
// => JDBC 프로그램 실행 속도 향상 및 시스템 변경에 대한 유지보수의 효율성 증가
public class ConnectionPoolApp {
	public static void main(String[] args) throws Exception {
		//PoolDataSourceFactory.getPoolDataSource() : PoolDataSource 객체를 반환하는 메소드
		//PoolDataSource : 컨넥션풀 기능을 제공하는 객체
		PoolDataSource pds=PoolDataSourceFactory.getPoolDataSource();
		
		pds.setConnectionFactoryClassName("oracle.jdbc.driver.OracleDriver");
		pds.setURL("jdbc:oracle:thin:@localhost:1521:xe");
		pds.setUser("scott");
		pds.setPassword("tiger");
		
		pds.setInitialPoolSize(2);
		pds.setMaxPoolSize(3);
		
		Connection con1=pds.getConnection();
		System.out.println("con1 = "+con1);
		System.out.println("Connection 갯수 = "+pds.getAvailableConnectionsCount());
		//con1.close();
		
		Connection con2=pds.getConnection();
		System.out.println("con2 = "+con2);
		System.out.println("Connection 갯수 = "+pds.getAvailableConnectionsCount());
		//con2.close();
		
		Connection con3=pds.getConnection();
		System.out.println("con3 = "+con3);
		System.out.println("Connection 갯수 = "+pds.getAvailableConnectionsCount());
		//con3.close();
		
		Connection con4=pds.getConnection();
		System.out.println("con4 = "+con3);
		System.out.println("Connection 갯수 = "+pds.getAvailableConnectionsCount());
		con4.close();
		
		System.out.println("Connection 갯수 = "+pds.getAvailableConnectionsCount());
	}
}







