package com.tjoeun.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//DEPT ���̺� ����� ��� �μ������� �˻��Ͽ� ����ϴ� JDBC ���α׷� �ۼ�
public class SelectDeptApp {
	public static void main(String[] args) {
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String password="tiger";
			con=DriverManager.getConnection(url, user, password);
			
			stmt=con.createStatement();
			
			String sql="select * from dept order by deptno";
			//ResultSet : �˻��� ������ �����ϱ� ���� ��ü
			// => Ŀ���� �̿��Ͽ� �ϳ��� �ุ ó�� ����
			// => Ŀ���� ResultSet ��ü�� BOF(Before Of File) ������ ��ġ
			rs=stmt.executeQuery(sql);
			
			//ResultSet.next() : Ŀ���� ���������� �̵��ϴ� �޼ҵ�
			// => �̵��� Ŀ�� ��ġ�� EOF(End Of File)�� ������ ��� false ��ȯ
			// => �̵��� Ŀ�� ��ġ�� �˻����� ������ ��� true ��ȯ
			/*
			if(rs.next()) {
				System.out.println("[���]�˻��� �μ������� �ֽ��ϴ�.");
			} else {
				System.out.println("[���]�˻��� �μ������� �����ϴ�.");
			}
			*/
			
			while(rs.next()) {
				//ResultSet.getXXX({int columnIndex|String columnName) : Ŀ�� ��ġ�� �˻��࿡ ���� �÷����� ��ȯ�ϴ� �޼ҵ�
				// => XXX : Java �ڷ��� - Oracle �ڷ����� ������� getString() �޼ҵ带 �̿��Ͽ� ���ڿ��� ��ȯ
				// => columnIndex : �˻���� ���� ����(Index)
				// => columnName : �˻���� ���� �̸�(columnName, AliasName) - ����
				//int deptno=rs.getInt(1);
				int deptno=rs.getInt("deptno");
				String dname=rs.getString("dname");
				String loc=rs.getString("loc");
				
				System.out.println("�μ���ȣ = "+deptno+", �μ��̸� = "+dname+", �μ���ġ = "+loc);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("[����]����̹� Ŭ������ ã�� �� �����ϴ�.");
		} catch (SQLException e) {
			System.out.println("[����]SQL ���� = "+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
			} catch (SQLException e) {}
		}
	}
}





