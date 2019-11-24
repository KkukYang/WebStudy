package com.tjoeun.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

//DEPT ���̺� ���ο� �μ������� �����ϴ� JDBC ���α׷� �ۼ�
public class InsertDeptApp {
	public static void main(String[] args) {
		//JDBC ���� �ڿ������� �����ϱ� ���� ���������� try ���� �ۿ��� ����
		// => �ٸ� �������� ���������� �̿��Ͽ� ��ü ��� ����
		Connection con=null;
		Statement stmt=null;
		try {
			//1.Driver ��ü�� �����Ͽ� JDBC Driver ��ü�� ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2.DBMS ������ �����Ͽ� ���������� ��ȯ�޾� ����
			//DriverManager.getConnection(String url, String user, String password) : 
			//DBMS ������ �����Ͽ� Connection ��ü(��������)�� ��ȯ�ϴ� �޼ҵ�
			//URL : ���ͳݿ� �����ϴ� �ڿ��� ǥ���ϱ� ���� �ּ�
			//Oracle URL >> jdbc:oracle:thin:@ServerName:Port:SID
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String password="tiger";
			con=DriverManager.getConnection(url, user, password);
			//System.out.println("Connection ��ü = "+con);
			
			//3.SQL ����� �����ϱ� ���� ��ü�� ��ȯ�޾� ����
			//Connection.createStatement() : SQL ����� �����ϱ� ���� Statement ��ü�� ��ȯ�ϴ� �޼ҵ�
			stmt=con.createStatement();
			
			//4.SQL ����� �����Ͽ� ����� ����� ��ȯ�޾� ����
			//Statement.executeUpdate(String sql) : SQL ���(DML - INSERT,UPDATE,DELETE)��  
			//�����Ͽ� ����� ���(�������� ���� - int)�� ��ȯ�ϴ� �޼ҵ�
			//Statement.executeQuery(String sql) : SQL ���(DQL - SELECT)�� �����Ͽ� �����
			//���(�˻��� - ResultSet ��ü)�� ��ȯ�ϴ� �޼ҵ�
			String sql="insert into dept values(90,'�ѹ���','������')";
			int rows=stmt.executeUpdate(sql);
			
			//5.��ȯ���� ����� �̿��� ó�� �۾�
			System.out.println("[���]"+rows+"���� �μ������� ���� �Ͽ����ϴ�.");
		} catch (ClassNotFoundException e) {
			System.out.println("[����]����̹� Ŭ������ ã�� �� �����ϴ�.");
		} catch (SQLException e) {
			System.out.println("[����]SQL ���� = "+e.getMessage());
		} finally {
			//6.JDBC ���� ��ü ���� - Connection ��ü �ʼ� ����
			// => ���� ���� �ݴ�� ��ü ����
			try {
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
			} catch (SQLException e) {	}
		}
		
	}
}







