package com.tjoeun.basic;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//Ű����� �μ��̸��� �Է¹޾� DEPT ���̺� ����� �ش� �μ������� �˻��Ͽ� ����ϴ� JDBC ���α׷� �ۼ�
public class DeptSearchApp {
	public static void main(String[] args) throws Exception {
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));

		System.out.println("<<�μ����� �˻�>>");
		System.out.print("�˻��� �μ��̸� >> ");
		String dname=br.readLine();
		
		//DEPT ���̺� ����� �μ������� �˻��Ͽ� ���
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		Connection con=DriverManager.getConnection(url, user, password);
		
		/*
		Statement stmt=con.createStatement();
		
		//Statement ��ü�� InSQL ���ݿ� ���
		// => InSQL : �Է°����� SQL ������ �����Ͽ� SQL ����� �����ϴ� ���� ���
		String sql="select * from dept where dname='"+dname+"'";
		ResultSet rs=stmt.executeQuery(sql);
		*/
		
		//InSQL ������ ����ϱ� ���� PreparedStatement ��ü�� �̿��ϴ� ���� ����
		String sql="select * from dept where dname=?";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1, dname);
		
		ResultSet rs=stmt.executeQuery();
		
		if(rs.next()) {
			do {
				System.out.println("[���]�μ���ȣ = "+rs.getInt("deptno")
					+", �μ��̸� = "+rs.getString("dname")+", �μ���ġ = "+rs.getString("loc"));
			} while(rs.next());
		} else {
			System.out.println("[���]�˻��� �μ������� �����ϴ�.");
		}
		
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(con!=null) con.close();
	}
}
