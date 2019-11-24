package com.tjoeun.dbcp;

import java.sql.Connection;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

//���ؼ�Ǯ(ConnectionPool) : Connection ��ü�� �̸� �����Ͽ� ���� �� �����ϱ� ���� Ŭ����
// => JDBC ���α׷� ���� �ӵ� ��� �� �ý��� ���濡 ���� ���������� ȿ���� ����
public class ConnectionPoolApp {
	public static void main(String[] args) throws Exception {
		//PoolDataSourceFactory.getPoolDataSource() : PoolDataSource ��ü�� ��ȯ�ϴ� �޼ҵ�
		//PoolDataSource : ���ؼ�Ǯ ����� �����ϴ� ��ü
		PoolDataSource pds=PoolDataSourceFactory.getPoolDataSource();
		
		pds.setConnectionFactoryClassName("oracle.jdbc.driver.OracleDriver");
		pds.setURL("jdbc:oracle:thin:@localhost:1521:xe");
		pds.setUser("scott");
		pds.setPassword("tiger");
		
		pds.setInitialPoolSize(2);
		pds.setMaxPoolSize(3);
		
		Connection con1=pds.getConnection();
		System.out.println("con1 = "+con1);
		System.out.println("Connection ���� = "+pds.getAvailableConnectionsCount());
		//con1.close();
		
		Connection con2=pds.getConnection();
		System.out.println("con2 = "+con2);
		System.out.println("Connection ���� = "+pds.getAvailableConnectionsCount());
		//con2.close();
		
		Connection con3=pds.getConnection();
		System.out.println("con3 = "+con3);
		System.out.println("Connection ���� = "+pds.getAvailableConnectionsCount());
		//con3.close();
		
		Connection con4=pds.getConnection();
		System.out.println("con4 = "+con3);
		System.out.println("Connection ���� = "+pds.getAvailableConnectionsCount());
		con4.close();
		
		System.out.println("Connection ���� = "+pds.getAvailableConnectionsCount());
	}
}







